onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Gen_clk -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Gen_clk xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Gen_clk.udo}

run -all

endsim

quit -force
