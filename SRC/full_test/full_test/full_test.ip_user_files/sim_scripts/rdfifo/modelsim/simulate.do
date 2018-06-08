onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L fifo_generator_v13_0_1 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.rdfifo

do {wave.do}

view wave
view structure
view signals

do {rdfifo.udo}

run -all

quit -force
