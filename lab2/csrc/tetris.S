
build/tetris:     file format elf32-littleriscv


Disassembly of section .text:

00001000 <_start>:
    1000:	00001137          	lui	sp,0x1
    1004:	00002097          	auipc	ra,0x2
    1008:	be4080e7          	jalr	-1052(ra) # 2be8 <main>

0000100c <loop>:
    100c:	0000006f          	j	100c <loop>

00001010 <enable_interrupt>:
    1010:	00000297          	auipc	t0,0x0
    1014:	02828293          	addi	t0,t0,40 # 1038 <__trap_entry>
    1018:	30529373          	csrrw	t1,mtvec,t0
    101c:	000022b7          	lui	t0,0x2
    1020:	88828293          	addi	t0,t0,-1912 # 1888 <move+0x28>
    1024:	30029373          	csrrw	t1,mstatus,t0
    1028:	00008067          	ret

0000102c <get_epc>:
    102c:	34102573          	csrr	a0,mepc
    1030:	00008067          	ret

00001034 <tran_handler>:
    1034:	00008067          	ret

00001038 <__trap_entry>:
    1038:	34011073          	csrw	mscratch,sp
    103c:	f8010113          	addi	sp,sp,-128 # f80 <_start-0x80>
    1040:	00112223          	sw	ra,4(sp)
    1044:	00312623          	sw	gp,12(sp)
    1048:	00412823          	sw	tp,16(sp)
    104c:	00512a23          	sw	t0,20(sp)
    1050:	00612c23          	sw	t1,24(sp)
    1054:	00712e23          	sw	t2,28(sp)
    1058:	02412023          	sw	tp,32(sp)
    105c:	02912223          	sw	s1,36(sp)
    1060:	02a12423          	sw	a0,40(sp)
    1064:	02b12623          	sw	a1,44(sp)
    1068:	02c12823          	sw	a2,48(sp)
    106c:	02d12a23          	sw	a3,52(sp)
    1070:	02e12c23          	sw	a4,56(sp)
    1074:	02f12e23          	sw	a5,60(sp)
    1078:	05012023          	sw	a6,64(sp)
    107c:	05112223          	sw	a7,68(sp)
    1080:	05212423          	sw	s2,72(sp)
    1084:	05312623          	sw	s3,76(sp)
    1088:	05412823          	sw	s4,80(sp)
    108c:	05512a23          	sw	s5,84(sp)
    1090:	05612c23          	sw	s6,88(sp)
    1094:	05712e23          	sw	s7,92(sp)
    1098:	07812023          	sw	s8,96(sp)
    109c:	07912223          	sw	s9,100(sp)
    10a0:	07a12423          	sw	s10,104(sp)
    10a4:	07b12623          	sw	s11,108(sp)
    10a8:	07c12823          	sw	t3,112(sp)
    10ac:	07d12a23          	sw	t4,116(sp)
    10b0:	07e12c23          	sw	t5,120(sp)
    10b4:	07f12e23          	sw	t6,124(sp)
    10b8:	34102573          	csrr	a0,mepc
    10bc:	342025f3          	csrr	a1,mcause
    10c0:	00001097          	auipc	ra,0x1
    10c4:	6f0080e7          	jalr	1776(ra) # 27b0 <trap_handler>
    10c8:	00412083          	lw	ra,4(sp)
    10cc:	00c12183          	lw	gp,12(sp)
    10d0:	01012203          	lw	tp,16(sp)
    10d4:	01412283          	lw	t0,20(sp)
    10d8:	01812303          	lw	t1,24(sp)
    10dc:	01c12383          	lw	t2,28(sp)
    10e0:	02012203          	lw	tp,32(sp)
    10e4:	02412483          	lw	s1,36(sp)
    10e8:	02812503          	lw	a0,40(sp)
    10ec:	02c12583          	lw	a1,44(sp)
    10f0:	03012603          	lw	a2,48(sp)
    10f4:	03412683          	lw	a3,52(sp)
    10f8:	03812703          	lw	a4,56(sp)
    10fc:	03c12783          	lw	a5,60(sp)
    1100:	04012803          	lw	a6,64(sp)
    1104:	04412883          	lw	a7,68(sp)
    1108:	04812903          	lw	s2,72(sp)
    110c:	04c12983          	lw	s3,76(sp)
    1110:	05012a03          	lw	s4,80(sp)
    1114:	05412a83          	lw	s5,84(sp)
    1118:	05812b03          	lw	s6,88(sp)
    111c:	05c12b83          	lw	s7,92(sp)
    1120:	06012c03          	lw	s8,96(sp)
    1124:	06412c83          	lw	s9,100(sp)
    1128:	06812d03          	lw	s10,104(sp)
    112c:	06c12d83          	lw	s11,108(sp)
    1130:	07012e03          	lw	t3,112(sp)
    1134:	07412e83          	lw	t4,116(sp)
    1138:	07812f03          	lw	t5,120(sp)
    113c:	07c12f83          	lw	t6,124(sp)
    1140:	34002173          	csrr	sp,mscratch
    1144:	30200073          	mret

00001148 <wk_mul>:
    1148:	fe010113          	addi	sp,sp,-32
    114c:	00112e23          	sw	ra,28(sp)
    1150:	00812c23          	sw	s0,24(sp)
    1154:	02010413          	addi	s0,sp,32
    1158:	fea42a23          	sw	a0,-12(s0)
    115c:	feb42823          	sw	a1,-16(s0)
    1160:	00000513          	li	a0,0
    1164:	fea42623          	sw	a0,-20(s0)
    1168:	0040006f          	j	116c <wk_mul+0x24>
    116c:	ff042503          	lw	a0,-16(s0)
    1170:	00000593          	li	a1,0
    1174:	04b50863          	beq	a0,a1,11c4 <wk_mul+0x7c>
    1178:	0040006f          	j	117c <wk_mul+0x34>
    117c:	ff044503          	lbu	a0,-16(s0)
    1180:	00157513          	andi	a0,a0,1
    1184:	00000593          	li	a1,0
    1188:	00b50e63          	beq	a0,a1,11a4 <wk_mul+0x5c>
    118c:	0040006f          	j	1190 <wk_mul+0x48>
    1190:	ff442583          	lw	a1,-12(s0)
    1194:	fec42503          	lw	a0,-20(s0)
    1198:	00b50533          	add	a0,a0,a1
    119c:	fea42623          	sw	a0,-20(s0)
    11a0:	0040006f          	j	11a4 <wk_mul+0x5c>
    11a4:	0040006f          	j	11a8 <wk_mul+0x60>
    11a8:	ff442503          	lw	a0,-12(s0)
    11ac:	00151513          	slli	a0,a0,0x1
    11b0:	fea42a23          	sw	a0,-12(s0)
    11b4:	ff042503          	lw	a0,-16(s0)
    11b8:	40155513          	srai	a0,a0,0x1
    11bc:	fea42823          	sw	a0,-16(s0)
    11c0:	fadff06f          	j	116c <wk_mul+0x24>
    11c4:	fec42503          	lw	a0,-20(s0)
    11c8:	01812403          	lw	s0,24(sp)
    11cc:	01c12083          	lw	ra,28(sp)
    11d0:	02010113          	addi	sp,sp,32
    11d4:	00008067          	ret

000011d8 <make_xywh>:
    11d8:	fe010113          	addi	sp,sp,-32
    11dc:	00112e23          	sw	ra,28(sp)
    11e0:	00812c23          	sw	s0,24(sp)
    11e4:	02010413          	addi	s0,sp,32
    11e8:	fea42a23          	sw	a0,-12(s0)
    11ec:	feb42823          	sw	a1,-16(s0)
    11f0:	fec42623          	sw	a2,-20(s0)
    11f4:	fed42423          	sw	a3,-24(s0)
    11f8:	ff442503          	lw	a0,-12(s0)
    11fc:	00c51513          	slli	a0,a0,0xc
    1200:	ff042583          	lw	a1,-16(s0)
    1204:	00459593          	slli	a1,a1,0x4
    1208:	00b56533          	or	a0,a0,a1
    120c:	fec42583          	lw	a1,-20(s0)
    1210:	00259593          	slli	a1,a1,0x2
    1214:	00b56533          	or	a0,a0,a1
    1218:	fe842583          	lw	a1,-24(s0)
    121c:	00b56533          	or	a0,a0,a1
    1220:	01812403          	lw	s0,24(sp)
    1224:	01c12083          	lw	ra,28(sp)
    1228:	02010113          	addi	sp,sp,32
    122c:	00008067          	ret

00001230 <init_block>:
    1230:	fd010113          	addi	sp,sp,-48
    1234:	02112623          	sw	ra,44(sp)
    1238:	02812423          	sw	s0,40(sp)
    123c:	03010413          	addi	s0,sp,48
    1240:	fea42a23          	sw	a0,-12(s0)
    1244:	feb42823          	sw	a1,-16(s0)
    1248:	fec42623          	sw	a2,-20(s0)
    124c:	fed42423          	sw	a3,-24(s0)
    1250:	00000513          	li	a0,0
    1254:	fea42223          	sw	a0,-28(s0)
    1258:	fea42023          	sw	a0,-32(s0)
    125c:	ff442583          	lw	a1,-12(s0)
    1260:	00a5a423          	sw	a0,8(a1)
    1264:	ff442583          	lw	a1,-12(s0)
    1268:	00a5a223          	sw	a0,4(a1)
    126c:	ff442583          	lw	a1,-12(s0)
    1270:	00a5a023          	sw	a0,0(a1)
    1274:	ff042583          	lw	a1,-16(s0)
    1278:	fcb42e23          	sw	a1,-36(s0)
    127c:	00600513          	li	a0,6
    1280:	12b56c63          	bltu	a0,a1,13b8 <.LBB2_8+0x2c>
    1284:	fdc42503          	lw	a0,-36(s0)
    1288:	00251513          	slli	a0,a0,0x2
    128c:	000035b7          	lui	a1,0x3
    1290:	00058593          	mv	a1,a1
    1294:	00b50533          	add	a0,a0,a1
    1298:	00052503          	lw	a0,0(a0)
    129c:	00050067          	jr	a0

000012a0 <.LBB2_2>:
    12a0:	ff442583          	lw	a1,-12(s0)
    12a4:	00f00513          	li	a0,15
    12a8:	00a5a023          	sw	a0,0(a1) # 3000 <.LJTI2_0>
    12ac:	00300513          	li	a0,3
    12b0:	fea42223          	sw	a0,-28(s0)
    12b4:	00000513          	li	a0,0
    12b8:	fea42023          	sw	a0,-32(s0)
    12bc:	0fc0006f          	j	13b8 <.LBB2_8+0x2c>

000012c0 <.LBB2_3>:
    12c0:	ff442583          	lw	a1,-12(s0)
    12c4:	00300513          	li	a0,3
    12c8:	00a5a023          	sw	a0,0(a1)
    12cc:	ff442583          	lw	a1,-12(s0)
    12d0:	00a5a223          	sw	a0,4(a1)
    12d4:	00100513          	li	a0,1
    12d8:	fea42223          	sw	a0,-28(s0)
    12dc:	fea42023          	sw	a0,-32(s0)
    12e0:	0d80006f          	j	13b8 <.LBB2_8+0x2c>

000012e4 <.LBB2_4>:
    12e4:	ff442583          	lw	a1,-12(s0)
    12e8:	00400513          	li	a0,4
    12ec:	00a5a023          	sw	a0,0(a1)
    12f0:	ff442583          	lw	a1,-12(s0)
    12f4:	00700513          	li	a0,7
    12f8:	00a5a223          	sw	a0,4(a1)
    12fc:	00200513          	li	a0,2
    1300:	fea42223          	sw	a0,-28(s0)
    1304:	00100513          	li	a0,1
    1308:	fea42023          	sw	a0,-32(s0)
    130c:	0ac0006f          	j	13b8 <.LBB2_8+0x2c>

00001310 <.LBB2_5>:
    1310:	ff442583          	lw	a1,-12(s0)
    1314:	00200513          	li	a0,2
    1318:	00a5a023          	sw	a0,0(a1)
    131c:	ff442603          	lw	a2,-12(s0)
    1320:	00700593          	li	a1,7
    1324:	00b62223          	sw	a1,4(a2)
    1328:	fea42223          	sw	a0,-28(s0)
    132c:	00100513          	li	a0,1
    1330:	fea42023          	sw	a0,-32(s0)
    1334:	0840006f          	j	13b8 <.LBB2_8+0x2c>

00001338 <.LBB2_6>:
    1338:	ff442583          	lw	a1,-12(s0)
    133c:	00100513          	li	a0,1
    1340:	00a5a023          	sw	a0,0(a1)
    1344:	ff442603          	lw	a2,-12(s0)
    1348:	00700593          	li	a1,7
    134c:	00b62223          	sw	a1,4(a2)
    1350:	00200593          	li	a1,2
    1354:	feb42223          	sw	a1,-28(s0)
    1358:	fea42023          	sw	a0,-32(s0)
    135c:	05c0006f          	j	13b8 <.LBB2_8+0x2c>

00001360 <.LBB2_7>:
    1360:	ff442583          	lw	a1,-12(s0)
    1364:	00600513          	li	a0,6
    1368:	00a5a023          	sw	a0,0(a1)
    136c:	ff442583          	lw	a1,-12(s0)
    1370:	00300513          	li	a0,3
    1374:	00a5a223          	sw	a0,4(a1)
    1378:	00200513          	li	a0,2
    137c:	fea42223          	sw	a0,-28(s0)
    1380:	00100513          	li	a0,1
    1384:	fea42023          	sw	a0,-32(s0)
    1388:	0300006f          	j	13b8 <.LBB2_8+0x2c>

0000138c <.LBB2_8>:
    138c:	ff442583          	lw	a1,-12(s0)
    1390:	00300513          	li	a0,3
    1394:	00a5a023          	sw	a0,0(a1)
    1398:	ff442583          	lw	a1,-12(s0)
    139c:	00600513          	li	a0,6
    13a0:	00a5a223          	sw	a0,4(a1)
    13a4:	00200513          	li	a0,2
    13a8:	fea42223          	sw	a0,-28(s0)
    13ac:	00100513          	li	a0,1
    13b0:	fea42023          	sw	a0,-32(s0)
    13b4:	0040006f          	j	13b8 <.LBB2_8+0x2c>
    13b8:	fec42503          	lw	a0,-20(s0)
    13bc:	fe842583          	lw	a1,-24(s0)
    13c0:	fe442603          	lw	a2,-28(s0)
    13c4:	fe042683          	lw	a3,-32(s0)
    13c8:	00000097          	auipc	ra,0x0
    13cc:	e10080e7          	jalr	-496(ra) # 11d8 <make_xywh>
    13d0:	ff442583          	lw	a1,-12(s0)
    13d4:	00a5a623          	sw	a0,12(a1)
    13d8:	02812403          	lw	s0,40(sp)
    13dc:	02c12083          	lw	ra,44(sp)
    13e0:	03010113          	addi	sp,sp,48
    13e4:	00008067          	ret

