onerror {resume}
radix define fixed#8#decimal#signed -fixed -fraction 8 -signed -base signed
radix define fixed#10#decimal -fixed -fraction 10 -base signed
radix define fixed#9#decimal#signed -fixed -fraction 9 -signed -base signed
quietly WaveActivateNextPane {} 0
add wave -noupdate /cordic_tb/clk
add wave -noupdate /cordic_tb/grados
add wave -noupdate /cordic_tb/sentido
add wave -noupdate /cordic_tb/enable
add wave -noupdate /cordic_tb/x
add wave -noupdate /cordic_tb/y
add wave -noupdate /cordic_tb/DUT/init
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {829 ns}
