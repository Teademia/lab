
user_apps/main:	file format elf64-littleriscv

Disassembly of section .text:

0000000000010078 <_start>:
   10078: 01 11        	addi	sp, sp, -0x20
   1007a: 22 ec        	sd	s0, 0x18(sp)
   1007c: 00 10        	addi	s0, sp, 0x20
   1007e: 85 47        	li	a5, 0x1
   10080: 23 26 f4 fe  	sw	a5, -0x14(s0)
   10084: 09 a8        	j	0x10096 <_start+0x1e>
   10086: 85 47        	li	a5, 0x1
   10088: 23 24 f4 fe  	sw	a5, -0x18(s0)
   1008c: 83 27 c4 fe  	lw	a5, -0x14(s0)
   10090: 85 27        	addiw	a5, a5, 0x1
   10092: 23 26 f4 fe  	sw	a5, -0x14(s0)
   10096: 83 27 c4 fe  	lw	a5, -0x14(s0)
   1009a: 1b 87 07 00  	sext.w	a4, a5
   1009e: a5 47        	li	a5, 0x9
   100a0: e3 d3 e7 fe  	bge	a5, a4, 0x10086 <_start+0xe>
   100a4: 93 08 d0 05  	li	a7, 0x5d
   100a8: 73 00 00 00  	ecall
   100ac: 01 00        	nop
   100ae: 62 64        	ld	s0, 0x18(sp)
   100b0: 05 61        	addi	sp, sp, 0x20
   100b2: 82 80        	ret