000013e8 <get_shape>:
    13e8:	fe010113          	addi	sp,sp,-32
    13ec:	00112e23          	sw	ra,28(sp)
    13f0:	00812c23          	sw	s0,24(sp)
    13f4:	02010413          	addi	s0,sp,32
    13f8:	fea42a23          	sw	a0,-12(s0)
    13fc:	feb42823          	sw	a1,-16(s0)
    1400:	fec42623          	sw	a2,-20(s0)
    1404:	ff442503          	lw	a0,-12(s0)
    1408:	ff042583          	lw	a1,-16(s0)
    140c:	00259593          	slli	a1,a1,0x2
    1410:	00b50533          	add	a0,a0,a1
    1414:	00052503          	lw	a0,0(a0)
    1418:	fec42583          	lw	a1,-20(s0)
    141c:	00100613          	li	a2,1
    1420:	00b61633          	sll	a2,a2,a1
    1424:	00c57533          	and	a0,a0,a2
    1428:	00b55533          	srl	a0,a0,a1
    142c:	01812403          	lw	s0,24(sp)
    1430:	01c12083          	lw	ra,28(sp)
    1434:	02010113          	addi	sp,sp,32
    1438:	00008067          	ret

0000143c <check_bounds>:
    143c:	fd010113          	addi	sp,sp,-48
    1440:	02112623          	sw	ra,44(sp)
    1444:	02812423          	sw	s0,40(sp)
    1448:	03010413          	addi	s0,sp,48
    144c:	fea42823          	sw	a0,-16(s0)
    1450:	ff042503          	lw	a0,-16(s0)
    1454:	00c52503          	lw	a0,12(a0)
    1458:	fea42623          	sw	a0,-20(s0)
    145c:	fec42503          	lw	a0,-20(s0)
    1460:	00357513          	andi	a0,a0,3
    1464:	fea42423          	sw	a0,-24(s0)
    1468:	fec42503          	lw	a0,-20(s0)
    146c:	00c57513          	andi	a0,a0,12
    1470:	00255513          	srli	a0,a0,0x2
    1474:	fea42223          	sw	a0,-28(s0)
    1478:	fec42503          	lw	a0,-20(s0)
    147c:	000015b7          	lui	a1,0x1
    1480:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    1484:	00b57533          	and	a0,a0,a1
    1488:	00455513          	srli	a0,a0,0x4
    148c:	fea42023          	sw	a0,-32(s0)
    1490:	fec42503          	lw	a0,-20(s0)
    1494:	01051513          	slli	a0,a0,0x10
    1498:	01c55513          	srli	a0,a0,0x1c
    149c:	fca42e23          	sw	a0,-36(s0)
    14a0:	00000513          	li	a0,0
    14a4:	02a51063          	bne	a0,a0,14c4 <check_bounds+0x88>
    14a8:	0040006f          	j	14ac <check_bounds+0x70>
    14ac:	fdc42503          	lw	a0,-36(s0)
    14b0:	fe442583          	lw	a1,-28(s0)
    14b4:	00b50533          	add	a0,a0,a1
    14b8:	00a00593          	li	a1,10
    14bc:	00b56a63          	bltu	a0,a1,14d0 <check_bounds+0x94>
    14c0:	0040006f          	j	14c4 <check_bounds+0x88>
    14c4:	00000513          	li	a0,0
    14c8:	fea42a23          	sw	a0,-12(s0)
    14cc:	0400006f          	j	150c <check_bounds+0xd0>
    14d0:	00000513          	li	a0,0
    14d4:	02a51063          	bne	a0,a0,14f4 <check_bounds+0xb8>
    14d8:	0040006f          	j	14dc <check_bounds+0xa0>
    14dc:	fe042503          	lw	a0,-32(s0)
    14e0:	fe842583          	lw	a1,-24(s0)
    14e4:	00b50533          	add	a0,a0,a1
    14e8:	01600593          	li	a1,22
    14ec:	00b56a63          	bltu	a0,a1,1500 <check_bounds+0xc4>
    14f0:	0040006f          	j	14f4 <check_bounds+0xb8>
    14f4:	00000513          	li	a0,0
    14f8:	fea42a23          	sw	a0,-12(s0)
    14fc:	0100006f          	j	150c <check_bounds+0xd0>
    1500:	00100513          	li	a0,1
    1504:	fea42a23          	sw	a0,-12(s0)
    1508:	0040006f          	j	150c <check_bounds+0xd0>
    150c:	ff442503          	lw	a0,-12(s0)
    1510:	02812403          	lw	s0,40(sp)
    1514:	02c12083          	lw	ra,44(sp)
    1518:	03010113          	addi	sp,sp,48
    151c:	00008067          	ret

00001520 <copy_block>:
    1520:	ff010113          	addi	sp,sp,-16
    1524:	00112623          	sw	ra,12(sp)
    1528:	00812423          	sw	s0,8(sp)
    152c:	01010413          	addi	s0,sp,16
    1530:	fea42a23          	sw	a0,-12(s0)
    1534:	feb42823          	sw	a1,-16(s0)
    1538:	ff042503          	lw	a0,-16(s0)
    153c:	00c52503          	lw	a0,12(a0)
    1540:	ff442583          	lw	a1,-12(s0)
    1544:	00a5a623          	sw	a0,12(a1)
    1548:	ff042503          	lw	a0,-16(s0)
    154c:	00052503          	lw	a0,0(a0)
    1550:	ff442583          	lw	a1,-12(s0)
    1554:	00a5a023          	sw	a0,0(a1)
    1558:	ff042503          	lw	a0,-16(s0)
    155c:	00452503          	lw	a0,4(a0)
    1560:	ff442583          	lw	a1,-12(s0)
    1564:	00a5a223          	sw	a0,4(a1)
    1568:	ff042503          	lw	a0,-16(s0)
    156c:	00852503          	lw	a0,8(a0)
    1570:	ff442583          	lw	a1,-12(s0)
    1574:	00a5a423          	sw	a0,8(a1)
    1578:	00812403          	lw	s0,8(sp)
    157c:	00c12083          	lw	ra,12(sp)
    1580:	01010113          	addi	sp,sp,16
    1584:	00008067          	ret

00001588 <check_collision>:
    1588:	fd010113          	addi	sp,sp,-48
    158c:	02112623          	sw	ra,44(sp)
    1590:	02812423          	sw	s0,40(sp)
    1594:	03010413          	addi	s0,sp,48
    1598:	fea42823          	sw	a0,-16(s0)
    159c:	ff042503          	lw	a0,-16(s0)
    15a0:	00c52503          	lw	a0,12(a0)
    15a4:	fea42623          	sw	a0,-20(s0)
    15a8:	fec42503          	lw	a0,-20(s0)
    15ac:	00357513          	andi	a0,a0,3
    15b0:	fea42423          	sw	a0,-24(s0)
    15b4:	fec42503          	lw	a0,-20(s0)
    15b8:	00c57513          	andi	a0,a0,12
    15bc:	00255513          	srli	a0,a0,0x2
    15c0:	fea42223          	sw	a0,-28(s0)
    15c4:	fec42503          	lw	a0,-20(s0)
    15c8:	000015b7          	lui	a1,0x1
    15cc:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    15d0:	00b57533          	and	a0,a0,a1
    15d4:	00455513          	srli	a0,a0,0x4
    15d8:	fea42023          	sw	a0,-32(s0)
    15dc:	fec42503          	lw	a0,-20(s0)
    15e0:	01051513          	slli	a0,a0,0x10
    15e4:	01c55513          	srli	a0,a0,0x1c
    15e8:	fca42e23          	sw	a0,-36(s0)
    15ec:	00000513          	li	a0,0
    15f0:	fca42c23          	sw	a0,-40(s0)
    15f4:	0040006f          	j	15f8 <check_collision+0x70>
    15f8:	fd842583          	lw	a1,-40(s0)
    15fc:	fe842503          	lw	a0,-24(s0)
    1600:	0cb56463          	bltu	a0,a1,16c8 <check_collision+0x140>
    1604:	0040006f          	j	1608 <check_collision+0x80>
    1608:	00000513          	li	a0,0
    160c:	fca42a23          	sw	a0,-44(s0)
    1610:	0040006f          	j	1614 <check_collision+0x8c>
    1614:	fd442583          	lw	a1,-44(s0)
    1618:	fe442503          	lw	a0,-28(s0)
    161c:	08b56c63          	bltu	a0,a1,16b4 <check_collision+0x12c>
    1620:	0040006f          	j	1624 <check_collision+0x9c>
    1624:	ff042503          	lw	a0,-16(s0)
    1628:	fd842583          	lw	a1,-40(s0)
    162c:	fd442603          	lw	a2,-44(s0)
    1630:	00000097          	auipc	ra,0x0
    1634:	db8080e7          	jalr	-584(ra) # 13e8 <get_shape>
    1638:	00000593          	li	a1,0
    163c:	06b50263          	beq	a0,a1,16a0 <check_collision+0x118>
    1640:	0040006f          	j	1644 <check_collision+0xbc>
    1644:	00003537          	lui	a0,0x3
    1648:	07c52503          	lw	a0,124(a0) # 307c <_end>
    164c:	fca42823          	sw	a0,-48(s0)
    1650:	fe042503          	lw	a0,-32(s0)
    1654:	fd842583          	lw	a1,-40(s0)
    1658:	00b50533          	add	a0,a0,a1
    165c:	00a00593          	li	a1,10
    1660:	00000097          	auipc	ra,0x0
    1664:	ae8080e7          	jalr	-1304(ra) # 1148 <wk_mul>
    1668:	00050593          	mv	a1,a0
    166c:	fd042503          	lw	a0,-48(s0)
    1670:	fdc42603          	lw	a2,-36(s0)
    1674:	00c585b3          	add	a1,a1,a2
    1678:	fd442603          	lw	a2,-44(s0)
    167c:	00c585b3          	add	a1,a1,a2
    1680:	00b50533          	add	a0,a0,a1
    1684:	00054503          	lbu	a0,0(a0)
    1688:	00000593          	li	a1,0
    168c:	00b50a63          	beq	a0,a1,16a0 <check_collision+0x118>
    1690:	0040006f          	j	1694 <check_collision+0x10c>
    1694:	00000513          	li	a0,0
    1698:	fea42a23          	sw	a0,-12(s0)
    169c:	0380006f          	j	16d4 <check_collision+0x14c>
    16a0:	0040006f          	j	16a4 <check_collision+0x11c>
    16a4:	fd442503          	lw	a0,-44(s0)
    16a8:	00150513          	addi	a0,a0,1
    16ac:	fca42a23          	sw	a0,-44(s0)
    16b0:	f65ff06f          	j	1614 <check_collision+0x8c>
    16b4:	0040006f          	j	16b8 <check_collision+0x130>
    16b8:	fd842503          	lw	a0,-40(s0)
    16bc:	00150513          	addi	a0,a0,1
    16c0:	fca42c23          	sw	a0,-40(s0)
    16c4:	f35ff06f          	j	15f8 <check_collision+0x70>
    16c8:	00100513          	li	a0,1
    16cc:	fea42a23          	sw	a0,-12(s0)
    16d0:	0040006f          	j	16d4 <check_collision+0x14c>
    16d4:	ff442503          	lw	a0,-12(s0)
    16d8:	02812403          	lw	s0,40(sp)
    16dc:	02c12083          	lw	ra,44(sp)
    16e0:	03010113          	addi	sp,sp,48
    16e4:	00008067          	ret

000016e8 <putch_at>:
    16e8:	fe010113          	addi	sp,sp,-32
    16ec:	00112e23          	sw	ra,28(sp)
    16f0:	00812c23          	sw	s0,24(sp)
    16f4:	02010413          	addi	s0,sp,32
    16f8:	fea42a23          	sw	a0,-12(s0)
    16fc:	feb42823          	sw	a1,-16(s0)
    1700:	fec407a3          	sb	a2,-17(s0)
    1704:	fef40503          	lb	a0,-17(s0)
    1708:	fea42423          	sw	a0,-24(s0)
    170c:	ff042503          	lw	a0,-16(s0)
    1710:	00350513          	addi	a0,a0,3
    1714:	05000593          	li	a1,80
    1718:	00000097          	auipc	ra,0x0
    171c:	a30080e7          	jalr	-1488(ra) # 1148 <wk_mul>
    1720:	00050593          	mv	a1,a0
    1724:	fe842503          	lw	a0,-24(s0)
    1728:	ff442603          	lw	a2,-12(s0)
    172c:	00c585b3          	add	a1,a1,a2
    1730:	20000637          	lui	a2,0x20000
    1734:	01c60613          	addi	a2,a2,28 # 2000001c <score+0x1fffcf9c>
    1738:	00c585b3          	add	a1,a1,a2
    173c:	00a58023          	sb	a0,0(a1)
    1740:	01812403          	lw	s0,24(sp)
    1744:	01c12083          	lw	ra,28(sp)
    1748:	02010113          	addi	sp,sp,32
    174c:	00008067          	ret

