onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pwm_tl_tb/clock
add wave -noupdate /pwm_tl_tb/clock_en
add wave -noupdate /pwm_tl_tb/reset
add wave -noupdate /pwm_tl_tb/Richie
add wave -noupdate /pwm_tl_tb/data
add wave -noupdate /pwm_tl_tb/PWM
add wave -noupdate -expand -group {Clock Enable} /pwm_tl_tb/DUT/inst_PWM_clken/Enable
add wave -noupdate -expand -group {Clock Enable} /pwm_tl_tb/DUT/inst_PWM_clken/clk_cnt
add wave -noupdate -expand -group {Clock Enable} /pwm_tl_tb/DUT/inst_PWM_clken/clk_en
add wave -noupdate -expand -group {Top Level} /pwm_tl_tb/DUT/iClk_en
add wave -noupdate -expand -group {Top Level} /pwm_tl_tb/DUT/Max_Load
add wave -noupdate -expand -group {Top Level} /pwm_tl_tb/DUT/en_clk
add wave -noupdate -expand -group {Top Level} /pwm_tl_tb/DUT/clk_en
add wave -noupdate -expand -group Register /pwm_tl_tb/DUT/inst_PWM_reg/Load
add wave -noupdate -expand -group Register /pwm_tl_tb/DUT/inst_PWM_reg/X
add wave -noupdate -expand -group Register /pwm_tl_tb/DUT/inst_PWM_reg/R
add wave -noupdate -expand -group Register /pwm_tl_tb/DUT/inst_PWM_reg/num
add wave -noupdate -expand -group Counter /pwm_tl_tb/DUT/inst_PWM_cnt/up
add wave -noupdate -expand -group Counter /pwm_tl_tb/DUT/inst_PWM_cnt/en
add wave -noupdate -expand -group Counter /pwm_tl_tb/DUT/inst_PWM_cnt/load
add wave -noupdate -expand -group Counter /pwm_tl_tb/DUT/inst_PWM_cnt/q
add wave -noupdate -expand -group Comperitor /pwm_tl_tb/DUT/inst_PWM_comp/MODE
add wave -noupdate -expand -group Comperitor /pwm_tl_tb/DUT/inst_PWM_comp/A
add wave -noupdate -expand -group Comperitor /pwm_tl_tb/DUT/inst_PWM_comp/B
add wave -noupdate -expand -group Comperitor /pwm_tl_tb/DUT/inst_PWM_comp/C
add wave -noupdate -expand -group {RS latch} /pwm_tl_tb/DUT/inst_PWM_RS_latch/iClk
add wave -noupdate -expand -group {RS latch} /pwm_tl_tb/DUT/inst_PWM_RS_latch/R
add wave -noupdate -expand -group {RS latch} /pwm_tl_tb/DUT/inst_PWM_RS_latch/S
add wave -noupdate -expand -group {RS latch} /pwm_tl_tb/DUT/inst_PWM_RS_latch/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {570000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 260
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
WaveRestoreZoom {0 ps} {19005 ns}
