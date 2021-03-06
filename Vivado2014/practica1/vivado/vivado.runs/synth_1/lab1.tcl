# 
# Synthesis run script generated by Vivado
# 

set_param gui.test TreeTableDev
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

create_project -in_memory -part xc7a200tfbg676-2
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/cecilia/Facultad/Sistemas_Digitales/practica1/vivado/vivado.cache/wt [current_project]
set_property parent.project_path /home/cecilia/Facultad/Sistemas_Digitales/practica1/vivado/vivado.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_vhdl -library xil_defaultlib /home/cecilia/Facultad/Sistemas_Digitales/practica1/vivado/vivado.srcs/sources_1/imports/practica1/lab1.vhd
read_xdc /home/cecilia/Facultad/Sistemas_Digitales/practica1/vivado/vivado.srcs/constrs_1/imports/practica1/lab1_ArtyZ7_10.xdc
set_property used_in_implementation false [get_files /home/cecilia/Facultad/Sistemas_Digitales/practica1/vivado/vivado.srcs/constrs_1/imports/practica1/lab1_ArtyZ7_10.xdc]

catch { write_hwdef -file lab1.hwdef }
synth_design -top lab1 -part xc7a200tfbg676-2
write_checkpoint -noxdef lab1.dcp
catch { report_utilization -file lab1_utilization_synth.rpt -pb lab1_utilization_synth.pb }