00001750 <block_move>:
    1750:	fd010113          	addi	sp,sp,-48
    1754:	02112623          	sw	ra,44(sp)
    1758:	02812423          	sw	s0,40(sp)
    175c:	03010413          	addi	s0,sp,48
    1760:	fea42a23          	sw	a0,-12(s0)
    1764:	feb42823          	sw	a1,-16(s0)
    1768:	ff442503          	lw	a0,-12(s0)
    176c:	00c52503          	lw	a0,12(a0)
    1770:	fea42623          	sw	a0,-20(s0)
    1774:	fec42503          	lw	a0,-20(s0)
    1778:	00357513          	andi	a0,a0,3
    177c:	fea42423          	sw	a0,-24(s0)
    1780:	fec42503          	lw	a0,-20(s0)
    1784:	00c57513          	andi	a0,a0,12
    1788:	00255513          	srli	a0,a0,0x2
    178c:	fea42223          	sw	a0,-28(s0)
    1790:	fec42503          	lw	a0,-20(s0)
    1794:	000015b7          	lui	a1,0x1
    1798:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    179c:	00b57533          	and	a0,a0,a1
    17a0:	00455513          	srli	a0,a0,0x4
    17a4:	fea42023          	sw	a0,-32(s0)
    17a8:	fec42503          	lw	a0,-20(s0)
    17ac:	01051513          	slli	a0,a0,0x10
    17b0:	01c55513          	srli	a0,a0,0x1c
    17b4:	fca42e23          	sw	a0,-36(s0)
    17b8:	ff042503          	lw	a0,-16(s0)
    17bc:	fca42c23          	sw	a0,-40(s0)
    17c0:	00000593          	li	a1,0
    17c4:	02b50463          	beq	a0,a1,17ec <block_move+0x9c>
    17c8:	0040006f          	j	17cc <block_move+0x7c>
    17cc:	fd842503          	lw	a0,-40(s0)
    17d0:	00100593          	li	a1,1
    17d4:	02b50463          	beq	a0,a1,17fc <block_move+0xac>
    17d8:	0040006f          	j	17dc <block_move+0x8c>
    17dc:	fd842503          	lw	a0,-40(s0)
    17e0:	00200593          	li	a1,2
    17e4:	02b50463          	beq	a0,a1,180c <block_move+0xbc>
    17e8:	0340006f          	j	181c <block_move+0xcc>
    17ec:	fdc42503          	lw	a0,-36(s0)
    17f0:	fff50513          	addi	a0,a0,-1
    17f4:	fca42e23          	sw	a0,-36(s0)
    17f8:	0280006f          	j	1820 <block_move+0xd0>
    17fc:	fdc42503          	lw	a0,-36(s0)
    1800:	00150513          	addi	a0,a0,1
    1804:	fca42e23          	sw	a0,-36(s0)
    1808:	0180006f          	j	1820 <block_move+0xd0>
    180c:	fe042503          	lw	a0,-32(s0)
    1810:	00150513          	addi	a0,a0,1
    1814:	fea42023          	sw	a0,-32(s0)
    1818:	0080006f          	j	1820 <block_move+0xd0>
    181c:	0040006f          	j	1820 <block_move+0xd0>
    1820:	fdc42503          	lw	a0,-36(s0)
    1824:	00c51513          	slli	a0,a0,0xc
    1828:	fe042583          	lw	a1,-32(s0)
    182c:	00459593          	slli	a1,a1,0x4
    1830:	00b56533          	or	a0,a0,a1
    1834:	fe442583          	lw	a1,-28(s0)
    1838:	00259593          	slli	a1,a1,0x2
    183c:	00b56533          	or	a0,a0,a1
    1840:	fe842583          	lw	a1,-24(s0)
    1844:	00b56533          	or	a0,a0,a1
    1848:	ff442583          	lw	a1,-12(s0)
    184c:	00a5a623          	sw	a0,12(a1)
    1850:	02812403          	lw	s0,40(sp)
    1854:	02c12083          	lw	ra,44(sp)
    1858:	03010113          	addi	sp,sp,48
    185c:	00008067          	ret

00001860 <move>:
    1860:	fd010113          	addi	sp,sp,-48
    1864:	02112623          	sw	ra,44(sp)
    1868:	02812423          	sw	s0,40(sp)
    186c:	03010413          	addi	s0,sp,48
    1870:	fea42823          	sw	a0,-16(s0)
    1874:	feb42623          	sw	a1,-20(s0)
    1878:	ff042583          	lw	a1,-16(s0)
    187c:	fd840513          	addi	a0,s0,-40
    1880:	fca42a23          	sw	a0,-44(s0)
    1884:	00000097          	auipc	ra,0x0
    1888:	c9c080e7          	jalr	-868(ra) # 1520 <copy_block>
    188c:	fd442503          	lw	a0,-44(s0)
    1890:	fec42583          	lw	a1,-20(s0)
    1894:	00000097          	auipc	ra,0x0
    1898:	ebc080e7          	jalr	-324(ra) # 1750 <block_move>
    189c:	fd442503          	lw	a0,-44(s0)
    18a0:	00000097          	auipc	ra,0x0
    18a4:	b9c080e7          	jalr	-1124(ra) # 143c <check_bounds>
    18a8:	00000593          	li	a1,0
    18ac:	02b50e63          	beq	a0,a1,18e8 <move+0x88>
    18b0:	0040006f          	j	18b4 <move+0x54>
    18b4:	fd840513          	addi	a0,s0,-40
    18b8:	00000097          	auipc	ra,0x0
    18bc:	cd0080e7          	jalr	-816(ra) # 1588 <check_collision>
    18c0:	00000593          	li	a1,0
    18c4:	02b50263          	beq	a0,a1,18e8 <move+0x88>
    18c8:	0040006f          	j	18cc <move+0x6c>
    18cc:	ff042503          	lw	a0,-16(s0)
    18d0:	fd840593          	addi	a1,s0,-40
    18d4:	00000097          	auipc	ra,0x0
    18d8:	c4c080e7          	jalr	-948(ra) # 1520 <copy_block>
    18dc:	00100513          	li	a0,1
    18e0:	fea42a23          	sw	a0,-12(s0)
    18e4:	0100006f          	j	18f4 <move+0x94>
    18e8:	00000513          	li	a0,0
    18ec:	fea42a23          	sw	a0,-12(s0)
    18f0:	0040006f          	j	18f4 <move+0x94>
    18f4:	ff442503          	lw	a0,-12(s0)
    18f8:	02812403          	lw	s0,40(sp)
    18fc:	02c12083          	lw	ra,44(sp)
    1900:	03010113          	addi	sp,sp,48
    1904:	00008067          	ret

00001908 <block_rotate>:
    1908:	fa010113          	addi	sp,sp,-96
    190c:	04112e23          	sw	ra,92(sp)
    1910:	04812c23          	sw	s0,88(sp)
    1914:	06010413          	addi	s0,sp,96
    1918:	fea42a23          	sw	a0,-12(s0)
    191c:	feb42823          	sw	a1,-16(s0)
    1920:	ff442503          	lw	a0,-12(s0)
    1924:	00c52503          	lw	a0,12(a0)
    1928:	fea42623          	sw	a0,-20(s0)
    192c:	fec42503          	lw	a0,-20(s0)
    1930:	00357513          	andi	a0,a0,3
    1934:	fea42423          	sw	a0,-24(s0)
    1938:	fec42503          	lw	a0,-20(s0)
    193c:	00c57513          	andi	a0,a0,12
    1940:	00255513          	srli	a0,a0,0x2
    1944:	fea42223          	sw	a0,-28(s0)
    1948:	fec42503          	lw	a0,-20(s0)
    194c:	000015b7          	lui	a1,0x1
    1950:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    1954:	00b57533          	and	a0,a0,a1
    1958:	00455513          	srli	a0,a0,0x4
    195c:	fea42023          	sw	a0,-32(s0)
    1960:	fec42503          	lw	a0,-20(s0)
    1964:	01051513          	slli	a0,a0,0x10
    1968:	01c55513          	srli	a0,a0,0x1c
    196c:	fca42e23          	sw	a0,-36(s0)
    1970:	fdc42503          	lw	a0,-36(s0)
    1974:	fe042583          	lw	a1,-32(s0)
    1978:	fe842603          	lw	a2,-24(s0)
    197c:	fe442683          	lw	a3,-28(s0)
    1980:	00000097          	auipc	ra,0x0
    1984:	858080e7          	jalr	-1960(ra) # 11d8 <make_xywh>
    1988:	fca42c23          	sw	a0,-40(s0)
    198c:	00000593          	li	a1,0
    1990:	fcb42a23          	sw	a1,-44(s0)
    1994:	fcb42823          	sw	a1,-48(s0)
    1998:	fcb42623          	sw	a1,-52(s0)
    199c:	ff042503          	lw	a0,-16(s0)
    19a0:	0cb50463          	beq	a0,a1,1a68 <block_rotate+0x160>
    19a4:	0040006f          	j	19a8 <block_rotate+0xa0>
    19a8:	00000513          	li	a0,0
    19ac:	fca42423          	sw	a0,-56(s0)
    19b0:	0040006f          	j	19b4 <block_rotate+0xac>
    19b4:	fc842583          	lw	a1,-56(s0)
    19b8:	fe842503          	lw	a0,-24(s0)
    19bc:	0ab56463          	bltu	a0,a1,1a64 <block_rotate+0x15c>
    19c0:	0040006f          	j	19c4 <block_rotate+0xbc>
    19c4:	00000513          	li	a0,0
    19c8:	fca42223          	sw	a0,-60(s0)
    19cc:	0040006f          	j	19d0 <block_rotate+0xc8>
    19d0:	fc442583          	lw	a1,-60(s0)
    19d4:	fe442503          	lw	a0,-28(s0)
    19d8:	06b56c63          	bltu	a0,a1,1a50 <block_rotate+0x148>
    19dc:	0040006f          	j	19e0 <block_rotate+0xd8>
    19e0:	fc442603          	lw	a2,-60(s0)
    19e4:	00261593          	slli	a1,a2,0x2
    19e8:	fcc40513          	addi	a0,s0,-52
    19ec:	faa42a23          	sw	a0,-76(s0)
    19f0:	00b50533          	add	a0,a0,a1
    19f4:	00052503          	lw	a0,0(a0)
    19f8:	faa42c23          	sw	a0,-72(s0)
    19fc:	ff442503          	lw	a0,-12(s0)
    1a00:	fc842583          	lw	a1,-56(s0)
    1a04:	00000097          	auipc	ra,0x0
    1a08:	9e4080e7          	jalr	-1564(ra) # 13e8 <get_shape>
    1a0c:	fb442583          	lw	a1,-76(s0)
    1a10:	00050613          	mv	a2,a0
    1a14:	fb842503          	lw	a0,-72(s0)
    1a18:	fe842683          	lw	a3,-24(s0)
    1a1c:	fc842703          	lw	a4,-56(s0)
    1a20:	40e686b3          	sub	a3,a3,a4
    1a24:	00d61633          	sll	a2,a2,a3
    1a28:	00c56533          	or	a0,a0,a2
    1a2c:	fc442603          	lw	a2,-60(s0)
    1a30:	00261613          	slli	a2,a2,0x2
    1a34:	00c585b3          	add	a1,a1,a2
    1a38:	00a5a023          	sw	a0,0(a1)
    1a3c:	0040006f          	j	1a40 <block_rotate+0x138>
    1a40:	fc442503          	lw	a0,-60(s0)
    1a44:	00150513          	addi	a0,a0,1
    1a48:	fca42223          	sw	a0,-60(s0)
    1a4c:	f85ff06f          	j	19d0 <block_rotate+0xc8>
    1a50:	0040006f          	j	1a54 <block_rotate+0x14c>
    1a54:	fc842503          	lw	a0,-56(s0)
    1a58:	00150513          	addi	a0,a0,1
    1a5c:	fca42423          	sw	a0,-56(s0)
    1a60:	f55ff06f          	j	19b4 <block_rotate+0xac>
    1a64:	0cc0006f          	j	1b30 <block_rotate+0x228>
    1a68:	00000513          	li	a0,0
    1a6c:	fca42023          	sw	a0,-64(s0)
    1a70:	0040006f          	j	1a74 <block_rotate+0x16c>
    1a74:	fc042583          	lw	a1,-64(s0)
    1a78:	fe842503          	lw	a0,-24(s0)
    1a7c:	0ab56863          	bltu	a0,a1,1b2c <block_rotate+0x224>
    1a80:	0040006f          	j	1a84 <block_rotate+0x17c>
    1a84:	00000513          	li	a0,0
    1a88:	faa42e23          	sw	a0,-68(s0)
    1a8c:	0040006f          	j	1a90 <block_rotate+0x188>
    1a90:	fbc42583          	lw	a1,-68(s0)
    1a94:	fe442503          	lw	a0,-28(s0)
    1a98:	08b56063          	bltu	a0,a1,1b18 <block_rotate+0x210>
    1a9c:	0040006f          	j	1aa0 <block_rotate+0x198>
    1aa0:	fe442503          	lw	a0,-28(s0)
    1aa4:	fbc42603          	lw	a2,-68(s0)
    1aa8:	40c50533          	sub	a0,a0,a2
    1aac:	00251593          	slli	a1,a0,0x2
    1ab0:	fcc40513          	addi	a0,s0,-52
    1ab4:	faa42623          	sw	a0,-84(s0)
    1ab8:	00b50533          	add	a0,a0,a1
    1abc:	00052503          	lw	a0,0(a0)
    1ac0:	faa42823          	sw	a0,-80(s0)
    1ac4:	ff442503          	lw	a0,-12(s0)
    1ac8:	fc042583          	lw	a1,-64(s0)
    1acc:	00000097          	auipc	ra,0x0
    1ad0:	91c080e7          	jalr	-1764(ra) # 13e8 <get_shape>
    1ad4:	fac42583          	lw	a1,-84(s0)
    1ad8:	00050613          	mv	a2,a0
    1adc:	fb042503          	lw	a0,-80(s0)
    1ae0:	fc042683          	lw	a3,-64(s0)
    1ae4:	00d61633          	sll	a2,a2,a3
    1ae8:	00c56533          	or	a0,a0,a2
    1aec:	fe442603          	lw	a2,-28(s0)
    1af0:	fbc42683          	lw	a3,-68(s0)
    1af4:	40d60633          	sub	a2,a2,a3
    1af8:	00261613          	slli	a2,a2,0x2
    1afc:	00c585b3          	add	a1,a1,a2
    1b00:	00a5a023          	sw	a0,0(a1)
    1b04:	0040006f          	j	1b08 <block_rotate+0x200>
    1b08:	fbc42503          	lw	a0,-68(s0)
    1b0c:	00150513          	addi	a0,a0,1
    1b10:	faa42e23          	sw	a0,-68(s0)
    1b14:	f7dff06f          	j	1a90 <block_rotate+0x188>
    1b18:	0040006f          	j	1b1c <block_rotate+0x214>
    1b1c:	fc042503          	lw	a0,-64(s0)
    1b20:	00150513          	addi	a0,a0,1
    1b24:	fca42023          	sw	a0,-64(s0)
    1b28:	f4dff06f          	j	1a74 <block_rotate+0x16c>
    1b2c:	0040006f          	j	1b30 <block_rotate+0x228>
    1b30:	fcc42503          	lw	a0,-52(s0)
    1b34:	ff442583          	lw	a1,-12(s0)
    1b38:	00a5a023          	sw	a0,0(a1)
    1b3c:	fd042503          	lw	a0,-48(s0)
    1b40:	ff442583          	lw	a1,-12(s0)
    1b44:	00a5a223          	sw	a0,4(a1)
    1b48:	fd442503          	lw	a0,-44(s0)
    1b4c:	ff442583          	lw	a1,-12(s0)
    1b50:	00a5a423          	sw	a0,8(a1)
    1b54:	fd842503          	lw	a0,-40(s0)
    1b58:	ff442583          	lw	a1,-12(s0)
    1b5c:	00a5a623          	sw	a0,12(a1)
    1b60:	05812403          	lw	s0,88(sp)
    1b64:	05c12083          	lw	ra,92(sp)
    1b68:	06010113          	addi	sp,sp,96
    1b6c:	00008067          	ret

