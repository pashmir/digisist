
h
Command: %s
53*	vivadotcl27
#write_bitstream -force vga_ctrl.bit2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
YReport rule limit reached: REQP-1839 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px� 
�
YReport rule limit reached: REQP-1840 rule limit reached: 20 violations have been found.%s*DRC29
 !DRC|DRC System|Rule limit reached2default:default8ZCHECK-3h px� 
�
�Gated clock check: Net %s is a gated clock net sourced by a combinational pin %s, cell %s. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.%s*DRC2X
 "B
vga_sync_unit/conteo2vga_sync_unit/conteo22default:default2default:default2n
 "X
 vga_sync_unit/pantalla_reg_i_1/O vga_sync_unit/pantalla_reg_i_1/O2default:default2default:default2j
 "T
vga_sync_unit/pantalla_reg_i_1	vga_sync_unit/pantalla_reg_i_12default:default2default:default2=
 %DRC|Physical Configuration|Chip Level2default:default8ZPDRC-153h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[0]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[0]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[0]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[0]2default:default2default:default2H
 "2
conteo_reg[0]	conteo_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[10]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[10]2default:default2default:default2J
 "4
conteo_reg[10]	conteo_reg[10]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[11]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[11]2default:default2default:default2J
 "4
conteo_reg[11]	conteo_reg[11]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[12]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[12]2default:default2default:default2J
 "4
conteo_reg[12]	conteo_reg[12]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[13]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[13]2default:default2default:default2J
 "4
conteo_reg[13]	conteo_reg[13]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[14]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[14]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[14]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[14]2default:default2default:default2J
 "4
conteo_reg[14]	conteo_reg[14]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[15]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[15]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[15]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[15]2default:default2default:default2J
 "4
conteo_reg[15]	conteo_reg[15]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[1]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[1]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[1]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[1]2default:default2default:default2H
 "2
conteo_reg[1]	conteo_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[2]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[2]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[2]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[2]2default:default2default:default2H
 "2
conteo_reg[2]	conteo_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[3]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[3]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[3]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[3]2default:default2default:default2H
 "2
conteo_reg[3]	conteo_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[4]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[4]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[4]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[4]2default:default2default:default2H
 "2
conteo_reg[4]	conteo_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[5]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[5]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[5]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[5]2default:default2default:default2H
 "2
conteo_reg[5]	conteo_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[6]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[6]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[6]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[6]2default:default2default:default2H
 "2
conteo_reg[6]	conteo_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[7]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[7]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[7]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[7]2default:default2default:default2H
 "2
conteo_reg[7]	conteo_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[8]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[8]2default:default2default:default2H
 "2
conteo_reg[8]	conteo_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRARDADDR[9]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addra[9]2default:default2default:default2H
 "2
conteo_reg[9]	conteo_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[12]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[12]2default:default2default:default2P
 ":
conteo_reg[12]__0	conteo_reg[12]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[13]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[13]2default:default2default:default2P
 ":
conteo_reg[13]__0	conteo_reg[13]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[14]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[14]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[14]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[14]2default:default2default:default2P
 ":
conteo_reg[14]__0	conteo_reg[14]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB36 async control check: The RAMB36E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[15]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B/ADDRBWRADDR[15]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[15]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/addrb[15]2default:default2default:default2P
 ":
conteo_reg[15]__0	conteo_reg[15]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB36E12default:default8Z	REQP-1839h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[0]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[0]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[0]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[0]2default:default2default:default2H
 "2
conteo_reg[0]	conteo_reg[0]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[10]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[10]2default:default2default:default2J
 "4
conteo_reg[10]	conteo_reg[10]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[11]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[11]2default:default2default:default2J
 "4
conteo_reg[11]	conteo_reg[11]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[12]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[12]2default:default2default:default2J
 "4
conteo_reg[12]	conteo_reg[12]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[13]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[13]2default:default2default:default2J
 "4
conteo_reg[13]	conteo_reg[13]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[1]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[1]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[1]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[1]2default:default2default:default2H
 "2
conteo_reg[1]	conteo_reg[1]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[2]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[2]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[2]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[2]2default:default2default:default2H
 "2
conteo_reg[2]	conteo_reg[2]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[3]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[3]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[3]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[3]2default:default2default:default2H
 "2
conteo_reg[3]	conteo_reg[3]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[4]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[4]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[4]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[4]2default:default2default:default2H
 "2
conteo_reg[4]	conteo_reg[4]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[5]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[5]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[5]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[5]2default:default2default:default2H
 "2
conteo_reg[5]	conteo_reg[5]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[6]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[6]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[6]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[6]2default:default2default:default2H
 "2
conteo_reg[6]	conteo_reg[6]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[7]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[7]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[7]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[7]2default:default2default:default2H
 "2
conteo_reg[7]	conteo_reg[7]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[8]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[8]2default:default2default:default2H
 "2
conteo_reg[8]	conteo_reg[8]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRARDADDR[9]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addra[9]2default:default2default:default2H
 "2
conteo_reg[9]	conteo_reg[9]2default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[10]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[10]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[10]2default:default2default:default2P
 ":
conteo_reg[10]__0	conteo_reg[10]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[11]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[11]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[11]2default:default2default:default2P
 ":
conteo_reg[11]__0	conteo_reg[11]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[12]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[12]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[12]2default:default2default:default2P
 ":
conteo_reg[12]__0	conteo_reg[12]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[13]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[13]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[13]2default:default2default:default2P
 ":
conteo_reg[13]__0	conteo_reg[13]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[8]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[8]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[8]2default:default2default:default2N
 "8
conteo_reg[8]__0	conteo_reg[8]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
�RAMB18 async control check: The RAMB18E1 %s has an input control pin %s (net: %s) which is driven by a register (%s) that has an active asychronous set or reset. This may cause corruption of the memory contents and/or read values when the set/reset is asserted and is not analyzed by the default static timing analysis. It is suggested to eliminate the use of a set/reset to registers driving this RAMB pin or else use a synchronous reset in which the assertion of the reset is timed by default.%s*DRC2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram	�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/DEVICE_7SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM18.ram/ADDRBWRADDR[9]2default:default2default:default2�
 "�
�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[9]�memoria_video/video_mem_i/blk_mem_gen_0/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/addrb[9]2default:default2default:default2N
 "8
conteo_reg[9]__0	conteo_reg[9]__02default:default2default:default2B
 *DRC|Netlist|Instance|Required Pin|RAMB18E12default:default8Z	REQP-1840h px� 
�
uPS7 block required: The PS7 cell must be used in this Zynq design in order to enable correct default configuration.%s*DRC2;
 #DRC|PS7|Zynq requires PS7 block|PS72default:default8ZZPS7-1h px� 
g
DRC finished with %s
1905*	planAhead2)
0 Errors, 44 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
i
)Running write_bitstream with %s threads.
1750*designutils2
22default:defaultZ20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
_
Writing bitstream %s...
11*	bitstream2"
./vga_ctrl.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a WebPACK part without a full Vivado license. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.
120*projectZ1-120h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1072default:default2
862default:default2
02default:default2
02default:defaultZ4-41h px� 
a
%s completed successfully
29*	vivadotcl2#
write_bitstream2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:00:192default:default2
00:00:222default:default2
1670.9802default:default2
342.6212default:defaultZ17-268h px� 


End Record