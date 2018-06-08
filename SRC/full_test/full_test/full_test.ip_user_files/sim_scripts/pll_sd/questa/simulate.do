onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib pll_sd_opt

do {wave.do}

view wave
view structure
view signals

do {pll_sd.udo}

run -all

quit -force