00001b70 <rotate>:
    1b70:	fc010113          	addi	sp,sp,-64
    1b74:	02112e23          	sw	ra,60(sp)
    1b78:	02812c23          	sw	s0,56(sp)
    1b7c:	04010413          	addi	s0,sp,64
    1b80:	fea42a23          	sw	a0,-12(s0)
    1b84:	feb42823          	sw	a1,-16(s0)
    1b88:	ff442583          	lw	a1,-12(s0)
    1b8c:	fe040513          	addi	a0,s0,-32
    1b90:	fca42423          	sw	a0,-56(s0)
    1b94:	00000097          	auipc	ra,0x0
    1b98:	98c080e7          	jalr	-1652(ra) # 1520 <copy_block>
    1b9c:	fc842503          	lw	a0,-56(s0)
    1ba0:	ff042583          	lw	a1,-16(s0)
    1ba4:	00000097          	auipc	ra,0x0
    1ba8:	d64080e7          	jalr	-668(ra) # 1908 <block_rotate>
    1bac:	fc842503          	lw	a0,-56(s0)
    1bb0:	00000097          	auipc	ra,0x0
    1bb4:	88c080e7          	jalr	-1908(ra) # 143c <check_bounds>
    1bb8:	00000593          	li	a1,0
    1bbc:	02b50a63          	beq	a0,a1,1bf0 <rotate+0x80>
    1bc0:	0040006f          	j	1bc4 <rotate+0x54>
    1bc4:	fe040513          	addi	a0,s0,-32
    1bc8:	00000097          	auipc	ra,0x0
    1bcc:	9c0080e7          	jalr	-1600(ra) # 1588 <check_collision>
    1bd0:	00000593          	li	a1,0
    1bd4:	00b50e63          	beq	a0,a1,1bf0 <rotate+0x80>
    1bd8:	0040006f          	j	1bdc <rotate+0x6c>
    1bdc:	ff442503          	lw	a0,-12(s0)
    1be0:	fe040593          	addi	a1,s0,-32
    1be4:	00000097          	auipc	ra,0x0
    1be8:	93c080e7          	jalr	-1732(ra) # 1520 <copy_block>
    1bec:	0dc0006f          	j	1cc8 <rotate+0x158>
    1bf0:	fec42503          	lw	a0,-20(s0)
    1bf4:	fca42e23          	sw	a0,-36(s0)
    1bf8:	fdc42503          	lw	a0,-36(s0)
    1bfc:	00357513          	andi	a0,a0,3
    1c00:	fca42c23          	sw	a0,-40(s0)
    1c04:	fdc42503          	lw	a0,-36(s0)
    1c08:	00c57513          	andi	a0,a0,12
    1c0c:	00255513          	srli	a0,a0,0x2
    1c10:	fca42a23          	sw	a0,-44(s0)
    1c14:	fdc42503          	lw	a0,-36(s0)
    1c18:	000015b7          	lui	a1,0x1
    1c1c:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    1c20:	00b57533          	and	a0,a0,a1
    1c24:	00455513          	srli	a0,a0,0x4
    1c28:	fca42823          	sw	a0,-48(s0)
    1c2c:	fdc42503          	lw	a0,-36(s0)
    1c30:	01051513          	slli	a0,a0,0x10
    1c34:	01c55513          	srli	a0,a0,0x1c
    1c38:	fca42623          	sw	a0,-52(s0)
    1c3c:	fcc42503          	lw	a0,-52(s0)
    1c40:	fd442583          	lw	a1,-44(s0)
    1c44:	00b50533          	add	a0,a0,a1
    1c48:	00a00593          	li	a1,10
    1c4c:	00b56e63          	bltu	a0,a1,1c68 <rotate+0xf8>
    1c50:	0040006f          	j	1c54 <rotate+0xe4>
    1c54:	fd442583          	lw	a1,-44(s0)
    1c58:	00900513          	li	a0,9
    1c5c:	40b50533          	sub	a0,a0,a1
    1c60:	fca42623          	sw	a0,-52(s0)
    1c64:	0040006f          	j	1c68 <rotate+0xf8>
    1c68:	fcc42503          	lw	a0,-52(s0)
    1c6c:	fd042583          	lw	a1,-48(s0)
    1c70:	fd442603          	lw	a2,-44(s0)
    1c74:	fd842683          	lw	a3,-40(s0)
    1c78:	fffff097          	auipc	ra,0xfffff
    1c7c:	560080e7          	jalr	1376(ra) # 11d8 <make_xywh>
    1c80:	fea42623          	sw	a0,-20(s0)
    1c84:	fe040513          	addi	a0,s0,-32
    1c88:	fffff097          	auipc	ra,0xfffff
    1c8c:	7b4080e7          	jalr	1972(ra) # 143c <check_bounds>
    1c90:	00000593          	li	a1,0
    1c94:	02b50a63          	beq	a0,a1,1cc8 <rotate+0x158>
    1c98:	0040006f          	j	1c9c <rotate+0x12c>
    1c9c:	fe040513          	addi	a0,s0,-32
    1ca0:	00000097          	auipc	ra,0x0
    1ca4:	8e8080e7          	jalr	-1816(ra) # 1588 <check_collision>
    1ca8:	00000593          	li	a1,0
    1cac:	00b50e63          	beq	a0,a1,1cc8 <rotate+0x158>
    1cb0:	0040006f          	j	1cb4 <rotate+0x144>
    1cb4:	ff442503          	lw	a0,-12(s0)
    1cb8:	fe040593          	addi	a1,s0,-32
    1cbc:	00000097          	auipc	ra,0x0
    1cc0:	864080e7          	jalr	-1948(ra) # 1520 <copy_block>
    1cc4:	0040006f          	j	1cc8 <rotate+0x158>
    1cc8:	03812403          	lw	s0,56(sp)
    1ccc:	03c12083          	lw	ra,60(sp)
    1cd0:	04010113          	addi	sp,sp,64
    1cd4:	00008067          	ret

00001cd8 <clear_board>:
    1cd8:	ff010113          	addi	sp,sp,-16
    1cdc:	00112623          	sw	ra,12(sp)
    1ce0:	00812423          	sw	s0,8(sp)
    1ce4:	01010413          	addi	s0,sp,16
    1ce8:	00000513          	li	a0,0
    1cec:	fea42a23          	sw	a0,-12(s0)
    1cf0:	01600513          	li	a0,22
    1cf4:	00a00593          	li	a1,10
    1cf8:	fffff097          	auipc	ra,0xfffff
    1cfc:	450080e7          	jalr	1104(ra) # 1148 <wk_mul>
    1d00:	fea42823          	sw	a0,-16(s0)
    1d04:	0040006f          	j	1d08 <clear_board+0x30>
    1d08:	ff442503          	lw	a0,-12(s0)
    1d0c:	ff042583          	lw	a1,-16(s0)
    1d10:	02b55a63          	bge	a0,a1,1d44 <clear_board+0x6c>
    1d14:	0040006f          	j	1d18 <clear_board+0x40>
    1d18:	00003537          	lui	a0,0x3
    1d1c:	07c52503          	lw	a0,124(a0) # 307c <_end>
    1d20:	ff442583          	lw	a1,-12(s0)
    1d24:	00b505b3          	add	a1,a0,a1
    1d28:	00000513          	li	a0,0
    1d2c:	00a58023          	sb	a0,0(a1)
    1d30:	0040006f          	j	1d34 <clear_board+0x5c>
    1d34:	ff442503          	lw	a0,-12(s0)
    1d38:	00150513          	addi	a0,a0,1
    1d3c:	fea42a23          	sw	a0,-12(s0)
    1d40:	fc9ff06f          	j	1d08 <clear_board+0x30>
    1d44:	00812403          	lw	s0,8(sp)
    1d48:	00c12083          	lw	ra,12(sp)
    1d4c:	01010113          	addi	sp,sp,16
    1d50:	00008067          	ret

00001d54 <fix_block>:
    1d54:	fd010113          	addi	sp,sp,-48
    1d58:	02112623          	sw	ra,44(sp)
    1d5c:	02812423          	sw	s0,40(sp)
    1d60:	03010413          	addi	s0,sp,48
    1d64:	fea42a23          	sw	a0,-12(s0)
    1d68:	ff442503          	lw	a0,-12(s0)
    1d6c:	00c52503          	lw	a0,12(a0)
    1d70:	fea42823          	sw	a0,-16(s0)
    1d74:	ff042503          	lw	a0,-16(s0)
    1d78:	00357513          	andi	a0,a0,3
    1d7c:	fea42623          	sw	a0,-20(s0)
    1d80:	ff042503          	lw	a0,-16(s0)
    1d84:	00c57513          	andi	a0,a0,12
    1d88:	00255513          	srli	a0,a0,0x2
    1d8c:	fea42423          	sw	a0,-24(s0)
    1d90:	ff042503          	lw	a0,-16(s0)
    1d94:	000015b7          	lui	a1,0x1
    1d98:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    1d9c:	00b57533          	and	a0,a0,a1
    1da0:	00455513          	srli	a0,a0,0x4
    1da4:	fea42223          	sw	a0,-28(s0)
    1da8:	ff042503          	lw	a0,-16(s0)
    1dac:	01051513          	slli	a0,a0,0x10
    1db0:	01c55513          	srli	a0,a0,0x1c
    1db4:	fea42023          	sw	a0,-32(s0)
    1db8:	00000513          	li	a0,0
    1dbc:	fca42e23          	sw	a0,-36(s0)
    1dc0:	0040006f          	j	1dc4 <fix_block+0x70>
    1dc4:	fdc42583          	lw	a1,-36(s0)
    1dc8:	fec42503          	lw	a0,-20(s0)
    1dcc:	0ab56c63          	bltu	a0,a1,1e84 <fix_block+0x130>
    1dd0:	0040006f          	j	1dd4 <fix_block+0x80>
    1dd4:	00000513          	li	a0,0
    1dd8:	fca42c23          	sw	a0,-40(s0)
    1ddc:	0040006f          	j	1de0 <fix_block+0x8c>
    1de0:	fd842583          	lw	a1,-40(s0)
    1de4:	fe842503          	lw	a0,-24(s0)
    1de8:	08b56463          	bltu	a0,a1,1e70 <fix_block+0x11c>
    1dec:	0040006f          	j	1df0 <fix_block+0x9c>
    1df0:	ff442503          	lw	a0,-12(s0)
    1df4:	fdc42583          	lw	a1,-36(s0)
    1df8:	fd842603          	lw	a2,-40(s0)
    1dfc:	fffff097          	auipc	ra,0xfffff
    1e00:	5ec080e7          	jalr	1516(ra) # 13e8 <get_shape>
    1e04:	00000593          	li	a1,0
    1e08:	04b50a63          	beq	a0,a1,1e5c <fix_block+0x108>
    1e0c:	0040006f          	j	1e10 <fix_block+0xbc>
    1e10:	00003537          	lui	a0,0x3
    1e14:	07c52503          	lw	a0,124(a0) # 307c <_end>
    1e18:	fca42a23          	sw	a0,-44(s0)
    1e1c:	fe442503          	lw	a0,-28(s0)
    1e20:	fdc42583          	lw	a1,-36(s0)
    1e24:	00b50533          	add	a0,a0,a1
    1e28:	00a00593          	li	a1,10
    1e2c:	fffff097          	auipc	ra,0xfffff
    1e30:	31c080e7          	jalr	796(ra) # 1148 <wk_mul>
    1e34:	00050593          	mv	a1,a0
    1e38:	fd442503          	lw	a0,-44(s0)
    1e3c:	fe042603          	lw	a2,-32(s0)
    1e40:	00c585b3          	add	a1,a1,a2
    1e44:	fd842603          	lw	a2,-40(s0)
    1e48:	00c585b3          	add	a1,a1,a2
    1e4c:	00b505b3          	add	a1,a0,a1
    1e50:	00100513          	li	a0,1
    1e54:	00a58023          	sb	a0,0(a1)
    1e58:	0040006f          	j	1e5c <fix_block+0x108>
    1e5c:	0040006f          	j	1e60 <fix_block+0x10c>
    1e60:	fd842503          	lw	a0,-40(s0)
    1e64:	00150513          	addi	a0,a0,1
    1e68:	fca42c23          	sw	a0,-40(s0)
    1e6c:	f75ff06f          	j	1de0 <fix_block+0x8c>
    1e70:	0040006f          	j	1e74 <fix_block+0x120>
    1e74:	fdc42503          	lw	a0,-36(s0)
    1e78:	00150513          	addi	a0,a0,1
    1e7c:	fca42e23          	sw	a0,-36(s0)
    1e80:	f45ff06f          	j	1dc4 <fix_block+0x70>
    1e84:	02812403          	lw	s0,40(sp)
    1e88:	02c12083          	lw	ra,44(sp)
    1e8c:	03010113          	addi	sp,sp,48
    1e90:	00008067          	ret

