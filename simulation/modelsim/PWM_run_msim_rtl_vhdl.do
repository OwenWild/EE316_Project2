transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {U:/PWM/PWM_TL.vhd}
vcom -93 -work work {U:/PWM/univ_bin_counter.vhd}
vcom -93 -work work {U:/PWM/PWM_reg.vhd}
vcom -93 -work work {U:/PWM/PWM_Comparator.vhd}
vcom -93 -work work {U:/PWM/RS_latch.vhd}
vcom -93 -work work {U:/PWM/clk_enable.vhd}

