onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L secureip -L fifo_generator_v13_0_1 -L xil_defaultlib -lib xil_defaultlib xil_defaultlib.fifo_2048_32i_8o

do {wave.do}

view wave
view structure
view signals

do {fifo_2048_32i_8o.udo}

run -all

quit -force