00001e94 <print_score>:
    1e94:	fe010113          	addi	sp,sp,-32
    1e98:	00112e23          	sw	ra,28(sp)
    1e9c:	00812c23          	sw	s0,24(sp)
    1ea0:	02010413          	addi	s0,sp,32
    1ea4:	00800513          	li	a0,8
    1ea8:	fea42a23          	sw	a0,-12(s0)
    1eac:	ff442503          	lw	a0,-12(s0)
    1eb0:	00150593          	addi	a1,a0,1
    1eb4:	feb42a23          	sw	a1,-12(s0)
    1eb8:	ffe00593          	li	a1,-2
    1ebc:	feb42223          	sw	a1,-28(s0)
    1ec0:	05300613          	li	a2,83
    1ec4:	00000097          	auipc	ra,0x0
    1ec8:	824080e7          	jalr	-2012(ra) # 16e8 <putch_at>
    1ecc:	fe442583          	lw	a1,-28(s0)
    1ed0:	ff442503          	lw	a0,-12(s0)
    1ed4:	00150613          	addi	a2,a0,1
    1ed8:	fec42a23          	sw	a2,-12(s0)
    1edc:	04300613          	li	a2,67
    1ee0:	00000097          	auipc	ra,0x0
    1ee4:	808080e7          	jalr	-2040(ra) # 16e8 <putch_at>
    1ee8:	fe442583          	lw	a1,-28(s0)
    1eec:	ff442503          	lw	a0,-12(s0)
    1ef0:	00150613          	addi	a2,a0,1
    1ef4:	fec42a23          	sw	a2,-12(s0)
    1ef8:	04f00613          	li	a2,79
    1efc:	fffff097          	auipc	ra,0xfffff
    1f00:	7ec080e7          	jalr	2028(ra) # 16e8 <putch_at>
    1f04:	fe442583          	lw	a1,-28(s0)
    1f08:	ff442503          	lw	a0,-12(s0)
    1f0c:	00150613          	addi	a2,a0,1
    1f10:	fec42a23          	sw	a2,-12(s0)
    1f14:	05200613          	li	a2,82
    1f18:	fffff097          	auipc	ra,0xfffff
    1f1c:	7d0080e7          	jalr	2000(ra) # 16e8 <putch_at>
    1f20:	fe442583          	lw	a1,-28(s0)
    1f24:	ff442503          	lw	a0,-12(s0)
    1f28:	00150613          	addi	a2,a0,1
    1f2c:	fec42a23          	sw	a2,-12(s0)
    1f30:	04500613          	li	a2,69
    1f34:	fffff097          	auipc	ra,0xfffff
    1f38:	7b4080e7          	jalr	1972(ra) # 16e8 <putch_at>
    1f3c:	00000513          	li	a0,0
    1f40:	fea42823          	sw	a0,-16(s0)
    1f44:	0040006f          	j	1f48 <print_score+0xb4>
    1f48:	ff042583          	lw	a1,-16(s0)
    1f4c:	00400513          	li	a0,4
    1f50:	06b54a63          	blt	a0,a1,1fc4 <print_score+0x130>
    1f54:	0040006f          	j	1f58 <print_score+0xc4>
    1f58:	ff042503          	lw	a0,-16(s0)
    1f5c:	00251593          	slli	a1,a0,0x2
    1f60:	00f00513          	li	a0,15
    1f64:	00b51533          	sll	a0,a0,a1
    1f68:	fea42623          	sw	a0,-20(s0)
    1f6c:	00003537          	lui	a0,0x3
    1f70:	08052503          	lw	a0,128(a0) # 3080 <score>
    1f74:	fec42583          	lw	a1,-20(s0)
    1f78:	00b57533          	and	a0,a0,a1
    1f7c:	ff042583          	lw	a1,-16(s0)
    1f80:	00259593          	slli	a1,a1,0x2
    1f84:	00b55533          	srl	a0,a0,a1
    1f88:	fea42423          	sw	a0,-24(s0)
    1f8c:	ff042583          	lw	a1,-16(s0)
    1f90:	00c00513          	li	a0,12
    1f94:	40b50533          	sub	a0,a0,a1
    1f98:	fe842583          	lw	a1,-24(s0)
    1f9c:	03058593          	addi	a1,a1,48
    1fa0:	0ff5f613          	andi	a2,a1,255
    1fa4:	fff00593          	li	a1,-1
    1fa8:	fffff097          	auipc	ra,0xfffff
    1fac:	740080e7          	jalr	1856(ra) # 16e8 <putch_at>
    1fb0:	0040006f          	j	1fb4 <print_score+0x120>
    1fb4:	ff042503          	lw	a0,-16(s0)
    1fb8:	00150513          	addi	a0,a0,1
    1fbc:	fea42823          	sw	a0,-16(s0)
    1fc0:	f89ff06f          	j	1f48 <print_score+0xb4>
    1fc4:	01812403          	lw	s0,24(sp)
    1fc8:	01c12083          	lw	ra,28(sp)
    1fcc:	02010113          	addi	sp,sp,32
    1fd0:	00008067          	ret

00001fd4 <draw_board>:
    1fd4:	fc010113          	addi	sp,sp,-64
    1fd8:	02112e23          	sw	ra,60(sp)
    1fdc:	02812c23          	sw	s0,56(sp)
    1fe0:	04010413          	addi	s0,sp,64
    1fe4:	00000513          	li	a0,0
    1fe8:	fea42a23          	sw	a0,-12(s0)
    1fec:	0040006f          	j	1ff0 <draw_board+0x1c>
    1ff0:	ff442583          	lw	a1,-12(s0)
    1ff4:	01500513          	li	a0,21
    1ff8:	10b54463          	blt	a0,a1,2100 <draw_board+0x12c>
    1ffc:	0040006f          	j	2000 <draw_board+0x2c>
    2000:	00000513          	li	a0,0
    2004:	fea42823          	sw	a0,-16(s0)
    2008:	0040006f          	j	200c <draw_board+0x38>
    200c:	ff042583          	lw	a1,-16(s0)
    2010:	00900513          	li	a0,9
    2014:	0cb54c63          	blt	a0,a1,20ec <draw_board+0x118>
    2018:	0040006f          	j	201c <draw_board+0x48>
    201c:	00003537          	lui	a0,0x3
    2020:	07c52503          	lw	a0,124(a0) # 307c <_end>
    2024:	fca42823          	sw	a0,-48(s0)
    2028:	ff442503          	lw	a0,-12(s0)
    202c:	00a00593          	li	a1,10
    2030:	fffff097          	auipc	ra,0xfffff
    2034:	118080e7          	jalr	280(ra) # 1148 <wk_mul>
    2038:	00050593          	mv	a1,a0
    203c:	fd042503          	lw	a0,-48(s0)
    2040:	ff042603          	lw	a2,-16(s0)
    2044:	00c585b3          	add	a1,a1,a2
    2048:	00b50533          	add	a0,a0,a1
    204c:	00054503          	lbu	a0,0(a0)
    2050:	00100593          	li	a1,1
    2054:	04b51263          	bne	a0,a1,2098 <draw_board+0xc4>
    2058:	0040006f          	j	205c <draw_board+0x88>
    205c:	ff042503          	lw	a0,-16(s0)
    2060:	00151513          	slli	a0,a0,0x1
    2064:	00156513          	ori	a0,a0,1
    2068:	ff442583          	lw	a1,-12(s0)
    206c:	05b00613          	li	a2,91
    2070:	fffff097          	auipc	ra,0xfffff
    2074:	678080e7          	jalr	1656(ra) # 16e8 <putch_at>
    2078:	ff042503          	lw	a0,-16(s0)
    207c:	00151513          	slli	a0,a0,0x1
    2080:	00250513          	addi	a0,a0,2
    2084:	ff442583          	lw	a1,-12(s0)
    2088:	05d00613          	li	a2,93
    208c:	fffff097          	auipc	ra,0xfffff
    2090:	65c080e7          	jalr	1628(ra) # 16e8 <putch_at>
    2094:	0440006f          	j	20d8 <draw_board+0x104>
    2098:	ff042503          	lw	a0,-16(s0)
    209c:	00151513          	slli	a0,a0,0x1
    20a0:	00156513          	ori	a0,a0,1
    20a4:	ff442583          	lw	a1,-12(s0)
    20a8:	02000613          	li	a2,32
    20ac:	fcc42623          	sw	a2,-52(s0)
    20b0:	fffff097          	auipc	ra,0xfffff
    20b4:	638080e7          	jalr	1592(ra) # 16e8 <putch_at>
    20b8:	fcc42603          	lw	a2,-52(s0)
    20bc:	ff042503          	lw	a0,-16(s0)
    20c0:	00151513          	slli	a0,a0,0x1
    20c4:	00250513          	addi	a0,a0,2
    20c8:	ff442583          	lw	a1,-12(s0)
    20cc:	fffff097          	auipc	ra,0xfffff
    20d0:	61c080e7          	jalr	1564(ra) # 16e8 <putch_at>
    20d4:	0040006f          	j	20d8 <draw_board+0x104>
    20d8:	0040006f          	j	20dc <draw_board+0x108>
    20dc:	ff042503          	lw	a0,-16(s0)
    20e0:	00150513          	addi	a0,a0,1
    20e4:	fea42823          	sw	a0,-16(s0)
    20e8:	f25ff06f          	j	200c <draw_board+0x38>
    20ec:	0040006f          	j	20f0 <draw_board+0x11c>
    20f0:	ff442503          	lw	a0,-12(s0)
    20f4:	00150513          	addi	a0,a0,1
    20f8:	fea42a23          	sw	a0,-12(s0)
    20fc:	ef5ff06f          	j	1ff0 <draw_board+0x1c>
    2100:	00003537          	lui	a0,0x3
    2104:	06c50513          	addi	a0,a0,108 # 306c <current>
    2108:	00c52503          	lw	a0,12(a0)
    210c:	fea42623          	sw	a0,-20(s0)
    2110:	fec42503          	lw	a0,-20(s0)
    2114:	00357513          	andi	a0,a0,3
    2118:	fea42423          	sw	a0,-24(s0)
    211c:	fec42503          	lw	a0,-20(s0)
    2120:	00c57513          	andi	a0,a0,12
    2124:	00255513          	srli	a0,a0,0x2
    2128:	fea42223          	sw	a0,-28(s0)
    212c:	fec42503          	lw	a0,-20(s0)
    2130:	000015b7          	lui	a1,0x1
    2134:	ff058593          	addi	a1,a1,-16 # ff0 <_start-0x10>
    2138:	00b57533          	and	a0,a0,a1
    213c:	00455513          	srli	a0,a0,0x4
    2140:	fea42023          	sw	a0,-32(s0)
    2144:	fec42503          	lw	a0,-20(s0)
    2148:	01051513          	slli	a0,a0,0x10
    214c:	01c55513          	srli	a0,a0,0x1c
    2150:	fca42e23          	sw	a0,-36(s0)
    2154:	00000513          	li	a0,0
    2158:	fca42c23          	sw	a0,-40(s0)
    215c:	0040006f          	j	2160 <draw_board+0x18c>
    2160:	fd842583          	lw	a1,-40(s0)
    2164:	fe842503          	lw	a0,-24(s0)
    2168:	0cb56663          	bltu	a0,a1,2234 <draw_board+0x260>
    216c:	0040006f          	j	2170 <draw_board+0x19c>
    2170:	00000513          	li	a0,0
    2174:	fca42a23          	sw	a0,-44(s0)
    2178:	0040006f          	j	217c <draw_board+0x1a8>
    217c:	fd442583          	lw	a1,-44(s0)
    2180:	fe442503          	lw	a0,-28(s0)
    2184:	08b56e63          	bltu	a0,a1,2220 <draw_board+0x24c>
    2188:	0040006f          	j	218c <draw_board+0x1b8>
    218c:	fd842583          	lw	a1,-40(s0)
    2190:	fd442603          	lw	a2,-44(s0)
    2194:	00003537          	lui	a0,0x3
    2198:	06c50513          	addi	a0,a0,108 # 306c <current>
    219c:	fffff097          	auipc	ra,0xfffff
    21a0:	24c080e7          	jalr	588(ra) # 13e8 <get_shape>
    21a4:	00000593          	li	a1,0
    21a8:	06b50263          	beq	a0,a1,220c <draw_board+0x238>
    21ac:	0040006f          	j	21b0 <draw_board+0x1dc>
    21b0:	fd442503          	lw	a0,-44(s0)
    21b4:	fdc42583          	lw	a1,-36(s0)
    21b8:	00b50533          	add	a0,a0,a1
    21bc:	00151513          	slli	a0,a0,0x1
    21c0:	00156513          	ori	a0,a0,1
    21c4:	fd842583          	lw	a1,-40(s0)
    21c8:	fe042603          	lw	a2,-32(s0)
    21cc:	00c585b3          	add	a1,a1,a2
    21d0:	05b00613          	li	a2,91
    21d4:	fffff097          	auipc	ra,0xfffff
    21d8:	514080e7          	jalr	1300(ra) # 16e8 <putch_at>
    21dc:	fd442503          	lw	a0,-44(s0)
    21e0:	fdc42583          	lw	a1,-36(s0)
    21e4:	00b50533          	add	a0,a0,a1
    21e8:	00151513          	slli	a0,a0,0x1
    21ec:	00250513          	addi	a0,a0,2
    21f0:	fd842583          	lw	a1,-40(s0)
    21f4:	fe042603          	lw	a2,-32(s0)
    21f8:	00c585b3          	add	a1,a1,a2
    21fc:	05d00613          	li	a2,93
    2200:	fffff097          	auipc	ra,0xfffff
    2204:	4e8080e7          	jalr	1256(ra) # 16e8 <putch_at>
    2208:	0040006f          	j	220c <draw_board+0x238>
    220c:	0040006f          	j	2210 <draw_board+0x23c>
    2210:	fd442503          	lw	a0,-44(s0)
    2214:	00150513          	addi	a0,a0,1
    2218:	fca42a23          	sw	a0,-44(s0)
    221c:	f61ff06f          	j	217c <draw_board+0x1a8>
    2220:	0040006f          	j	2224 <draw_board+0x250>
    2224:	fd842503          	lw	a0,-40(s0)
    2228:	00150513          	addi	a0,a0,1
    222c:	fca42c23          	sw	a0,-40(s0)
    2230:	f31ff06f          	j	2160 <draw_board+0x18c>
    2234:	00000097          	auipc	ra,0x0
    2238:	c60080e7          	jalr	-928(ra) # 1e94 <print_score>
    223c:	03812403          	lw	s0,56(sp)
    2240:	03c12083          	lw	ra,60(sp)
    2244:	04010113          	addi	sp,sp,64
    2248:	00008067          	ret

