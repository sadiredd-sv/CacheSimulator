/* 
 * CS:APP Cache Lab 
 * 
 * First Name: Santosh Nikhil Kumar 
 * Last Name:  Adireddy
 * UserId: sadiredd
 * EmailId: sadiredd@andrew.cmu.edu
 *
 * csim.c - Source file with my solutions to the Lab.
 *          
*/

#include<stdio.h>
#include<math.h>
#include<getopt.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>

void printSummary(int hits, int misses, int evictions);	//Function called at the end to print the CacheHits, CacheMisses and Evictions

//Each set of the cache contains Lines and each line contains valid bit, tag bits and counter
struct myCache {
    int valid[4];
    char tag[4][64];
    unsigned long counter[4];	// To keep track of the latest access (Implementation of LRU)

};

//Global variables declared because they are used in hectodec() function and in the main function.
char input[100];
char output[200];

/*
* hextobin() function converts the 64 bit address  into binary form(char array)
* This address is one of the INPUTS(each line) from the given TRACE FILE
*/
void hextobin()
{

    int i, j;
    int len = 64 - (4 * strlen(input));
    memset(output, 0, 100);	//Clearing the previous output
    char strt[100] = { 0 };	// This array holds the binary form of the given input address

//Calculating the 64-bit Binary Equivalent of the given input  

    for (j = 0; j < strlen(input); j++) {

	switch (input[j]) {
	case '0':
	    strcat(strt, "0000");
	    break;
	case '1':
	    strcat(strt, "0001");
	    break;
	case '2':
	    strcat(strt, "0010");
	    break;
	case '3':
	    strcat(strt, "0011");
	    break;
	case '4':
	    strcat(strt, "0100");
	    break;
	case '5':
	    strcat(strt, "0101");
	    break;
	case '6':
	    strcat(strt, "0110");
	    break;
	case '7':
	    strcat(strt, "0111");
	    break;
	case '8':
	    strcat(strt, "1000");
	    break;
	case '9':
	    strcat(strt, "1001");
	    break;
	case 'a':
	case 'A':
	    strcat(strt, "1010");
	    break;
	case 'b':
	case 'B':
	    strcat(strt, "1011");
	    break;
	case 'c':
	case 'C':
	    strcat(strt, "1100");
	    break;
	case 'd':
	case 'D':
	    strcat(strt, "1101");
	    break;
	case 'e':
	case 'E':
	    strcat(strt, "1110");
	    break;
	case 'f':
	case 'F':
	    strcat(strt, "1111");
	    break;
	default:
	    printf
		("Entered number is not Hexadecimal.Printed value is not correct.");
	    break;
	}
    }

    for (i = (len - 1); i >= 0; i--)	//Appending zeros to make the address 64 bits
	output[i] = '0';
    strcat(output, strt);	//Attaching the appended zeros string to the binary form of given input address
}


