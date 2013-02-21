
sample:     file format elf64-x86-64


Disassembly of section .init:

0000000000400358 <_init>:
  400358:	48 83 ec 08          	sub    $0x8,%rsp
  40035c:	e8 5b 00 00 00       	callq  4003bc <call_gmon_start>
  400361:	e8 ea 00 00 00       	callq  400450 <frame_dummy>
  400366:	e8 45 02 00 00       	callq  4005b0 <__do_global_ctors_aux>
  40036b:	48 83 c4 08          	add    $0x8,%rsp
  40036f:	c3                   	retq   

Disassembly of section .plt:

0000000000400370 <__libc_start_main@plt-0x10>:
  400370:	ff 35 ba 05 20 00    	pushq  0x2005ba(%rip)        # 600930 <_GLOBAL_OFFSET_TABLE_+0x8>
  400376:	ff 25 bc 05 20 00    	jmpq   *0x2005bc(%rip)        # 600938 <_GLOBAL_OFFSET_TABLE_+0x10>
  40037c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400380 <__libc_start_main@plt>:
  400380:	ff 25 ba 05 20 00    	jmpq   *0x2005ba(%rip)        # 600940 <_GLOBAL_OFFSET_TABLE_+0x18>
  400386:	68 00 00 00 00       	pushq  $0x0
  40038b:	e9 e0 ff ff ff       	jmpq   400370 <_init+0x18>

Disassembly of section .text:

0000000000400390 <_start>:
  400390:	31 ed                	xor    %ebp,%ebp
  400392:	49 89 d1             	mov    %rdx,%r9
  400395:	5e                   	pop    %rsi
  400396:	48 89 e2             	mov    %rsp,%rdx
  400399:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40039d:	50                   	push   %rax
  40039e:	54                   	push   %rsp
  40039f:	49 c7 c0 10 05 40 00 	mov    $0x400510,%r8
  4003a6:	48 c7 c1 20 05 40 00 	mov    $0x400520,%rcx
  4003ad:	48 c7 c7 cf 04 40 00 	mov    $0x4004cf,%rdi
  4003b4:	e8 c7 ff ff ff       	callq  400380 <__libc_start_main@plt>
  4003b9:	f4                   	hlt    
  4003ba:	90                   	nop
  4003bb:	90                   	nop

00000000004003bc <call_gmon_start>:
  4003bc:	48 83 ec 08          	sub    $0x8,%rsp
  4003c0:	48 8b 05 59 05 20 00 	mov    0x200559(%rip),%rax        # 600920 <_DYNAMIC+0x190>
  4003c7:	48 85 c0             	test   %rax,%rax
  4003ca:	74 02                	je     4003ce <call_gmon_start+0x12>
  4003cc:	ff d0                	callq  *%rax
  4003ce:	48 83 c4 08          	add    $0x8,%rsp
  4003d2:	c3                   	retq   
  4003d3:	90                   	nop
  4003d4:	90                   	nop
  4003d5:	90                   	nop
  4003d6:	90                   	nop
  4003d7:	90                   	nop
  4003d8:	90                   	nop
  4003d9:	90                   	nop
  4003da:	90                   	nop
  4003db:	90                   	nop
  4003dc:	90                   	nop
  4003dd:	90                   	nop
  4003de:	90                   	nop
  4003df:	90                   	nop

00000000004003e0 <__do_global_dtors_aux>:
  4003e0:	55                   	push   %rbp
  4003e1:	48 89 e5             	mov    %rsp,%rbp
  4003e4:	53                   	push   %rbx
  4003e5:	48 83 ec 08          	sub    $0x8,%rsp
  4003e9:	80 3d 60 05 20 00 00 	cmpb   $0x0,0x200560(%rip)        # 600950 <completed.6347>
  4003f0:	75 4b                	jne    40043d <__do_global_dtors_aux+0x5d>
  4003f2:	bb 80 07 60 00       	mov    $0x600780,%ebx
  4003f7:	48 8b 05 5a 05 20 00 	mov    0x20055a(%rip),%rax        # 600958 <dtor_idx.6349>
  4003fe:	48 81 eb 78 07 60 00 	sub    $0x600778,%rbx
  400405:	48 c1 fb 03          	sar    $0x3,%rbx
  400409:	48 83 eb 01          	sub    $0x1,%rbx
  40040d:	48 39 d8             	cmp    %rbx,%rax
  400410:	73 24                	jae    400436 <__do_global_dtors_aux+0x56>
  400412:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400418:	48 83 c0 01          	add    $0x1,%rax
  40041c:	48 89 05 35 05 20 00 	mov    %rax,0x200535(%rip)        # 600958 <dtor_idx.6349>
  400423:	ff 14 c5 78 07 60 00 	callq  *0x600778(,%rax,8)
  40042a:	48 8b 05 27 05 20 00 	mov    0x200527(%rip),%rax        # 600958 <dtor_idx.6349>
  400431:	48 39 d8             	cmp    %rbx,%rax
  400434:	72 e2                	jb     400418 <__do_global_dtors_aux+0x38>
  400436:	c6 05 13 05 20 00 01 	movb   $0x1,0x200513(%rip)        # 600950 <completed.6347>
  40043d:	48 83 c4 08          	add    $0x8,%rsp
  400441:	5b                   	pop    %rbx
  400442:	c9                   	leaveq 
  400443:	c3                   	retq   
  400444:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
  40044b:	00 00 00 00 00 

