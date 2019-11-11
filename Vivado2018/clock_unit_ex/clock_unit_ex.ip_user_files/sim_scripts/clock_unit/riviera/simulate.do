onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+clock_unit -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.clock_unit xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {clock_unit.udo}

run -all

endsim

quit -force