0000224c <add_score>:
    224c:	fe010113          	addi	sp,sp,-32
    2250:	00112e23          	sw	ra,28(sp)
    2254:	00812c23          	sw	s0,24(sp)
    2258:	02010413          	addi	s0,sp,32
    225c:	fea42a23          	sw	a0,-12(s0)
    2260:	ff442603          	lw	a2,-12(s0)
    2264:	000035b7          	lui	a1,0x3
    2268:	0805a503          	lw	a0,128(a1) # 3080 <score>
    226c:	00c50533          	add	a0,a0,a2
    2270:	08a5a023          	sw	a0,128(a1)
    2274:	00000513          	li	a0,0
    2278:	fea42823          	sw	a0,-16(s0)
    227c:	fea42623          	sw	a0,-20(s0)
    2280:	0040006f          	j	2284 <add_score+0x38>
    2284:	ff042583          	lw	a1,-16(s0)
    2288:	01f00513          	li	a0,31
    228c:	0ab56e63          	bltu	a0,a1,2348 <add_score+0xfc>
    2290:	0040006f          	j	2294 <add_score+0x48>
    2294:	ff042583          	lw	a1,-16(s0)
    2298:	00f00513          	li	a0,15
    229c:	00b51533          	sll	a0,a0,a1
    22a0:	fea42423          	sw	a0,-24(s0)
    22a4:	00003537          	lui	a0,0x3
    22a8:	08052503          	lw	a0,128(a0) # 3080 <score>
    22ac:	fe842583          	lw	a1,-24(s0)
    22b0:	00b57533          	and	a0,a0,a1
    22b4:	ff042583          	lw	a1,-16(s0)
    22b8:	00b55533          	srl	a0,a0,a1
    22bc:	fea42223          	sw	a0,-28(s0)
    22c0:	fec42583          	lw	a1,-20(s0)
    22c4:	fe442503          	lw	a0,-28(s0)
    22c8:	00b50533          	add	a0,a0,a1
    22cc:	fea42223          	sw	a0,-28(s0)
    22d0:	fe442503          	lw	a0,-28(s0)
    22d4:	00a00593          	li	a1,10
    22d8:	02b56063          	bltu	a0,a1,22f8 <add_score+0xac>
    22dc:	0040006f          	j	22e0 <add_score+0x94>
    22e0:	00100513          	li	a0,1
    22e4:	fea42623          	sw	a0,-20(s0)
    22e8:	fe442503          	lw	a0,-28(s0)
    22ec:	ff650513          	addi	a0,a0,-10
    22f0:	fea42223          	sw	a0,-28(s0)
    22f4:	0100006f          	j	2304 <add_score+0xb8>
    22f8:	00000513          	li	a0,0
    22fc:	fea42623          	sw	a0,-20(s0)
    2300:	0040006f          	j	2304 <add_score+0xb8>
    2304:	fe842503          	lw	a0,-24(s0)
    2308:	fff54613          	not	a2,a0
    230c:	000035b7          	lui	a1,0x3
    2310:	0805a503          	lw	a0,128(a1) # 3080 <score>
    2314:	00c57533          	and	a0,a0,a2
    2318:	08a5a023          	sw	a0,128(a1)
    231c:	fe442503          	lw	a0,-28(s0)
    2320:	ff042603          	lw	a2,-16(s0)
    2324:	00c51633          	sll	a2,a0,a2
    2328:	0805a503          	lw	a0,128(a1)
    232c:	00c56533          	or	a0,a0,a2
    2330:	08a5a023          	sw	a0,128(a1)
    2334:	0040006f          	j	2338 <add_score+0xec>
    2338:	ff042503          	lw	a0,-16(s0)
    233c:	00450513          	addi	a0,a0,4
    2340:	fea42823          	sw	a0,-16(s0)
    2344:	f41ff06f          	j	2284 <add_score+0x38>
    2348:	01812403          	lw	s0,24(sp)
    234c:	01c12083          	lw	ra,28(sp)
    2350:	02010113          	addi	sp,sp,32
    2354:	00008067          	ret

00002358 <check_clear>:
    2358:	fc010113          	addi	sp,sp,-64
    235c:	02112e23          	sw	ra,60(sp)
    2360:	02812c23          	sw	s0,56(sp)
    2364:	04010413          	addi	s0,sp,64
    2368:	00003537          	lui	a0,0x3
    236c:	06c50513          	addi	a0,a0,108 # 306c <current>
    2370:	00c52583          	lw	a1,12(a0)
    2374:	00001637          	lui	a2,0x1
    2378:	ff060613          	addi	a2,a2,-16 # ff0 <_start-0x10>
    237c:	00c5f5b3          	and	a1,a1,a2
    2380:	0045d593          	srli	a1,a1,0x4
    2384:	feb42a23          	sw	a1,-12(s0)
    2388:	00c52503          	lw	a0,12(a0)
    238c:	00357513          	andi	a0,a0,3
    2390:	fea42823          	sw	a0,-16(s0)
    2394:	ff442503          	lw	a0,-12(s0)
    2398:	ff042583          	lw	a1,-16(s0)
    239c:	00b50533          	add	a0,a0,a1
    23a0:	fea42623          	sw	a0,-20(s0)
    23a4:	0040006f          	j	23a8 <check_clear+0x50>
    23a8:	fec42503          	lw	a0,-20(s0)
    23ac:	ff442583          	lw	a1,-12(s0)
    23b0:	1ab56c63          	bltu	a0,a1,2568 <check_clear+0x210>
    23b4:	0040006f          	j	23b8 <check_clear+0x60>
    23b8:	00000513          	li	a0,0
    23bc:	fea42423          	sw	a0,-24(s0)
    23c0:	fea42223          	sw	a0,-28(s0)
    23c4:	0040006f          	j	23c8 <check_clear+0x70>
    23c8:	fe442583          	lw	a1,-28(s0)
    23cc:	00900513          	li	a0,9
    23d0:	06b54663          	blt	a0,a1,243c <check_clear+0xe4>
    23d4:	0040006f          	j	23d8 <check_clear+0x80>
    23d8:	00003537          	lui	a0,0x3
    23dc:	07c52503          	lw	a0,124(a0) # 307c <_end>
    23e0:	fca42c23          	sw	a0,-40(s0)
    23e4:	fec42503          	lw	a0,-20(s0)
    23e8:	00a00593          	li	a1,10
    23ec:	fffff097          	auipc	ra,0xfffff
    23f0:	d5c080e7          	jalr	-676(ra) # 1148 <wk_mul>
    23f4:	00050593          	mv	a1,a0
    23f8:	fd842503          	lw	a0,-40(s0)
    23fc:	fe442603          	lw	a2,-28(s0)
    2400:	00c585b3          	add	a1,a1,a2
    2404:	00b50533          	add	a0,a0,a1
    2408:	00054503          	lbu	a0,0(a0)
    240c:	00000593          	li	a1,0
    2410:	00b50c63          	beq	a0,a1,2428 <check_clear+0xd0>
    2414:	0040006f          	j	2418 <check_clear+0xc0>
    2418:	fe842503          	lw	a0,-24(s0)
    241c:	00150513          	addi	a0,a0,1
    2420:	fea42423          	sw	a0,-24(s0)
    2424:	0040006f          	j	2428 <check_clear+0xd0>
    2428:	0040006f          	j	242c <check_clear+0xd4>
    242c:	fe442503          	lw	a0,-28(s0)
    2430:	00150513          	addi	a0,a0,1
    2434:	fea42223          	sw	a0,-28(s0)
    2438:	f91ff06f          	j	23c8 <check_clear+0x70>
    243c:	fe842503          	lw	a0,-24(s0)
    2440:	00a00593          	li	a1,10
    2444:	10b51863          	bne	a0,a1,2554 <check_clear+0x1fc>
    2448:	0040006f          	j	244c <check_clear+0xf4>
    244c:	00100513          	li	a0,1
    2450:	00000097          	auipc	ra,0x0
    2454:	dfc080e7          	jalr	-516(ra) # 224c <add_score>
    2458:	fec42503          	lw	a0,-20(s0)
    245c:	fff50513          	addi	a0,a0,-1
    2460:	fea42023          	sw	a0,-32(s0)
    2464:	0040006f          	j	2468 <check_clear+0x110>
    2468:	fe042583          	lw	a1,-32(s0)
    246c:	00000513          	li	a0,0
    2470:	0cb55463          	bge	a0,a1,2538 <check_clear+0x1e0>
    2474:	0040006f          	j	2478 <check_clear+0x120>
    2478:	00000513          	li	a0,0
    247c:	fca42e23          	sw	a0,-36(s0)
    2480:	0040006f          	j	2484 <check_clear+0x12c>
    2484:	fdc42583          	lw	a1,-36(s0)
    2488:	00900513          	li	a0,9
    248c:	08b54c63          	blt	a0,a1,2524 <check_clear+0x1cc>
    2490:	0040006f          	j	2494 <check_clear+0x13c>
    2494:	00003537          	lui	a0,0x3
    2498:	fca42623          	sw	a0,-52(s0)
    249c:	07c52503          	lw	a0,124(a0) # 307c <_end>
    24a0:	fca42223          	sw	a0,-60(s0)
    24a4:	fe042503          	lw	a0,-32(s0)
    24a8:	00a00593          	li	a1,10
    24ac:	fcb42423          	sw	a1,-56(s0)
    24b0:	fffff097          	auipc	ra,0xfffff
    24b4:	c98080e7          	jalr	-872(ra) # 1148 <wk_mul>
    24b8:	fc442603          	lw	a2,-60(s0)
    24bc:	fc842583          	lw	a1,-56(s0)
    24c0:	00050693          	mv	a3,a0
    24c4:	fcc42503          	lw	a0,-52(s0)
    24c8:	fdc42703          	lw	a4,-36(s0)
    24cc:	00e686b3          	add	a3,a3,a4
    24d0:	00d60633          	add	a2,a2,a3
    24d4:	00060603          	lb	a2,0(a2)
    24d8:	fcc42a23          	sw	a2,-44(s0)
    24dc:	07c52503          	lw	a0,124(a0)
    24e0:	fca42823          	sw	a0,-48(s0)
    24e4:	fe042503          	lw	a0,-32(s0)
    24e8:	00150513          	addi	a0,a0,1
    24ec:	fffff097          	auipc	ra,0xfffff
    24f0:	c5c080e7          	jalr	-932(ra) # 1148 <wk_mul>
    24f4:	fd042583          	lw	a1,-48(s0)
    24f8:	00050613          	mv	a2,a0
    24fc:	fd442503          	lw	a0,-44(s0)
    2500:	fdc42683          	lw	a3,-36(s0)
    2504:	00d60633          	add	a2,a2,a3
    2508:	00c585b3          	add	a1,a1,a2
    250c:	00a58023          	sb	a0,0(a1)
    2510:	0040006f          	j	2514 <check_clear+0x1bc>
    2514:	fdc42503          	lw	a0,-36(s0)
    2518:	00150513          	addi	a0,a0,1
    251c:	fca42e23          	sw	a0,-36(s0)
    2520:	f65ff06f          	j	2484 <check_clear+0x12c>
    2524:	0040006f          	j	2528 <check_clear+0x1d0>
    2528:	fe042503          	lw	a0,-32(s0)
    252c:	fff50513          	addi	a0,a0,-1
    2530:	fea42023          	sw	a0,-32(s0)
    2534:	f35ff06f          	j	2468 <check_clear+0x110>
    2538:	fec42503          	lw	a0,-20(s0)
    253c:	00150513          	addi	a0,a0,1
    2540:	fea42623          	sw	a0,-20(s0)
    2544:	ff442503          	lw	a0,-12(s0)
    2548:	00150513          	addi	a0,a0,1
    254c:	fea42a23          	sw	a0,-12(s0)
    2550:	0040006f          	j	2554 <check_clear+0x1fc>
    2554:	0040006f          	j	2558 <check_clear+0x200>
    2558:	fec42503          	lw	a0,-20(s0)
    255c:	fff50513          	addi	a0,a0,-1
    2560:	fea42623          	sw	a0,-20(s0)
    2564:	e45ff06f          	j	23a8 <check_clear+0x50>
    2568:	03812403          	lw	s0,56(sp)
    256c:	03c12083          	lw	ra,60(sp)
    2570:	04010113          	addi	sp,sp,64
    2574:	00008067          	ret

00002578 <rand>:
    2578:	ff010113          	addi	sp,sp,-16
    257c:	00112623          	sw	ra,12(sp)
    2580:	00812423          	sw	s0,8(sp)
    2584:	01010413          	addi	s0,sp,16
    2588:	00003537          	lui	a0,0x3
    258c:	fea42a23          	sw	a0,-12(s0)
    2590:	06852583          	lw	a1,104(a0) # 3068 <rand.seed>
    2594:	41c65537          	lui	a0,0x41c65
    2598:	e6d50513          	addi	a0,a0,-403 # 41c64e6d <score+0x41c61ded>
    259c:	fffff097          	auipc	ra,0xfffff
    25a0:	bac080e7          	jalr	-1108(ra) # 1148 <wk_mul>
    25a4:	00050593          	mv	a1,a0
    25a8:	ff442503          	lw	a0,-12(s0)
    25ac:	00003637          	lui	a2,0x3
    25b0:	03960613          	addi	a2,a2,57 # 3039 <.LJTI21_0+0x1d>
    25b4:	00c585b3          	add	a1,a1,a2
    25b8:	80000637          	lui	a2,0x80000
    25bc:	fff60613          	addi	a2,a2,-1 # 7fffffff <score+0x7fffcf7f>
    25c0:	00c5f5b3          	and	a1,a1,a2
    25c4:	06b52423          	sw	a1,104(a0)
    25c8:	06852503          	lw	a0,104(a0)
    25cc:	00812403          	lw	s0,8(sp)
    25d0:	00c12083          	lw	ra,12(sp)
    25d4:	01010113          	addi	sp,sp,16
    25d8:	00008067          	ret

000025dc <rand_type>:
    25dc:	ff010113          	addi	sp,sp,-16
    25e0:	00112623          	sw	ra,12(sp)
    25e4:	00812423          	sw	s0,8(sp)
    25e8:	01010413          	addi	s0,sp,16
    25ec:	00000097          	auipc	ra,0x0
    25f0:	f8c080e7          	jalr	-116(ra) # 2578 <rand>
    25f4:	00757513          	andi	a0,a0,7
    25f8:	fea42a23          	sw	a0,-12(s0)
    25fc:	0040006f          	j	2600 <rand_type+0x24>
    2600:	ff442503          	lw	a0,-12(s0)
    2604:	00700593          	li	a1,7
    2608:	00b51e63          	bne	a0,a1,2624 <rand_type+0x48>
    260c:	0040006f          	j	2610 <rand_type+0x34>
    2610:	00000097          	auipc	ra,0x0
    2614:	f68080e7          	jalr	-152(ra) # 2578 <rand>
    2618:	00757513          	andi	a0,a0,7
    261c:	fea42a23          	sw	a0,-12(s0)
    2620:	fe1ff06f          	j	2600 <rand_type+0x24>
    2624:	ff442503          	lw	a0,-12(s0)
    2628:	00812403          	lw	s0,8(sp)
    262c:	00c12083          	lw	ra,12(sp)
    2630:	01010113          	addi	sp,sp,16
    2634:	00008067          	ret