0000000000400450 <frame_dummy>:
  400450:	48 83 3d 30 03 20 00 	cmpq   $0x0,0x200330(%rip)        # 600788 <__JCR_END__>
  400457:	00 
  400458:	55                   	push   %rbp
  400459:	48 89 e5             	mov    %rsp,%rbp
  40045c:	74 12                	je     400470 <frame_dummy+0x20>
  40045e:	b8 00 00 00 00       	mov    $0x0,%eax
  400463:	48 85 c0             	test   %rax,%rax
  400466:	74 08                	je     400470 <frame_dummy+0x20>
  400468:	bf 88 07 60 00       	mov    $0x600788,%edi
  40046d:	c9                   	leaveq 
  40046e:	ff e0                	jmpq   *%rax
  400470:	c9                   	leaveq 
  400471:	c3                   	retq   
  400472:	90                   	nop
  400473:	90                   	nop

0000000000400474 <f4>:
  400474:	55                   	push   %rbp
  400475:	48 89 e5             	mov    %rsp,%rbp
  400478:	89 7d fc             	mov    %edi,-0x4(%rbp)
  40047b:	f3 0f 11 45 f8       	movss  %xmm0,-0x8(%rbp)
  400480:	c9                   	leaveq 
  400481:	c3                   	retq   

0000000000400482 <f3>:
  400482:	55                   	push   %rbp
  400483:	48 89 e5             	mov    %rsp,%rbp
  400486:	48 83 ec 10          	sub    $0x10,%rsp
  40048a:	89 f8                	mov    %edi,%eax
  40048c:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
  400490:	88 45 fc             	mov    %al,-0x4(%rbp)
  400493:	f3 0f 10 05 85 01 00 	movss  0x185(%rip),%xmm0        # 400620 <__dso_handle+0x20>
  40049a:	00 
  40049b:	bf 05 00 00 00       	mov    $0x5,%edi
  4004a0:	e8 cf ff ff ff       	callq  400474 <f4>
  4004a5:	c9                   	leaveq 
  4004a6:	c3                   	retq   

00000000004004a7 <f2>:
  4004a7:	55                   	push   %rbp
  4004a8:	48 89 e5             	mov    %rsp,%rbp
  4004ab:	be 08 06 40 00       	mov    $0x400608,%esi
  4004b0:	bf 6b 00 00 00       	mov    $0x6b,%edi
  4004b5:	e8 c8 ff ff ff       	callq  400482 <f3>
  4004ba:	c9                   	leaveq 
  4004bb:	c3                   	retq   

00000000004004bc <f1>:
  4004bc:	55                   	push   %rbp
  4004bd:	48 89 e5             	mov    %rsp,%rbp
  4004c0:	48 83 ec 08          	sub    $0x8,%rsp
  4004c4:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  4004c8:	e8 da ff ff ff       	callq  4004a7 <f2>
  4004cd:	c9                   	leaveq 
  4004ce:	c3                   	retq   