int main(int argc, char **argv)
{
    int i = 0, j, k, small;	//i,j,k are declared to use in loops
    unsigned long lru = 0;
    int opt, xindex, jindex, kindex, lindex, blockbits, setbits, tagsize,
	lines, missstat, linescount;
    int setnumber;
    int totalset = 0;
    int cacheMiss = 0;
    int cacheHit = 0;
    int eviction = 0;
    char *trace;
    char bbits[100];
    char sbits[100];
    char tbits[100];

    FILE *tracefile;		//To open and read the trace files
    char readwrite;		//Stores the operation mode- Modify or Load or Store
    int address;
    int size;

    while ((opt = getopt(argc, argv, "v:s:E:b:t:")) != -1) {	//Based on the parameters passed.
	switch (opt) {		//determine which argument is being processed
	case 't':
	    trace = optarg;
	    break;
	case 's':
	    setbits = atoi(optarg);
	    break;
	case 'b':
	    blockbits = atoi(optarg);
	    break;
	case 'E':
	    lines = atoi(optarg);	//Number of lines in a set
	    break;
	}
    }

    tagsize = 64 - (blockbits + setbits);
    setnumber = pow(2, setbits);
    struct myCache newCache[setnumber];	// Number of sets to be initialized depends on the 'setnumber(Input)'. Hence, declared here.

    //Allocating Space for Tag Bits, initiating tag to 'a' and valid to '0'
    for (i = 0; i < setnumber; i++) {
	for (k = 0; k < 4; k++) {
	    for (j = 0; j < 64; j++) {
		newCache[i].tag[k][j] = 'a';
	    }
	    newCache[i].valid[k] = 0;
	}

    }
    //Opening the trace file in read mode
    tracefile = fopen(trace, "r");
    if (tracefile == NULL) {
	fprintf(stderr, "Error: File is NULL.\n");
	return -1;
    }
    //Reading every line in the file
    while (1) {
	fscanf(tracefile, " %c %x,%d", &readwrite, &address, &size);
	if (readwrite == 'I')	//ignore all instruction cache accesses (lines starting with “I”).
	    continue;
	if (feof(tracefile))
	    break;

	sprintf(input, "%x", address);	//Converting address Hex to into 'input' array of characters
	hextobin();		//Conversion into an array of 64 binary characters 

	//Resolving the Address into tbits(Tagbits), sbits(Setbits), bbits(Blockbits)
	//1. BBITS
	for (xindex = 0, jindex = (64 - blockbits); jindex < 64;
	     jindex++, xindex++) {
	    bbits[xindex] = output[jindex];
	}
	bbits[xindex] = '\0';

	//2. SBITS
	for (xindex = 0, kindex = tagsize; kindex < (64 - (blockbits));
	     kindex++, xindex++) {
	    sbits[xindex] = output[kindex];
	}
	sbits[xindex] = '\0';

	//3. TBITS
	for (xindex = 0, lindex = 0; lindex < tagsize; lindex++, xindex++) {
	    tbits[xindex] = output[lindex];
	}
	tbits[xindex] = '\0';

	totalset = 0;
	/*Convert set bits from char array into integer.
	 * This is to allow the set access using struct variable- newCache[PARTICULAR SET]
	 */
	for (xindex = 0; xindex < setbits; xindex++) {
	    totalset *= 2;
	    if (sbits[xindex] == '1')
		totalset += 1;
	}

	// .........Calculating Hits and Misses..............

	missstat = 0;		// Miss status is set to zero so that it can be updated when there is a hit- DIFFERENTIATING from the hit
	linescount = 0;
	//Hits
	for (k = 0; k < lines; k++) {
	    if ((newCache[totalset].valid[k] == 1)) {
		linescount++;	//This linescount will be equal to the lines in the cache when the cache is full and the required tagbits are not found
		if (strcmp(newCache[totalset].tag[k], tbits) == 0) {	//For every set: If the valid bit is set, compare the input tagbits with the tagbits in all the lines of the set

		    lru++;	// lru counter is incremented globally to keep track of the lastest entries/hits into the cache
		    newCache[totalset].counter[k] = lru;
		    missstat = 1;	// Miss status changed
		    cacheHit++;
		}
	    }
	}
	//When cache miss occurs
	if (missstat == 0) {
	    cacheMiss++;
	    for (k = 0; k < lines; k++) {
		if ((newCache[totalset].valid[k] == 0)) {	//Checking for the EMPTY LINE in the set
		    lru++;
		    newCache[totalset].valid[k] = 1;
		    newCache[totalset].counter[k] = lru;
		    strcpy(newCache[totalset].tag[k], tbits);	// Adding the missed entry into the cache.
		    break;
		}
	    }
	    // When eviction occurs
	    if (linescount == lines) {	//When all the lines in the set are filled and some entry in the set should be EVICTED
		eviction++;
		/* REPLACEMENT LRU:::: Determining the Least recently used 'line/block' in the set
		 * The line/block with the highest 'lru' value is the most recently used one. Hence, the line/block with the smallest 'lru' is the least recently used.
		 */
		small = 0;
		for (k = 1; k < lines; k++) {
		    if ((newCache[totalset].counter[k]) <
			(newCache[totalset].counter[small]))
			small = k;
		}
		lru++;
		newCache[totalset].counter[small] = lru;
		newCache[totalset].valid[small] = 1;
		strcpy(newCache[totalset].tag[small], tbits);	// Evicting the least recently used line/block from the set
	    }

	}

	if (readwrite == 'M')	// Modify= Load + Store. So, an extra hit occurs after a miss or a hit because the data will be put in the cache after FIRST miss.
	    cacheHit++;
    }
    fclose(tracefile);		//Closing the trace file
    printSummary(cacheHit, cacheMiss, eviction);	//Printing the output
}