00002638 <fall>:
    2638:	ff010113          	addi	sp,sp,-16
    263c:	00112623          	sw	ra,12(sp)
    2640:	00812423          	sw	s0,8(sp)
    2644:	01010413          	addi	s0,sp,16
    2648:	00003537          	lui	a0,0x3
    264c:	06c50513          	addi	a0,a0,108 # 306c <current>
    2650:	00200593          	li	a1,2
    2654:	fffff097          	auipc	ra,0xfffff
    2658:	20c080e7          	jalr	524(ra) # 1860 <move>
    265c:	00000593          	li	a1,0
    2660:	04b51463          	bne	a0,a1,26a8 <fall+0x70>
    2664:	0040006f          	j	2668 <fall+0x30>
    2668:	00003537          	lui	a0,0x3
    266c:	06c50513          	addi	a0,a0,108 # 306c <current>
    2670:	fea42a23          	sw	a0,-12(s0)
    2674:	fffff097          	auipc	ra,0xfffff
    2678:	6e0080e7          	jalr	1760(ra) # 1d54 <fix_block>
    267c:	00000097          	auipc	ra,0x0
    2680:	cdc080e7          	jalr	-804(ra) # 2358 <check_clear>
    2684:	00000097          	auipc	ra,0x0
    2688:	f58080e7          	jalr	-168(ra) # 25dc <rand_type>
    268c:	00050593          	mv	a1,a0
    2690:	ff442503          	lw	a0,-12(s0)
    2694:	00400613          	li	a2,4
    2698:	00000693          	li	a3,0
    269c:	fffff097          	auipc	ra,0xfffff
    26a0:	b94080e7          	jalr	-1132(ra) # 1230 <init_block>
    26a4:	0040006f          	j	26a8 <fall+0x70>
    26a8:	00812403          	lw	s0,8(sp)
    26ac:	00c12083          	lw	ra,12(sp)
    26b0:	01010113          	addi	sp,sp,16
    26b4:	00008067          	ret

000026b8 <on_input>:
    26b8:	ff010113          	addi	sp,sp,-16
    26bc:	00112623          	sw	ra,12(sp)
    26c0:	00812423          	sw	s0,8(sp)
    26c4:	01010413          	addi	s0,sp,16
    26c8:	fea42a23          	sw	a0,-12(s0)
    26cc:	ff442503          	lw	a0,-12(s0)
    26d0:	f9f50593          	addi	a1,a0,-97
    26d4:	feb42823          	sw	a1,-16(s0)
    26d8:	01200513          	li	a0,18
    26dc:	08b56663          	bltu	a0,a1,2768 <.LBB21_7>
    26e0:	ff042503          	lw	a0,-16(s0)
    26e4:	00251513          	slli	a0,a0,0x2
    26e8:	000035b7          	lui	a1,0x3
    26ec:	01c58593          	addi	a1,a1,28 # 301c <.LJTI21_0>
    26f0:	00b50533          	add	a0,a0,a1
    26f4:	00052503          	lw	a0,0(a0)
    26f8:	00050067          	jr	a0

000026fc <.LBB21_2>:
    26fc:	00000097          	auipc	ra,0x0
    2700:	f3c080e7          	jalr	-196(ra) # 2638 <fall>
    2704:	0640006f          	j	2768 <.LBB21_7>

00002708 <.LBB21_3>:
    2708:	00003537          	lui	a0,0x3
    270c:	06c50513          	addi	a0,a0,108 # 306c <current>
    2710:	00000593          	li	a1,0
    2714:	fffff097          	auipc	ra,0xfffff
    2718:	14c080e7          	jalr	332(ra) # 1860 <move>
    271c:	04c0006f          	j	2768 <.LBB21_7>

00002720 <.LBB21_4>:
    2720:	00003537          	lui	a0,0x3
    2724:	06c50513          	addi	a0,a0,108 # 306c <current>
    2728:	00100593          	li	a1,1
    272c:	fffff097          	auipc	ra,0xfffff
    2730:	134080e7          	jalr	308(ra) # 1860 <move>
    2734:	0340006f          	j	2768 <.LBB21_7>

00002738 <.LBB21_5>:
    2738:	00003537          	lui	a0,0x3
    273c:	06c50513          	addi	a0,a0,108 # 306c <current>
    2740:	00000593          	li	a1,0
    2744:	fffff097          	auipc	ra,0xfffff
    2748:	42c080e7          	jalr	1068(ra) # 1b70 <rotate>
    274c:	01c0006f          	j	2768 <.LBB21_7>

00002750 <.LBB21_6>:
    2750:	00003537          	lui	a0,0x3
    2754:	06c50513          	addi	a0,a0,108 # 306c <current>
    2758:	00100593          	li	a1,1
    275c:	fffff097          	auipc	ra,0xfffff
    2760:	414080e7          	jalr	1044(ra) # 1b70 <rotate>
    2764:	0040006f          	j	2768 <.LBB21_7>

00002768 <.LBB21_7>:
    2768:	00000097          	auipc	ra,0x0
    276c:	86c080e7          	jalr	-1940(ra) # 1fd4 <draw_board>
    2770:	00812403          	lw	s0,8(sp)
    2774:	00c12083          	lw	ra,12(sp)
    2778:	01010113          	addi	sp,sp,16
    277c:	00008067          	ret

00002780 <on_timer>:
    2780:	ff010113          	addi	sp,sp,-16
    2784:	00112623          	sw	ra,12(sp)
    2788:	00812423          	sw	s0,8(sp)
    278c:	01010413          	addi	s0,sp,16
    2790:	00000097          	auipc	ra,0x0
    2794:	ea8080e7          	jalr	-344(ra) # 2638 <fall>
    2798:	00000097          	auipc	ra,0x0
    279c:	83c080e7          	jalr	-1988(ra) # 1fd4 <draw_board>
    27a0:	00812403          	lw	s0,8(sp)
    27a4:	00c12083          	lw	ra,12(sp)
    27a8:	01010113          	addi	sp,sp,16
    27ac:	00008067          	ret

000027b0 <trap_handler>:
    27b0:	fe010113          	addi	sp,sp,-32
    27b4:	00112e23          	sw	ra,28(sp)
    27b8:	00812c23          	sw	s0,24(sp)
    27bc:	02010413          	addi	s0,sp,32
    27c0:	fea42a23          	sw	a0,-12(s0)
    27c4:	feb42823          	sw	a1,-16(s0)
    27c8:	ff042503          	lw	a0,-16(s0)
    27cc:	800005b7          	lui	a1,0x80000
    27d0:	00758593          	addi	a1,a1,7 # 80000007 <score+0x7fffcf87>
    27d4:	00b51a63          	bne	a0,a1,27e8 <trap_handler+0x38>
    27d8:	0040006f          	j	27dc <trap_handler+0x2c>
    27dc:	00000097          	auipc	ra,0x0
    27e0:	fa4080e7          	jalr	-92(ra) # 2780 <on_timer>
    27e4:	0280006f          	j	280c <trap_handler+0x5c>
    27e8:	400005b7          	lui	a1,0x40000
    27ec:	00c5a503          	lw	a0,12(a1) # 4000000c <score+0x3fffcf8c>
    27f0:	fea42623          	sw	a0,-20(s0)
    27f4:	fec42503          	lw	a0,-20(s0)
    27f8:	00a5a823          	sw	a0,16(a1)
    27fc:	fec42503          	lw	a0,-20(s0)
    2800:	00000097          	auipc	ra,0x0
    2804:	eb8080e7          	jalr	-328(ra) # 26b8 <on_input>
    2808:	0040006f          	j	280c <trap_handler+0x5c>
    280c:	01812403          	lw	s0,24(sp)
    2810:	01c12083          	lw	ra,28(sp)
    2814:	02010113          	addi	sp,sp,32
    2818:	00008067          	ret

