transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/OneDrive/Repositories/turma2022-1_vhdl/timer_de10lite/a19_timer.vhd}

vcom -93 -work work {D:/OneDrive/Repositories/turma2022-1_vhdl/timer_de10lite/a19_timer_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  a19_timer_tb

add wave *
view structure
view signals
run 20 sec
