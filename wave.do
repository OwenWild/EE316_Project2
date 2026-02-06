onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Clock /top_level_tb/clock
add wave -noupdate -expand -group Clock /top_level_tb/DUT/clk_in
add wave -noupdate -expand -group Reset /top_level_tb/DUT/INST_Reset_Delay/oRESET
add wave -noupdate -expand -group Reset /top_level_tb/DUT/Reset_Master
add wave -noupdate -expand -group Reset /top_level_tb/reset_n
add wave -noupdate -expand -group {Test Bench} /top_level_tb/Key1
add wave -noupdate -expand -group {Test Bench} /top_level_tb/Key2
add wave -noupdate -expand -group {Test Bench} /top_level_tb/Key3
add wave -noupdate -expand -group {Test Bench} /top_level_tb/cnt_en
add wave -noupdate -expand -group {Test Bench} /top_level_tb/input
add wave -noupdate -expand -group {Test Bench} /top_level_tb/output
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/mode
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/Cnt
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/cnt_en
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/Count_En
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/SRAM_Data
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/ROM_Data
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/PWM_out_60Hz
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/PWM_out_120Hz
add wave -noupdate -expand -group {Top Level} /top_level_tb/DUT/PWM_out_1000Hz
add wave -noupdate -expand -group {State Machine} /top_level_tb/DUT/INST_Statemachine/mode
add wave -noupdate -expand -group {Rom Counter} /top_level_tb/DUT/inst_ROMaddressor/en
add wave -noupdate -expand -group {Rom Counter} /top_level_tb/DUT/inst_ROMaddressor/reset
add wave -noupdate -expand -group {Rom Counter} /top_level_tb/DUT/inst_ROMaddressor/q
add wave -noupdate -expand -group ROM /top_level_tb/DUT/INST_SEGA/address
add wave -noupdate -expand -group ROM /top_level_tb/DUT/INST_SEGA/q
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/iReset
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/iEnable
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/pulse_in
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/state
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/we_n
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/oe_n
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/ce_n
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/lb_n
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/ub_n
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/i_o
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/iSData
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/oSData
add wave -noupdate -group SRAM /top_level_tb/DUT/INST_SRAM/Ten
add wave -noupdate -group PWM /top_level_tb/DUT/INST_PWM_60Hz/iData
add wave -noupdate -group PWM /top_level_tb/DUT/INST_PWM_60Hz/Scream_Pain
add wave -noupdate -group PWM /top_level_tb/DUT/INST_PWM_60Hz/oPWM
add wave -noupdate -group PWM -expand -group PWM_Reg /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_reg/Load
add wave -noupdate -group PWM -expand -group PWM_Reg /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_reg/R
add wave -noupdate -group PWM -expand -group PWM_Reg /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_reg/num
add wave -noupdate -group PWM -expand -group PWM_Reg /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_reg/X
add wave -noupdate -group PWM -expand -group PWM_cnt /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_cnt/reset
add wave -noupdate -group PWM -expand -group PWM_cnt /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_cnt/q
add wave -noupdate -group PWM -expand -group PWM_Comparitor /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_comp/MODE
add wave -noupdate -group PWM -expand -group PWM_Comparitor /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_comp/A
add wave -noupdate -group PWM -expand -group PWM_Comparitor /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_comp/B
add wave -noupdate -group PWM -expand -group PWM_Comparitor /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_comp/C
add wave -noupdate -group PWM -expand -group RS_Latch /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_RS_latch/R
add wave -noupdate -group PWM -expand -group RS_Latch /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_RS_latch/S
add wave -noupdate -group PWM -expand -group RS_Latch /top_level_tb/DUT/INST_PWM_60Hz/inst_PWM_RS_latch/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5423936 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 382
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
WaveRestoreZoom {0 ps} {6930 ns}