00000000004004cf <main>:
  4004cf:	55                   	push   %rbp
  4004d0:	48 89 e5             	mov    %rsp,%rbp
  4004d3:	48 83 ec 20          	sub    $0x20,%rsp
  4004d7:	48 c7 45 e0 0d 06 40 	movq   $0x40060d,-0x20(%rbp)
  4004de:	00 
  4004df:	48 c7 45 e8 11 06 40 	movq   $0x400611,-0x18(%rbp)
  4004e6:	00 
  4004e7:	48 c7 45 f0 15 06 40 	movq   $0x400615,-0x10(%rbp)
  4004ee:	00 
  4004ef:	48 c7 45 f8 19 06 40 	movq   $0x400619,-0x8(%rbp)
  4004f6:	00 
  4004f7:	48 8d 45 e0          	lea    -0x20(%rbp),%rax
  4004fb:	48 89 c7             	mov    %rax,%rdi
  4004fe:	e8 b9 ff ff ff       	callq  4004bc <f1>
  400503:	b8 00 00 00 00       	mov    $0x0,%eax
  400508:	c9                   	leaveq 
  400509:	c3                   	retq   
  40050a:	90                   	nop
  40050b:	90                   	nop
  40050c:	90                   	nop
  40050d:	90                   	nop
  40050e:	90                   	nop
  40050f:	90                   	nop

0000000000400510 <__libc_csu_fini>:
  400510:	f3 c3                	repz retq 
  400512:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400519:	1f 84 00 00 00 00 00 

0000000000400520 <__libc_csu_init>:
  400520:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400525:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40052a:	48 8d 2d 33 02 20 00 	lea    0x200233(%rip),%rbp        # 600764 <__init_array_end>
  400531:	4c 8d 25 2c 02 20 00 	lea    0x20022c(%rip),%r12        # 600764 <__init_array_end>
  400538:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40053d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  400542:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  400547:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40054c:	48 83 ec 38          	sub    $0x38,%rsp
  400550:	4c 29 e5             	sub    %r12,%rbp
  400553:	41 89 fd             	mov    %edi,%r13d
  400556:	49 89 f6             	mov    %rsi,%r14
  400559:	48 c1 fd 03          	sar    $0x3,%rbp
  40055d:	49 89 d7             	mov    %rdx,%r15
  400560:	e8 f3 fd ff ff       	callq  400358 <_init>
  400565:	48 85 ed             	test   %rbp,%rbp
  400568:	74 1c                	je     400586 <__libc_csu_init+0x66>
  40056a:	31 db                	xor    %ebx,%ebx
  40056c:	0f 1f 40 00          	nopl   0x0(%rax)
  400570:	4c 89 fa             	mov    %r15,%rdx
  400573:	4c 89 f6             	mov    %r14,%rsi
  400576:	44 89 ef             	mov    %r13d,%edi
  400579:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40057d:	48 83 c3 01          	add    $0x1,%rbx
  400581:	48 39 eb             	cmp    %rbp,%rbx
  400584:	72 ea                	jb     400570 <__libc_csu_init+0x50>
  400586:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40058b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  400590:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  400595:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40059a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40059f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4005a4:	48 83 c4 38          	add    $0x38,%rsp
  4005a8:	c3                   	retq   
  4005a9:	90                   	nop
  4005aa:	90                   	nop
  4005ab:	90                   	nop
  4005ac:	90                   	nop
  4005ad:	90                   	nop
  4005ae:	90                   	nop
  4005af:	90                   	nop

00000000004005b0 <__do_global_ctors_aux>:
  4005b0:	55                   	push   %rbp
  4005b1:	48 89 e5             	mov    %rsp,%rbp
  4005b4:	53                   	push   %rbx
  4005b5:	48 83 ec 08          	sub    $0x8,%rsp
  4005b9:	48 8b 05 a8 01 20 00 	mov    0x2001a8(%rip),%rax        # 600768 <__CTOR_LIST__>
  4005c0:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4005c4:	74 19                	je     4005df <__do_global_ctors_aux+0x2f>
  4005c6:	bb 68 07 60 00       	mov    $0x600768,%ebx
  4005cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4005d0:	48 83 eb 08          	sub    $0x8,%rbx
  4005d4:	ff d0                	callq  *%rax
  4005d6:	48 8b 03             	mov    (%rbx),%rax
  4005d9:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4005dd:	75 f1                	jne    4005d0 <__do_global_ctors_aux+0x20>
  4005df:	48 83 c4 08          	add    $0x8,%rsp
  4005e3:	5b                   	pop    %rbx
  4005e4:	c9                   	leaveq 
  4005e5:	c3                   	retq   
  4005e6:	90                   	nop
  4005e7:	90                   	nop

Disassembly of section .fini:

00000000004005e8 <_fini>:
  4005e8:	48 83 ec 08          	sub    $0x8,%rsp
  4005ec:	e8 ef fd ff ff       	callq  4003e0 <__do_global_dtors_aux>
  4005f1:	48 83 c4 08          	add    $0x8,%rsp
  4005f5:	c3                   	retq   