0000281c <init>:
    281c:	fc010113          	addi	sp,sp,-64
    2820:	02112e23          	sw	ra,60(sp)
    2824:	02812c23          	sw	s0,56(sp)
    2828:	04010413          	addi	s0,sp,64
    282c:	fffff097          	auipc	ra,0xfffff
    2830:	4ac080e7          	jalr	1196(ra) # 1cd8 <clear_board>
    2834:	00000513          	li	a0,0
    2838:	fea42a23          	sw	a0,-12(s0)
    283c:	0040006f          	j	2840 <init+0x24>
    2840:	ff442583          	lw	a1,-12(s0)
    2844:	01500513          	li	a0,21
    2848:	04b54463          	blt	a0,a1,2890 <init+0x74>
    284c:	0040006f          	j	2850 <init+0x34>
    2850:	ff442583          	lw	a1,-12(s0)
    2854:	00000513          	li	a0,0
    2858:	07c00613          	li	a2,124
    285c:	fec42423          	sw	a2,-24(s0)
    2860:	fffff097          	auipc	ra,0xfffff
    2864:	e88080e7          	jalr	-376(ra) # 16e8 <putch_at>
    2868:	fe842603          	lw	a2,-24(s0)
    286c:	ff442583          	lw	a1,-12(s0)
    2870:	01500513          	li	a0,21
    2874:	fffff097          	auipc	ra,0xfffff
    2878:	e74080e7          	jalr	-396(ra) # 16e8 <putch_at>
    287c:	0040006f          	j	2880 <init+0x64>
    2880:	ff442503          	lw	a0,-12(s0)
    2884:	00150513          	addi	a0,a0,1
    2888:	fea42a23          	sw	a0,-12(s0)
    288c:	fb5ff06f          	j	2840 <init+0x24>
    2890:	00000513          	li	a0,0
    2894:	fea42823          	sw	a0,-16(s0)
    2898:	0040006f          	j	289c <init+0x80>
    289c:	ff042583          	lw	a1,-16(s0)
    28a0:	00001537          	lui	a0,0x1
    28a4:	80150513          	addi	a0,a0,-2047 # 801 <_start-0x7ff>
    28a8:	02b54863          	blt	a0,a1,28d8 <init+0xbc>
    28ac:	0040006f          	j	28b0 <init+0x94>
    28b0:	ff042503          	lw	a0,-16(s0)
    28b4:	01600593          	li	a1,22
    28b8:	02d00613          	li	a2,45
    28bc:	fffff097          	auipc	ra,0xfffff
    28c0:	e2c080e7          	jalr	-468(ra) # 16e8 <putch_at>
    28c4:	0040006f          	j	28c8 <init+0xac>
    28c8:	ff042503          	lw	a0,-16(s0)
    28cc:	00150513          	addi	a0,a0,1
    28d0:	fea42823          	sw	a0,-16(s0)
    28d4:	fc9ff06f          	j	289c <init+0x80>
    28d8:	00800513          	li	a0,8
    28dc:	fea42623          	sw	a0,-20(s0)
    28e0:	fec42503          	lw	a0,-20(s0)
    28e4:	00150593          	addi	a1,a0,1
    28e8:	feb42623          	sw	a1,-20(s0)
    28ec:	01700593          	li	a1,23
    28f0:	fcb42823          	sw	a1,-48(s0)
    28f4:	05400613          	li	a2,84
    28f8:	fcc42623          	sw	a2,-52(s0)
    28fc:	fffff097          	auipc	ra,0xfffff
    2900:	dec080e7          	jalr	-532(ra) # 16e8 <putch_at>
    2904:	fd042583          	lw	a1,-48(s0)
    2908:	fec42503          	lw	a0,-20(s0)
    290c:	00150613          	addi	a2,a0,1
    2910:	fec42623          	sw	a2,-20(s0)
    2914:	04500613          	li	a2,69
    2918:	fffff097          	auipc	ra,0xfffff
    291c:	dd0080e7          	jalr	-560(ra) # 16e8 <putch_at>
    2920:	fcc42603          	lw	a2,-52(s0)
    2924:	fd042583          	lw	a1,-48(s0)
    2928:	fec42503          	lw	a0,-20(s0)
    292c:	00150693          	addi	a3,a0,1
    2930:	fed42623          	sw	a3,-20(s0)
    2934:	fffff097          	auipc	ra,0xfffff
    2938:	db4080e7          	jalr	-588(ra) # 16e8 <putch_at>
    293c:	fd042583          	lw	a1,-48(s0)
    2940:	fec42503          	lw	a0,-20(s0)
    2944:	00150613          	addi	a2,a0,1
    2948:	fec42623          	sw	a2,-20(s0)
    294c:	05200613          	li	a2,82
    2950:	fffff097          	auipc	ra,0xfffff
    2954:	d98080e7          	jalr	-616(ra) # 16e8 <putch_at>
    2958:	fd042583          	lw	a1,-48(s0)
    295c:	fec42503          	lw	a0,-20(s0)
    2960:	00150613          	addi	a2,a0,1
    2964:	fec42623          	sw	a2,-20(s0)
    2968:	04900613          	li	a2,73
    296c:	fffff097          	auipc	ra,0xfffff
    2970:	d7c080e7          	jalr	-644(ra) # 16e8 <putch_at>
    2974:	fd042583          	lw	a1,-48(s0)
    2978:	fec42503          	lw	a0,-20(s0)
    297c:	00150613          	addi	a2,a0,1
    2980:	fec42623          	sw	a2,-20(s0)
    2984:	05300613          	li	a2,83
    2988:	fffff097          	auipc	ra,0xfffff
    298c:	d60080e7          	jalr	-672(ra) # 16e8 <putch_at>
    2990:	00600513          	li	a0,6
    2994:	fea42623          	sw	a0,-20(s0)
    2998:	fec42503          	lw	a0,-20(s0)
    299c:	00150593          	addi	a1,a0,1
    29a0:	feb42623          	sw	a1,-20(s0)
    29a4:	01900593          	li	a1,25
    29a8:	fcb42c23          	sw	a1,-40(s0)
    29ac:	04800613          	li	a2,72
    29b0:	fffff097          	auipc	ra,0xfffff
    29b4:	d38080e7          	jalr	-712(ra) # 16e8 <putch_at>
    29b8:	fd842583          	lw	a1,-40(s0)
    29bc:	fec42503          	lw	a0,-20(s0)
    29c0:	00150613          	addi	a2,a0,1
    29c4:	fec42623          	sw	a2,-20(s0)
    29c8:	06f00613          	li	a2,111
    29cc:	fffff097          	auipc	ra,0xfffff
    29d0:	d1c080e7          	jalr	-740(ra) # 16e8 <putch_at>
    29d4:	fd842583          	lw	a1,-40(s0)
    29d8:	fec42503          	lw	a0,-20(s0)
    29dc:	00150613          	addi	a2,a0,1
    29e0:	fec42623          	sw	a2,-20(s0)
    29e4:	07700613          	li	a2,119
    29e8:	fffff097          	auipc	ra,0xfffff
    29ec:	d00080e7          	jalr	-768(ra) # 16e8 <putch_at>
    29f0:	fd842583          	lw	a1,-40(s0)
    29f4:	fec42503          	lw	a0,-20(s0)
    29f8:	00150613          	addi	a2,a0,1
    29fc:	fec42623          	sw	a2,-20(s0)
    2a00:	06100613          	li	a2,97
    2a04:	fcc42a23          	sw	a2,-44(s0)
    2a08:	fffff097          	auipc	ra,0xfffff
    2a0c:	ce0080e7          	jalr	-800(ra) # 16e8 <putch_at>
    2a10:	fd842583          	lw	a1,-40(s0)
    2a14:	fec42503          	lw	a0,-20(s0)
    2a18:	00150613          	addi	a2,a0,1
    2a1c:	fec42623          	sw	a2,-20(s0)
    2a20:	07200613          	li	a2,114
    2a24:	fffff097          	auipc	ra,0xfffff
    2a28:	cc4080e7          	jalr	-828(ra) # 16e8 <putch_at>
    2a2c:	fd842583          	lw	a1,-40(s0)
    2a30:	fec42503          	lw	a0,-20(s0)
    2a34:	00150613          	addi	a2,a0,1
    2a38:	fec42623          	sw	a2,-20(s0)
    2a3c:	06400613          	li	a2,100
    2a40:	fffff097          	auipc	ra,0xfffff
    2a44:	ca8080e7          	jalr	-856(ra) # 16e8 <putch_at>
    2a48:	fd842583          	lw	a1,-40(s0)
    2a4c:	fec42503          	lw	a0,-20(s0)
    2a50:	00150513          	addi	a0,a0,1
    2a54:	fea42623          	sw	a0,-20(s0)
    2a58:	fec42503          	lw	a0,-20(s0)
    2a5c:	00150613          	addi	a2,a0,1
    2a60:	fec42623          	sw	a2,-20(s0)
    2a64:	04c00613          	li	a2,76
    2a68:	fffff097          	auipc	ra,0xfffff
    2a6c:	c80080e7          	jalr	-896(ra) # 16e8 <putch_at>
    2a70:	fd442603          	lw	a2,-44(s0)
    2a74:	fd842583          	lw	a1,-40(s0)
    2a78:	fec42503          	lw	a0,-20(s0)
    2a7c:	00150693          	addi	a3,a0,1
    2a80:	fed42623          	sw	a3,-20(s0)
    2a84:	fffff097          	auipc	ra,0xfffff
    2a88:	c64080e7          	jalr	-924(ra) # 16e8 <putch_at>
    2a8c:	fd842583          	lw	a1,-40(s0)
    2a90:	fec42503          	lw	a0,-20(s0)
    2a94:	00150613          	addi	a2,a0,1
    2a98:	fec42623          	sw	a2,-20(s0)
    2a9c:	07500613          	li	a2,117
    2aa0:	fffff097          	auipc	ra,0xfffff
    2aa4:	c48080e7          	jalr	-952(ra) # 16e8 <putch_at>
    2aa8:	00900513          	li	a0,9
    2aac:	fea42623          	sw	a0,-20(s0)
    2ab0:	fec42503          	lw	a0,-20(s0)
    2ab4:	00150593          	addi	a1,a0,1
    2ab8:	feb42623          	sw	a1,-20(s0)
    2abc:	01a00593          	li	a1,26
    2ac0:	feb42023          	sw	a1,-32(s0)
    2ac4:	03200613          	li	a2,50
    2ac8:	fcc42e23          	sw	a2,-36(s0)
    2acc:	fffff097          	auipc	ra,0xfffff
    2ad0:	c1c080e7          	jalr	-996(ra) # 16e8 <putch_at>
    2ad4:	fe042583          	lw	a1,-32(s0)
    2ad8:	fec42503          	lw	a0,-20(s0)
    2adc:	00150613          	addi	a2,a0,1
    2ae0:	fec42623          	sw	a2,-20(s0)
    2ae4:	03000613          	li	a2,48
    2ae8:	fffff097          	auipc	ra,0xfffff
    2aec:	c00080e7          	jalr	-1024(ra) # 16e8 <putch_at>
    2af0:	fdc42603          	lw	a2,-36(s0)
    2af4:	fe042583          	lw	a1,-32(s0)
    2af8:	fec42503          	lw	a0,-20(s0)
    2afc:	00150693          	addi	a3,a0,1
    2b00:	fed42623          	sw	a3,-20(s0)
    2b04:	fffff097          	auipc	ra,0xfffff
    2b08:	be4080e7          	jalr	-1052(ra) # 16e8 <putch_at>
    2b0c:	fe042583          	lw	a1,-32(s0)
    2b10:	fec42503          	lw	a0,-20(s0)
    2b14:	00150613          	addi	a2,a0,1
    2b18:	fec42623          	sw	a2,-20(s0)
    2b1c:	03100613          	li	a2,49
    2b20:	fffff097          	auipc	ra,0xfffff
    2b24:	bc8080e7          	jalr	-1080(ra) # 16e8 <putch_at>
    2b28:	00000097          	auipc	ra,0x0
    2b2c:	ab4080e7          	jalr	-1356(ra) # 25dc <rand_type>
    2b30:	00050593          	mv	a1,a0
    2b34:	00003537          	lui	a0,0x3
    2b38:	06c50513          	addi	a0,a0,108 # 306c <current>
    2b3c:	00400613          	li	a2,4
    2b40:	00000693          	li	a3,0
    2b44:	fed42223          	sw	a3,-28(s0)
    2b48:	ffffe097          	auipc	ra,0xffffe
    2b4c:	6e8080e7          	jalr	1768(ra) # 1230 <init_block>
    2b50:	fe442503          	lw	a0,-28(s0)
    2b54:	000035b7          	lui	a1,0x3
    2b58:	08a5a023          	sw	a0,128(a1) # 3080 <score>
    2b5c:	fffff097          	auipc	ra,0xfffff
    2b60:	478080e7          	jalr	1144(ra) # 1fd4 <draw_board>
    2b64:	03812403          	lw	s0,56(sp)
    2b68:	03c12083          	lw	ra,60(sp)
    2b6c:	04010113          	addi	sp,sp,64
    2b70:	00008067          	ret

00002b74 <clear_screen>:
    2b74:	ff010113          	addi	sp,sp,-16
    2b78:	00112623          	sw	ra,12(sp)
    2b7c:	00812423          	sw	s0,8(sp)
    2b80:	01010413          	addi	s0,sp,16
    2b84:	20000537          	lui	a0,0x20000
    2b88:	fea42a23          	sw	a0,-12(s0)
    2b8c:	00000513          	li	a0,0
    2b90:	fea42823          	sw	a0,-16(s0)
    2b94:	0040006f          	j	2b98 <clear_screen+0x24>
    2b98:	ff042583          	lw	a1,-16(s0)
    2b9c:	25700513          	li	a0,599
    2ba0:	02b54c63          	blt	a0,a1,2bd8 <clear_screen+0x64>
    2ba4:	0040006f          	j	2ba8 <clear_screen+0x34>
    2ba8:	ff442503          	lw	a0,-12(s0)
    2bac:	ff042583          	lw	a1,-16(s0)
    2bb0:	00259593          	slli	a1,a1,0x2
    2bb4:	00b505b3          	add	a1,a0,a1
    2bb8:	20202537          	lui	a0,0x20202
    2bbc:	02050513          	addi	a0,a0,32 # 20202020 <score+0x201fefa0>
    2bc0:	00a5a023          	sw	a0,0(a1)
    2bc4:	0040006f          	j	2bc8 <clear_screen+0x54>
    2bc8:	ff042503          	lw	a0,-16(s0)
    2bcc:	00150513          	addi	a0,a0,1
    2bd0:	fea42823          	sw	a0,-16(s0)
    2bd4:	fc5ff06f          	j	2b98 <clear_screen+0x24>
    2bd8:	00812403          	lw	s0,8(sp)
    2bdc:	00c12083          	lw	ra,12(sp)
    2be0:	01010113          	addi	sp,sp,16
    2be4:	00008067          	ret

00002be8 <main>:
    2be8:	ff010113          	addi	sp,sp,-16
    2bec:	00112623          	sw	ra,12(sp)
    2bf0:	00812423          	sw	s0,8(sp)
    2bf4:	01010413          	addi	s0,sp,16
    2bf8:	00000513          	li	a0,0
    2bfc:	fea42a23          	sw	a0,-12(s0)
    2c00:	000035b7          	lui	a1,0x3
    2c04:	00004537          	lui	a0,0x4
    2c08:	06a5ae23          	sw	a0,124(a1) # 307c <_end>
    2c0c:	00000097          	auipc	ra,0x0
    2c10:	f68080e7          	jalr	-152(ra) # 2b74 <clear_screen>
    2c14:	00000097          	auipc	ra,0x0
    2c18:	c08080e7          	jalr	-1016(ra) # 281c <init>
    2c1c:	deadc537          	lui	a0,0xdeadc
    2c20:	eef50513          	addi	a0,a0,-273 # deadbeef <score+0xdead8e6f>
    2c24:	00a02223          	sw	a0,4(zero) # 4 <_start-0xffc>
    2c28:	ffffe097          	auipc	ra,0xffffe
    2c2c:	3e8080e7          	jalr	1000(ra) # 1010 <enable_interrupt>
    2c30:	800005b7          	lui	a1,0x80000
    2c34:	00100513          	li	a0,1
    2c38:	00a5a423          	sw	a0,8(a1) # 80000008 <score+0x7fffcf88>
    2c3c:	02faf537          	lui	a0,0x2faf
    2c40:	08050513          	addi	a0,a0,128 # 2faf080 <score+0x2fac000>
    2c44:	00a5a223          	sw	a0,4(a1)
    2c48:	0040006f          	j	2c4c <main+0x64>
    2c4c:	0000006f          	j	2c4c <main+0x64>

Disassembly of section .data:

00003000 <.LJTI2_0>:
    3000:	12a0                	addi	s0,sp,360
    3002:	0000                	unimp
    3004:	12c0                	addi	s0,sp,356
    3006:	0000                	unimp
    3008:	12e4                	addi	s1,sp,364
    300a:	0000                	unimp
    300c:	1310                	addi	a2,sp,416
    300e:	0000                	unimp
    3010:	1338                	addi	a4,sp,424
    3012:	0000                	unimp
    3014:	1360                	addi	s0,sp,428
    3016:	0000                	unimp
    3018:	138c                	addi	a1,sp,480
	...

0000301c <.LJTI21_0>:
    301c:	2708                	fld	fa0,8(a4)
    301e:	0000                	unimp
    3020:	2768                	fld	fa0,200(a4)
    3022:	0000                	unimp
    3024:	2768                	fld	fa0,200(a4)
    3026:	0000                	unimp
    3028:	2720                	fld	fs0,72(a4)
    302a:	0000                	unimp
    302c:	2768                	fld	fa0,200(a4)
    302e:	0000                	unimp
    3030:	2768                	fld	fa0,200(a4)
    3032:	0000                	unimp
    3034:	2768                	fld	fa0,200(a4)
    3036:	0000                	unimp
    3038:	2768                	fld	fa0,200(a4)
    303a:	0000                	unimp
    303c:	2768                	fld	fa0,200(a4)
    303e:	0000                	unimp
    3040:	2738                	fld	fa4,72(a4)
    3042:	0000                	unimp
    3044:	2750                	fld	fa2,136(a4)
    3046:	0000                	unimp
    3048:	2768                	fld	fa0,200(a4)
    304a:	0000                	unimp
    304c:	2768                	fld	fa0,200(a4)
    304e:	0000                	unimp
    3050:	2768                	fld	fa0,200(a4)
    3052:	0000                	unimp
    3054:	2768                	fld	fa0,200(a4)
    3056:	0000                	unimp
    3058:	2768                	fld	fa0,200(a4)
    305a:	0000                	unimp
    305c:	2768                	fld	fa0,200(a4)
    305e:	0000                	unimp
    3060:	2768                	fld	fa0,200(a4)
    3062:	0000                	unimp
    3064:	26fc                	fld	fa5,200(a3)
	...

00003068 <rand.seed>:
    3068:	000f1c6b          	0xf1c6b

Disassembly of section .bss:

0000306c <current>:
	...

Disassembly of section .sbss:

0000307c <board>:
    307c:	0000                	unimp
	...

00003080 <score>:
    3080:	0000                	unimp
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	6e616c63          	bltu	sp,t1,6f8 <_start-0x908>
   4:	65762067          	0x65762067
   8:	7372                	flw	ft6,60(sp)
   a:	6f69                	lui	t5,0x1a
   c:	206e                	fld	ft0,216(sp)
   e:	3331                	jal	fffffd1a <score+0xffffcc9a>
  10:	302e                	fld	ft0,232(sp)
  12:	312e                	fld	ft2,232(sp)
  14:	4c00                	lw	s0,24(s0)
  16:	6e69                	lui	t3,0x1a
  18:	3a72656b          	0x3a72656b
  1c:	4c20                	lw	s0,88(s0)
  1e:	444c                	lw	a1,12(s0)
  20:	3120                	fld	fs0,96(a0)
  22:	2e302e33          	0x2e302e33
  26:	0031                	c.nop	12
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	addi	s6,s6,-16
   2:	0000                	unimp
   4:	7200                	flw	fs0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <_start-0xfec>
   c:	0011                	c.nop	4
   e:	0000                	unimp
  10:	1004                	addi	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3376                	fld	ft6,376(sp)
  16:	6932                	flw	fs2,12(sp)
  18:	7032                	flw	ft0,44(sp)
  1a:	0030                	addi	a2,sp,8
