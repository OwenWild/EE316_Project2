-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

-- DATE "01/30/2026 18:57:56"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	PWM_TL IS
    PORT (
	iClk : IN std_logic;
	Reset : IN std_logic;
	iClk_en : IN std_logic;
	iData : IN std_logic_vector(7 DOWNTO 0);
	Scream_Pain : OUT std_logic;
	oPWM : OUT std_logic
	);
END PWM_TL;

-- Design Ports Information
-- Scream_Pain	=>  Location: PIN_AC2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oPWM	=>  Location: PIN_AD3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iClk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iClk_en	=>  Location: PIN_AD2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[7]	=>  Location: PIN_W1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[6]	=>  Location: PIN_AC1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[5]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[4]	=>  Location: PIN_Y4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[3]	=>  Location: PIN_AC3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[2]	=>  Location: PIN_U6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[1]	=>  Location: PIN_AB3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iData[0]	=>  Location: PIN_U5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF PWM_TL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iClk : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_iClk_en : std_logic;
SIGNAL ww_iData : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Scream_Pain : std_logic;
SIGNAL ww_oPWM : std_logic;
SIGNAL \Reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst_PWM_clken|Add0~0_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~6_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~14_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~16_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~20_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~34_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~36_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~38_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~2_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~5_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~4_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~5_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~6_combout\ : std_logic;
SIGNAL \iData[5]~input_o\ : std_logic;
SIGNAL \iData[3]~input_o\ : std_logic;
SIGNAL \iData[2]~input_o\ : std_logic;
SIGNAL \iData[1]~input_o\ : std_logic;
SIGNAL \iData[0]~input_o\ : std_logic;
SIGNAL \Scream_Pain~output_o\ : std_logic;
SIGNAL \oPWM~output_o\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[0]~9\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[1]~11_combout\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[2]~14\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[3]~15_combout\ : std_logic;
SIGNAL \iClk_en~input_o\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~1\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~2_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~3\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~5\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~7\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~8_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~9\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~10_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~11\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~12_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~13\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~15\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~17\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~18_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~19\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~21\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~22_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~23\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~24_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~3_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~25\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~27\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~28_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~1_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~29\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~31\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~33\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~35\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~37\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~39\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~41\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~42_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~8_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~43\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~45\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~46_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~10_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~47\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~48_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~49\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~50_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~11_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~7_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~44_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~9_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~40_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~7_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~6_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~30_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~0_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~26_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt~2_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~32_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~0_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~1_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Add0~4_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~3_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~4_combout\ : std_logic;
SIGNAL \inst_PWM_clken|Equal0~8_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_en~0_combout\ : std_logic;
SIGNAL \inst_PWM_clken|clk_en~q\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[3]~16\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[4]~17_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[4]~18\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[5]~20\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[6]~21_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[6]~22\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[7]~23_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|Equal0~1_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[2]~10_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[1]~12\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[2]~13_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|Equal0~0_combout\ : std_logic;
SIGNAL \inst_PWM_cnt|Equal0~2_combout\ : std_logic;
SIGNAL \iClk~input_o\ : std_logic;
SIGNAL \iClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \iData[7]~input_o\ : std_logic;
SIGNAL \iData[6]~input_o\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[5]~19_combout\ : std_logic;
SIGNAL \iData[4]~input_o\ : std_logic;
SIGNAL \inst_PWM_cnt|r_reg[0]~8_combout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~1_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~3_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~5_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~7_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~9_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~11_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~13_cout\ : std_logic;
SIGNAL \inst_PWM_comp|LessThan0~14_combout\ : std_logic;
SIGNAL \inst_PWM_comp|C~q\ : std_logic;
SIGNAL \inst_PWM_RS_latch|q~0_combout\ : std_logic;
SIGNAL \inst_PWM_RS_latch|q~q\ : std_logic;
SIGNAL \inst_PWM_clken|clk_cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst_PWM_cnt|r_reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst_PWM_reg|R\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_iClk <= iClk;
ww_Reset <= Reset;
ww_iClk_en <= iClk_en;
ww_iData <= iData;
Scream_Pain <= ww_Scream_Pain;
oPWM <= ww_oPWM;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Reset~input_o\);

\iClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iClk~input_o\);
\ALT_INV_Reset~inputclkctrl_outclk\ <= NOT \Reset~inputclkctrl_outclk\;

-- Location: LCCOMB_X3_Y23_N6
\inst_PWM_clken|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~0_combout\ = \inst_PWM_clken|clk_cnt\(0) $ (VCC)
-- \inst_PWM_clken|Add0~1\ = CARRY(\inst_PWM_clken|clk_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(0),
	datad => VCC,
	combout => \inst_PWM_clken|Add0~0_combout\,
	cout => \inst_PWM_clken|Add0~1\);

-- Location: LCCOMB_X3_Y23_N12
\inst_PWM_clken|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~6_combout\ = (\inst_PWM_clken|clk_cnt\(3) & (!\inst_PWM_clken|Add0~5\)) # (!\inst_PWM_clken|clk_cnt\(3) & ((\inst_PWM_clken|Add0~5\) # (GND)))
-- \inst_PWM_clken|Add0~7\ = CARRY((!\inst_PWM_clken|Add0~5\) # (!\inst_PWM_clken|clk_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(3),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~5\,
	combout => \inst_PWM_clken|Add0~6_combout\,
	cout => \inst_PWM_clken|Add0~7\);

-- Location: LCCOMB_X3_Y23_N20
\inst_PWM_clken|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~14_combout\ = (\inst_PWM_clken|clk_cnt\(7) & (!\inst_PWM_clken|Add0~13\)) # (!\inst_PWM_clken|clk_cnt\(7) & ((\inst_PWM_clken|Add0~13\) # (GND)))
-- \inst_PWM_clken|Add0~15\ = CARRY((!\inst_PWM_clken|Add0~13\) # (!\inst_PWM_clken|clk_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(7),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~13\,
	combout => \inst_PWM_clken|Add0~14_combout\,
	cout => \inst_PWM_clken|Add0~15\);

-- Location: LCCOMB_X3_Y23_N22
\inst_PWM_clken|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~16_combout\ = (\inst_PWM_clken|clk_cnt\(8) & (\inst_PWM_clken|Add0~15\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(8) & (!\inst_PWM_clken|Add0~15\ & VCC))
-- \inst_PWM_clken|Add0~17\ = CARRY((\inst_PWM_clken|clk_cnt\(8) & !\inst_PWM_clken|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(8),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~15\,
	combout => \inst_PWM_clken|Add0~16_combout\,
	cout => \inst_PWM_clken|Add0~17\);

-- Location: LCCOMB_X3_Y23_N26
\inst_PWM_clken|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~20_combout\ = (\inst_PWM_clken|clk_cnt\(10) & (\inst_PWM_clken|Add0~19\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(10) & (!\inst_PWM_clken|Add0~19\ & VCC))
-- \inst_PWM_clken|Add0~21\ = CARRY((\inst_PWM_clken|clk_cnt\(10) & !\inst_PWM_clken|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(10),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~19\,
	combout => \inst_PWM_clken|Add0~20_combout\,
	cout => \inst_PWM_clken|Add0~21\);

-- Location: LCCOMB_X3_Y22_N8
\inst_PWM_clken|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~34_combout\ = (\inst_PWM_clken|clk_cnt\(17) & (!\inst_PWM_clken|Add0~33\)) # (!\inst_PWM_clken|clk_cnt\(17) & ((\inst_PWM_clken|Add0~33\) # (GND)))
-- \inst_PWM_clken|Add0~35\ = CARRY((!\inst_PWM_clken|Add0~33\) # (!\inst_PWM_clken|clk_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(17),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~33\,
	combout => \inst_PWM_clken|Add0~34_combout\,
	cout => \inst_PWM_clken|Add0~35\);

-- Location: LCCOMB_X3_Y22_N10
\inst_PWM_clken|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~36_combout\ = (\inst_PWM_clken|clk_cnt\(18) & (\inst_PWM_clken|Add0~35\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(18) & (!\inst_PWM_clken|Add0~35\ & VCC))
-- \inst_PWM_clken|Add0~37\ = CARRY((\inst_PWM_clken|clk_cnt\(18) & !\inst_PWM_clken|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(18),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~35\,
	combout => \inst_PWM_clken|Add0~36_combout\,
	cout => \inst_PWM_clken|Add0~37\);

-- Location: LCCOMB_X3_Y22_N12
\inst_PWM_clken|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~38_combout\ = (\inst_PWM_clken|clk_cnt\(19) & (!\inst_PWM_clken|Add0~37\)) # (!\inst_PWM_clken|clk_cnt\(19) & ((\inst_PWM_clken|Add0~37\) # (GND)))
-- \inst_PWM_clken|Add0~39\ = CARRY((!\inst_PWM_clken|Add0~37\) # (!\inst_PWM_clken|clk_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(19),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~37\,
	combout => \inst_PWM_clken|Add0~38_combout\,
	cout => \inst_PWM_clken|Add0~39\);

-- Location: FF_X3_Y23_N27
\inst_PWM_clken|clk_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(10));

-- Location: FF_X3_Y23_N23
\inst_PWM_clken|clk_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(8));

-- Location: FF_X2_Y22_N1
\inst_PWM_clken|clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(7));

-- Location: LCCOMB_X2_Y22_N26
\inst_PWM_clken|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~2_combout\ = (\inst_PWM_clken|clk_cnt\(5) & (!\inst_PWM_clken|clk_cnt\(7) & (\inst_PWM_clken|clk_cnt\(6) & !\inst_PWM_clken|clk_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(5),
	datab => \inst_PWM_clken|clk_cnt\(7),
	datac => \inst_PWM_clken|clk_cnt\(6),
	datad => \inst_PWM_clken|clk_cnt\(8),
	combout => \inst_PWM_clken|Equal0~2_combout\);

-- Location: FF_X3_Y23_N13
\inst_PWM_clken|clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(3));

-- Location: FF_X3_Y23_N7
\inst_PWM_clken|clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(0));

-- Location: FF_X2_Y22_N3
\inst_PWM_clken|clk_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(17));

-- Location: FF_X2_Y22_N9
\inst_PWM_clken|clk_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(19));

-- Location: FF_X3_Y22_N11
\inst_PWM_clken|clk_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(18));

-- Location: LCCOMB_X2_Y22_N10
\inst_PWM_clken|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~5_combout\ = (\inst_PWM_clken|clk_cnt\(19) & (\inst_PWM_clken|clk_cnt\(17) & (!\inst_PWM_clken|clk_cnt\(18) & \inst_PWM_clken|clk_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(19),
	datab => \inst_PWM_clken|clk_cnt\(17),
	datac => \inst_PWM_clken|clk_cnt\(18),
	datad => \inst_PWM_clken|clk_cnt\(0),
	combout => \inst_PWM_clken|Equal0~5_combout\);

-- Location: FF_X1_Y24_N19
\inst_PWM_reg|R[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[5]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(5));

-- Location: FF_X1_Y24_N15
\inst_PWM_reg|R[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[3]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(3));

-- Location: FF_X1_Y24_N13
\inst_PWM_reg|R[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[2]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(2));

-- Location: FF_X1_Y24_N11
\inst_PWM_reg|R[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[1]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(1));

-- Location: FF_X1_Y24_N9
\inst_PWM_reg|R[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[0]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(0));

-- Location: LCCOMB_X2_Y22_N0
\inst_PWM_clken|clk_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~4_combout\ = (\inst_PWM_clken|Add0~14_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~14_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~4_combout\);

-- Location: LCCOMB_X2_Y22_N2
\inst_PWM_clken|clk_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~5_combout\ = (\inst_PWM_clken|Add0~34_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~34_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~5_combout\);

-- Location: LCCOMB_X2_Y22_N8
\inst_PWM_clken|clk_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~6_combout\ = (\inst_PWM_clken|Add0~38_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~38_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~6_combout\);

-- Location: IOIBUF_X0_Y24_N15
\iData[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(5),
	o => \iData[5]~input_o\);

-- Location: IOIBUF_X0_Y23_N22
\iData[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(3),
	o => \iData[3]~input_o\);

-- Location: IOIBUF_X0_Y25_N22
\iData[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(2),
	o => \iData[2]~input_o\);

-- Location: IOIBUF_X0_Y21_N22
\iData[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(1),
	o => \iData[1]~input_o\);

-- Location: IOIBUF_X0_Y24_N1
\iData[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(0),
	o => \iData[0]~input_o\);

-- Location: IOOBUF_X0_Y24_N23
\Scream_Pain~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_PWM_cnt|Equal0~2_combout\,
	devoe => ww_devoe,
	o => \Scream_Pain~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\oPWM~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst_PWM_RS_latch|q~q\,
	devoe => ww_devoe,
	o => \oPWM~output_o\);

-- Location: LCCOMB_X2_Y24_N12
\inst_PWM_cnt|r_reg[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[0]~8_combout\ = \inst_PWM_cnt|r_reg\(0) $ (VCC)
-- \inst_PWM_cnt|r_reg[0]~9\ = CARRY(\inst_PWM_cnt|r_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(0),
	datad => VCC,
	combout => \inst_PWM_cnt|r_reg[0]~8_combout\,
	cout => \inst_PWM_cnt|r_reg[0]~9\);

-- Location: LCCOMB_X2_Y24_N14
\inst_PWM_cnt|r_reg[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[1]~11_combout\ = (\inst_PWM_cnt|r_reg\(1) & (!\inst_PWM_cnt|r_reg[0]~9\)) # (!\inst_PWM_cnt|r_reg\(1) & ((\inst_PWM_cnt|r_reg[0]~9\) # (GND)))
-- \inst_PWM_cnt|r_reg[1]~12\ = CARRY((!\inst_PWM_cnt|r_reg[0]~9\) # (!\inst_PWM_cnt|r_reg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|r_reg\(1),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[0]~9\,
	combout => \inst_PWM_cnt|r_reg[1]~11_combout\,
	cout => \inst_PWM_cnt|r_reg[1]~12\);

-- Location: IOIBUF_X0_Y36_N15
\Reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: CLKCTRL_G4
\Reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset~inputclkctrl_outclk\);

-- Location: LCCOMB_X2_Y24_N16
\inst_PWM_cnt|r_reg[2]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[2]~13_combout\ = (\inst_PWM_cnt|r_reg\(2) & (\inst_PWM_cnt|r_reg[1]~12\ $ (GND))) # (!\inst_PWM_cnt|r_reg\(2) & (!\inst_PWM_cnt|r_reg[1]~12\ & VCC))
-- \inst_PWM_cnt|r_reg[2]~14\ = CARRY((\inst_PWM_cnt|r_reg\(2) & !\inst_PWM_cnt|r_reg[1]~12\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|r_reg\(2),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[1]~12\,
	combout => \inst_PWM_cnt|r_reg[2]~13_combout\,
	cout => \inst_PWM_cnt|r_reg[2]~14\);

-- Location: LCCOMB_X2_Y24_N18
\inst_PWM_cnt|r_reg[3]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[3]~15_combout\ = (\inst_PWM_cnt|r_reg\(3) & (!\inst_PWM_cnt|r_reg[2]~14\)) # (!\inst_PWM_cnt|r_reg\(3) & ((\inst_PWM_cnt|r_reg[2]~14\) # (GND)))
-- \inst_PWM_cnt|r_reg[3]~16\ = CARRY((!\inst_PWM_cnt|r_reg[2]~14\) # (!\inst_PWM_cnt|r_reg\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|r_reg\(3),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[2]~14\,
	combout => \inst_PWM_cnt|r_reg[3]~15_combout\,
	cout => \inst_PWM_cnt|r_reg[3]~16\);

-- Location: IOIBUF_X0_Y22_N22
\iClk_en~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk_en,
	o => \iClk_en~input_o\);

-- Location: LCCOMB_X3_Y23_N8
\inst_PWM_clken|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~2_combout\ = (\inst_PWM_clken|clk_cnt\(1) & (!\inst_PWM_clken|Add0~1\)) # (!\inst_PWM_clken|clk_cnt\(1) & ((\inst_PWM_clken|Add0~1\) # (GND)))
-- \inst_PWM_clken|Add0~3\ = CARRY((!\inst_PWM_clken|Add0~1\) # (!\inst_PWM_clken|clk_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(1),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~1\,
	combout => \inst_PWM_clken|Add0~2_combout\,
	cout => \inst_PWM_clken|Add0~3\);

-- Location: FF_X3_Y23_N9
\inst_PWM_clken|clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(1));

-- Location: LCCOMB_X3_Y23_N10
\inst_PWM_clken|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~4_combout\ = (\inst_PWM_clken|clk_cnt\(2) & (\inst_PWM_clken|Add0~3\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(2) & (!\inst_PWM_clken|Add0~3\ & VCC))
-- \inst_PWM_clken|Add0~5\ = CARRY((\inst_PWM_clken|clk_cnt\(2) & !\inst_PWM_clken|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(2),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~3\,
	combout => \inst_PWM_clken|Add0~4_combout\,
	cout => \inst_PWM_clken|Add0~5\);

-- Location: LCCOMB_X3_Y23_N14
\inst_PWM_clken|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~8_combout\ = (\inst_PWM_clken|clk_cnt\(4) & (\inst_PWM_clken|Add0~7\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(4) & (!\inst_PWM_clken|Add0~7\ & VCC))
-- \inst_PWM_clken|Add0~9\ = CARRY((\inst_PWM_clken|clk_cnt\(4) & !\inst_PWM_clken|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(4),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~7\,
	combout => \inst_PWM_clken|Add0~8_combout\,
	cout => \inst_PWM_clken|Add0~9\);

-- Location: FF_X3_Y23_N15
\inst_PWM_clken|clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(4));

-- Location: LCCOMB_X3_Y23_N16
\inst_PWM_clken|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~10_combout\ = (\inst_PWM_clken|clk_cnt\(5) & (!\inst_PWM_clken|Add0~9\)) # (!\inst_PWM_clken|clk_cnt\(5) & ((\inst_PWM_clken|Add0~9\) # (GND)))
-- \inst_PWM_clken|Add0~11\ = CARRY((!\inst_PWM_clken|Add0~9\) # (!\inst_PWM_clken|clk_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(5),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~9\,
	combout => \inst_PWM_clken|Add0~10_combout\,
	cout => \inst_PWM_clken|Add0~11\);

-- Location: FF_X3_Y23_N17
\inst_PWM_clken|clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(5));

-- Location: LCCOMB_X3_Y23_N18
\inst_PWM_clken|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~12_combout\ = (\inst_PWM_clken|clk_cnt\(6) & (\inst_PWM_clken|Add0~11\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(6) & (!\inst_PWM_clken|Add0~11\ & VCC))
-- \inst_PWM_clken|Add0~13\ = CARRY((\inst_PWM_clken|clk_cnt\(6) & !\inst_PWM_clken|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(6),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~11\,
	combout => \inst_PWM_clken|Add0~12_combout\,
	cout => \inst_PWM_clken|Add0~13\);

-- Location: FF_X3_Y23_N19
\inst_PWM_clken|clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(6));

-- Location: LCCOMB_X3_Y23_N24
\inst_PWM_clken|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~18_combout\ = (\inst_PWM_clken|clk_cnt\(9) & (!\inst_PWM_clken|Add0~17\)) # (!\inst_PWM_clken|clk_cnt\(9) & ((\inst_PWM_clken|Add0~17\) # (GND)))
-- \inst_PWM_clken|Add0~19\ = CARRY((!\inst_PWM_clken|Add0~17\) # (!\inst_PWM_clken|clk_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(9),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~17\,
	combout => \inst_PWM_clken|Add0~18_combout\,
	cout => \inst_PWM_clken|Add0~19\);

-- Location: FF_X3_Y23_N25
\inst_PWM_clken|clk_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(9));

-- Location: LCCOMB_X3_Y23_N28
\inst_PWM_clken|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~22_combout\ = (\inst_PWM_clken|clk_cnt\(11) & (!\inst_PWM_clken|Add0~21\)) # (!\inst_PWM_clken|clk_cnt\(11) & ((\inst_PWM_clken|Add0~21\) # (GND)))
-- \inst_PWM_clken|Add0~23\ = CARRY((!\inst_PWM_clken|Add0~21\) # (!\inst_PWM_clken|clk_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(11),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~21\,
	combout => \inst_PWM_clken|Add0~22_combout\,
	cout => \inst_PWM_clken|Add0~23\);

-- Location: FF_X3_Y23_N29
\inst_PWM_clken|clk_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(11));

-- Location: LCCOMB_X3_Y23_N30
\inst_PWM_clken|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~24_combout\ = (\inst_PWM_clken|clk_cnt\(12) & (\inst_PWM_clken|Add0~23\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(12) & (!\inst_PWM_clken|Add0~23\ & VCC))
-- \inst_PWM_clken|Add0~25\ = CARRY((\inst_PWM_clken|clk_cnt\(12) & !\inst_PWM_clken|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(12),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~23\,
	combout => \inst_PWM_clken|Add0~24_combout\,
	cout => \inst_PWM_clken|Add0~25\);

-- Location: LCCOMB_X2_Y22_N20
\inst_PWM_clken|clk_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~3_combout\ = (\inst_PWM_clken|Add0~24_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~24_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~3_combout\);

-- Location: FF_X2_Y22_N21
\inst_PWM_clken|clk_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(12));

-- Location: LCCOMB_X3_Y22_N0
\inst_PWM_clken|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~26_combout\ = (\inst_PWM_clken|clk_cnt\(13) & (!\inst_PWM_clken|Add0~25\)) # (!\inst_PWM_clken|clk_cnt\(13) & ((\inst_PWM_clken|Add0~25\) # (GND)))
-- \inst_PWM_clken|Add0~27\ = CARRY((!\inst_PWM_clken|Add0~25\) # (!\inst_PWM_clken|clk_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(13),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~25\,
	combout => \inst_PWM_clken|Add0~26_combout\,
	cout => \inst_PWM_clken|Add0~27\);

-- Location: LCCOMB_X3_Y22_N2
\inst_PWM_clken|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~28_combout\ = (\inst_PWM_clken|clk_cnt\(14) & (\inst_PWM_clken|Add0~27\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(14) & (!\inst_PWM_clken|Add0~27\ & VCC))
-- \inst_PWM_clken|Add0~29\ = CARRY((\inst_PWM_clken|clk_cnt\(14) & !\inst_PWM_clken|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(14),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~27\,
	combout => \inst_PWM_clken|Add0~28_combout\,
	cout => \inst_PWM_clken|Add0~29\);

-- Location: LCCOMB_X2_Y22_N6
\inst_PWM_clken|clk_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~1_combout\ = (!\inst_PWM_clken|Equal0~8_combout\ & \inst_PWM_clken|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|Equal0~8_combout\,
	datad => \inst_PWM_clken|Add0~28_combout\,
	combout => \inst_PWM_clken|clk_cnt~1_combout\);

-- Location: FF_X2_Y22_N7
\inst_PWM_clken|clk_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(14));

-- Location: LCCOMB_X3_Y22_N4
\inst_PWM_clken|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~30_combout\ = (\inst_PWM_clken|clk_cnt\(15) & (!\inst_PWM_clken|Add0~29\)) # (!\inst_PWM_clken|clk_cnt\(15) & ((\inst_PWM_clken|Add0~29\) # (GND)))
-- \inst_PWM_clken|Add0~31\ = CARRY((!\inst_PWM_clken|Add0~29\) # (!\inst_PWM_clken|clk_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(15),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~29\,
	combout => \inst_PWM_clken|Add0~30_combout\,
	cout => \inst_PWM_clken|Add0~31\);

-- Location: LCCOMB_X3_Y22_N6
\inst_PWM_clken|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~32_combout\ = (\inst_PWM_clken|clk_cnt\(16) & (\inst_PWM_clken|Add0~31\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(16) & (!\inst_PWM_clken|Add0~31\ & VCC))
-- \inst_PWM_clken|Add0~33\ = CARRY((\inst_PWM_clken|clk_cnt\(16) & !\inst_PWM_clken|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(16),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~31\,
	combout => \inst_PWM_clken|Add0~32_combout\,
	cout => \inst_PWM_clken|Add0~33\);

-- Location: LCCOMB_X3_Y22_N14
\inst_PWM_clken|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~40_combout\ = (\inst_PWM_clken|clk_cnt\(20) & (\inst_PWM_clken|Add0~39\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(20) & (!\inst_PWM_clken|Add0~39\ & VCC))
-- \inst_PWM_clken|Add0~41\ = CARRY((\inst_PWM_clken|clk_cnt\(20) & !\inst_PWM_clken|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(20),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~39\,
	combout => \inst_PWM_clken|Add0~40_combout\,
	cout => \inst_PWM_clken|Add0~41\);

-- Location: LCCOMB_X3_Y22_N16
\inst_PWM_clken|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~42_combout\ = (\inst_PWM_clken|clk_cnt\(21) & (!\inst_PWM_clken|Add0~41\)) # (!\inst_PWM_clken|clk_cnt\(21) & ((\inst_PWM_clken|Add0~41\) # (GND)))
-- \inst_PWM_clken|Add0~43\ = CARRY((!\inst_PWM_clken|Add0~41\) # (!\inst_PWM_clken|clk_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(21),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~41\,
	combout => \inst_PWM_clken|Add0~42_combout\,
	cout => \inst_PWM_clken|Add0~43\);

-- Location: LCCOMB_X3_Y22_N28
\inst_PWM_clken|clk_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~8_combout\ = (!\inst_PWM_clken|Equal0~8_combout\ & \inst_PWM_clken|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|Equal0~8_combout\,
	datad => \inst_PWM_clken|Add0~42_combout\,
	combout => \inst_PWM_clken|clk_cnt~8_combout\);

-- Location: FF_X3_Y22_N29
\inst_PWM_clken|clk_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(21));

-- Location: LCCOMB_X3_Y22_N18
\inst_PWM_clken|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~44_combout\ = (\inst_PWM_clken|clk_cnt\(22) & (\inst_PWM_clken|Add0~43\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(22) & (!\inst_PWM_clken|Add0~43\ & VCC))
-- \inst_PWM_clken|Add0~45\ = CARRY((\inst_PWM_clken|clk_cnt\(22) & !\inst_PWM_clken|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(22),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~43\,
	combout => \inst_PWM_clken|Add0~44_combout\,
	cout => \inst_PWM_clken|Add0~45\);

-- Location: LCCOMB_X3_Y22_N20
\inst_PWM_clken|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~46_combout\ = (\inst_PWM_clken|clk_cnt\(23) & (!\inst_PWM_clken|Add0~45\)) # (!\inst_PWM_clken|clk_cnt\(23) & ((\inst_PWM_clken|Add0~45\) # (GND)))
-- \inst_PWM_clken|Add0~47\ = CARRY((!\inst_PWM_clken|Add0~45\) # (!\inst_PWM_clken|clk_cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(23),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~45\,
	combout => \inst_PWM_clken|Add0~46_combout\,
	cout => \inst_PWM_clken|Add0~47\);

-- Location: LCCOMB_X2_Y22_N28
\inst_PWM_clken|clk_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~10_combout\ = (\inst_PWM_clken|Add0~46_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~46_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~10_combout\);

-- Location: FF_X2_Y22_N29
\inst_PWM_clken|clk_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(23));

-- Location: LCCOMB_X3_Y22_N22
\inst_PWM_clken|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~48_combout\ = (\inst_PWM_clken|clk_cnt\(24) & (\inst_PWM_clken|Add0~47\ $ (GND))) # (!\inst_PWM_clken|clk_cnt\(24) & (!\inst_PWM_clken|Add0~47\ & VCC))
-- \inst_PWM_clken|Add0~49\ = CARRY((\inst_PWM_clken|clk_cnt\(24) & !\inst_PWM_clken|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(24),
	datad => VCC,
	cin => \inst_PWM_clken|Add0~47\,
	combout => \inst_PWM_clken|Add0~48_combout\,
	cout => \inst_PWM_clken|Add0~49\);

-- Location: FF_X3_Y22_N23
\inst_PWM_clken|clk_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(24));

-- Location: LCCOMB_X3_Y22_N24
\inst_PWM_clken|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Add0~50_combout\ = \inst_PWM_clken|clk_cnt\(25) $ (\inst_PWM_clken|Add0~49\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|clk_cnt\(25),
	cin => \inst_PWM_clken|Add0~49\,
	combout => \inst_PWM_clken|Add0~50_combout\);

-- Location: LCCOMB_X2_Y22_N4
\inst_PWM_clken|clk_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~11_combout\ = (!\inst_PWM_clken|Equal0~8_combout\ & \inst_PWM_clken|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|Equal0~8_combout\,
	datad => \inst_PWM_clken|Add0~50_combout\,
	combout => \inst_PWM_clken|clk_cnt~11_combout\);

-- Location: FF_X2_Y22_N5
\inst_PWM_clken|clk_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(25));

-- Location: LCCOMB_X1_Y22_N6
\inst_PWM_clken|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~7_combout\ = (!\inst_PWM_clken|clk_cnt\(24) & \inst_PWM_clken|clk_cnt\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|clk_cnt\(24),
	datad => \inst_PWM_clken|clk_cnt\(25),
	combout => \inst_PWM_clken|Equal0~7_combout\);

-- Location: LCCOMB_X3_Y22_N30
\inst_PWM_clken|clk_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~9_combout\ = (!\inst_PWM_clken|Equal0~8_combout\ & \inst_PWM_clken|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|Equal0~8_combout\,
	datad => \inst_PWM_clken|Add0~44_combout\,
	combout => \inst_PWM_clken|clk_cnt~9_combout\);

-- Location: FF_X3_Y22_N31
\inst_PWM_clken|clk_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(22));

-- Location: LCCOMB_X3_Y22_N26
\inst_PWM_clken|clk_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~7_combout\ = (\inst_PWM_clken|Add0~40_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~40_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~7_combout\);

-- Location: FF_X3_Y22_N27
\inst_PWM_clken|clk_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(20));

-- Location: LCCOMB_X2_Y22_N22
\inst_PWM_clken|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~6_combout\ = (\inst_PWM_clken|clk_cnt\(21) & (\inst_PWM_clken|clk_cnt\(23) & (\inst_PWM_clken|clk_cnt\(22) & \inst_PWM_clken|clk_cnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(21),
	datab => \inst_PWM_clken|clk_cnt\(23),
	datac => \inst_PWM_clken|clk_cnt\(22),
	datad => \inst_PWM_clken|clk_cnt\(20),
	combout => \inst_PWM_clken|Equal0~6_combout\);

-- Location: LCCOMB_X2_Y22_N16
\inst_PWM_clken|clk_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~0_combout\ = (!\inst_PWM_clken|Equal0~8_combout\ & \inst_PWM_clken|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_clken|Equal0~8_combout\,
	datad => \inst_PWM_clken|Add0~30_combout\,
	combout => \inst_PWM_clken|clk_cnt~0_combout\);

-- Location: FF_X2_Y22_N17
\inst_PWM_clken|clk_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(15));

-- Location: LCCOMB_X2_Y22_N12
\inst_PWM_clken|clk_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_cnt~2_combout\ = (\inst_PWM_clken|Add0~26_combout\ & !\inst_PWM_clken|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst_PWM_clken|Add0~26_combout\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_cnt~2_combout\);

-- Location: FF_X2_Y22_N13
\inst_PWM_clken|clk_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(13));

-- Location: FF_X3_Y22_N7
\inst_PWM_clken|clk_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(16));

-- Location: LCCOMB_X2_Y22_N14
\inst_PWM_clken|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~0_combout\ = (\inst_PWM_clken|clk_cnt\(14) & (\inst_PWM_clken|clk_cnt\(15) & (\inst_PWM_clken|clk_cnt\(13) & !\inst_PWM_clken|clk_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(14),
	datab => \inst_PWM_clken|clk_cnt\(15),
	datac => \inst_PWM_clken|clk_cnt\(13),
	datad => \inst_PWM_clken|clk_cnt\(16),
	combout => \inst_PWM_clken|Equal0~0_combout\);

-- Location: LCCOMB_X2_Y22_N30
\inst_PWM_clken|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~1_combout\ = (!\inst_PWM_clken|clk_cnt\(10) & (\inst_PWM_clken|clk_cnt\(12) & (!\inst_PWM_clken|clk_cnt\(11) & !\inst_PWM_clken|clk_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(10),
	datab => \inst_PWM_clken|clk_cnt\(12),
	datac => \inst_PWM_clken|clk_cnt\(11),
	datad => \inst_PWM_clken|clk_cnt\(9),
	combout => \inst_PWM_clken|Equal0~1_combout\);

-- Location: FF_X3_Y23_N11
\inst_PWM_clken|clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_cnt\(2));

-- Location: LCCOMB_X3_Y23_N4
\inst_PWM_clken|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~3_combout\ = (\inst_PWM_clken|clk_cnt\(3) & (\inst_PWM_clken|clk_cnt\(4) & (\inst_PWM_clken|clk_cnt\(2) & \inst_PWM_clken|clk_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|clk_cnt\(3),
	datab => \inst_PWM_clken|clk_cnt\(4),
	datac => \inst_PWM_clken|clk_cnt\(2),
	datad => \inst_PWM_clken|clk_cnt\(1),
	combout => \inst_PWM_clken|Equal0~3_combout\);

-- Location: LCCOMB_X2_Y22_N24
\inst_PWM_clken|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~4_combout\ = (\inst_PWM_clken|Equal0~2_combout\ & (\inst_PWM_clken|Equal0~0_combout\ & (\inst_PWM_clken|Equal0~1_combout\ & \inst_PWM_clken|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|Equal0~2_combout\,
	datab => \inst_PWM_clken|Equal0~0_combout\,
	datac => \inst_PWM_clken|Equal0~1_combout\,
	datad => \inst_PWM_clken|Equal0~3_combout\,
	combout => \inst_PWM_clken|Equal0~4_combout\);

-- Location: LCCOMB_X2_Y22_N18
\inst_PWM_clken|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|Equal0~8_combout\ = (\inst_PWM_clken|Equal0~5_combout\ & (\inst_PWM_clken|Equal0~7_combout\ & (\inst_PWM_clken|Equal0~6_combout\ & \inst_PWM_clken|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_clken|Equal0~5_combout\,
	datab => \inst_PWM_clken|Equal0~7_combout\,
	datac => \inst_PWM_clken|Equal0~6_combout\,
	datad => \inst_PWM_clken|Equal0~4_combout\,
	combout => \inst_PWM_clken|Equal0~8_combout\);

-- Location: LCCOMB_X1_Y22_N4
\inst_PWM_clken|clk_en~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_clken|clk_en~0_combout\ = (\inst_PWM_clken|Equal0~8_combout\) # (!\iClk_en~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iClk_en~input_o\,
	datad => \inst_PWM_clken|Equal0~8_combout\,
	combout => \inst_PWM_clken|clk_en~0_combout\);

-- Location: FF_X1_Y22_N5
\inst_PWM_clken|clk_en\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_clken|clk_en~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_clken|clk_en~q\);

-- Location: FF_X2_Y24_N19
\inst_PWM_cnt|r_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[3]~15_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(3));

-- Location: LCCOMB_X2_Y24_N20
\inst_PWM_cnt|r_reg[4]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[4]~17_combout\ = (\inst_PWM_cnt|r_reg\(4) & (\inst_PWM_cnt|r_reg[3]~16\ $ (GND))) # (!\inst_PWM_cnt|r_reg\(4) & (!\inst_PWM_cnt|r_reg[3]~16\ & VCC))
-- \inst_PWM_cnt|r_reg[4]~18\ = CARRY((\inst_PWM_cnt|r_reg\(4) & !\inst_PWM_cnt|r_reg[3]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|r_reg\(4),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[3]~16\,
	combout => \inst_PWM_cnt|r_reg[4]~17_combout\,
	cout => \inst_PWM_cnt|r_reg[4]~18\);

-- Location: FF_X2_Y24_N21
\inst_PWM_cnt|r_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[4]~17_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(4));

-- Location: LCCOMB_X2_Y24_N22
\inst_PWM_cnt|r_reg[5]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[5]~19_combout\ = (\inst_PWM_cnt|r_reg\(5) & (!\inst_PWM_cnt|r_reg[4]~18\)) # (!\inst_PWM_cnt|r_reg\(5) & ((\inst_PWM_cnt|r_reg[4]~18\) # (GND)))
-- \inst_PWM_cnt|r_reg[5]~20\ = CARRY((!\inst_PWM_cnt|r_reg[4]~18\) # (!\inst_PWM_cnt|r_reg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(5),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[4]~18\,
	combout => \inst_PWM_cnt|r_reg[5]~19_combout\,
	cout => \inst_PWM_cnt|r_reg[5]~20\);

-- Location: LCCOMB_X2_Y24_N24
\inst_PWM_cnt|r_reg[6]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[6]~21_combout\ = (\inst_PWM_cnt|r_reg\(6) & (\inst_PWM_cnt|r_reg[5]~20\ $ (GND))) # (!\inst_PWM_cnt|r_reg\(6) & (!\inst_PWM_cnt|r_reg[5]~20\ & VCC))
-- \inst_PWM_cnt|r_reg[6]~22\ = CARRY((\inst_PWM_cnt|r_reg\(6) & !\inst_PWM_cnt|r_reg[5]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|r_reg\(6),
	datad => VCC,
	cin => \inst_PWM_cnt|r_reg[5]~20\,
	combout => \inst_PWM_cnt|r_reg[6]~21_combout\,
	cout => \inst_PWM_cnt|r_reg[6]~22\);

-- Location: FF_X2_Y24_N25
\inst_PWM_cnt|r_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[6]~21_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(6));

-- Location: LCCOMB_X2_Y24_N26
\inst_PWM_cnt|r_reg[7]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[7]~23_combout\ = \inst_PWM_cnt|r_reg\(7) $ (\inst_PWM_cnt|r_reg[6]~22\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(7),
	cin => \inst_PWM_cnt|r_reg[6]~22\,
	combout => \inst_PWM_cnt|r_reg[7]~23_combout\);

-- Location: FF_X2_Y24_N27
\inst_PWM_cnt|r_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[7]~23_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(7));

-- Location: LCCOMB_X2_Y24_N6
\inst_PWM_cnt|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|Equal0~1_combout\ = (((!\inst_PWM_cnt|r_reg\(4)) # (!\inst_PWM_cnt|r_reg\(7))) # (!\inst_PWM_cnt|r_reg\(6))) # (!\inst_PWM_cnt|r_reg\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(5),
	datab => \inst_PWM_cnt|r_reg\(6),
	datac => \inst_PWM_cnt|r_reg\(7),
	datad => \inst_PWM_cnt|r_reg\(4),
	combout => \inst_PWM_cnt|Equal0~1_combout\);

-- Location: LCCOMB_X2_Y24_N2
\inst_PWM_cnt|r_reg[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|r_reg[2]~10_combout\ = (\Reset~input_o\) # ((!\inst_PWM_cnt|Equal0~0_combout\ & !\inst_PWM_cnt|Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_cnt|Equal0~0_combout\,
	datac => \Reset~input_o\,
	datad => \inst_PWM_cnt|Equal0~1_combout\,
	combout => \inst_PWM_cnt|r_reg[2]~10_combout\);

-- Location: FF_X2_Y24_N15
\inst_PWM_cnt|r_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[1]~11_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(1));

-- Location: FF_X2_Y24_N17
\inst_PWM_cnt|r_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[2]~13_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(2));

-- Location: LCCOMB_X2_Y24_N4
\inst_PWM_cnt|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|Equal0~0_combout\ = (((!\inst_PWM_cnt|r_reg\(3)) # (!\inst_PWM_cnt|r_reg\(1))) # (!\inst_PWM_cnt|r_reg\(2))) # (!\inst_PWM_cnt|r_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(0),
	datab => \inst_PWM_cnt|r_reg\(2),
	datac => \inst_PWM_cnt|r_reg\(1),
	datad => \inst_PWM_cnt|r_reg\(3),
	combout => \inst_PWM_cnt|Equal0~0_combout\);

-- Location: LCCOMB_X1_Y24_N28
\inst_PWM_cnt|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_cnt|Equal0~2_combout\ = (!\inst_PWM_cnt|Equal0~0_combout\ & !\inst_PWM_cnt|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|Equal0~0_combout\,
	datad => \inst_PWM_cnt|Equal0~1_combout\,
	combout => \inst_PWM_cnt|Equal0~2_combout\);

-- Location: IOIBUF_X0_Y36_N8
\iClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iClk,
	o => \iClk~input_o\);

-- Location: CLKCTRL_G2
\iClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iClk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y25_N15
\iData[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(7),
	o => \iData[7]~input_o\);

-- Location: FF_X1_Y24_N29
\inst_PWM_reg|R[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[7]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(7));

-- Location: IOIBUF_X0_Y23_N15
\iData[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(6),
	o => \iData[6]~input_o\);

-- Location: FF_X1_Y24_N21
\inst_PWM_reg|R[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[6]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(6));

-- Location: FF_X2_Y24_N23
\inst_PWM_cnt|r_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[5]~19_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(5));

-- Location: IOIBUF_X0_Y24_N8
\iData[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iData(4),
	o => \iData[4]~input_o\);

-- Location: FF_X1_Y24_N17
\inst_PWM_reg|R[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	asdata => \iData[4]~input_o\,
	sload => VCC,
	ena => \inst_PWM_cnt|Equal0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_reg|R\(4));

-- Location: FF_X2_Y24_N13
\inst_PWM_cnt|r_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_cnt|r_reg[0]~8_combout\,
	clrn => \ALT_INV_Reset~inputclkctrl_outclk\,
	sclr => \inst_PWM_cnt|r_reg[2]~10_combout\,
	ena => \inst_PWM_clken|clk_en~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_cnt|r_reg\(0));

-- Location: LCCOMB_X1_Y24_N8
\inst_PWM_comp|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~1_cout\ = CARRY((!\inst_PWM_reg|R\(0) & \inst_PWM_cnt|r_reg\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_reg|R\(0),
	datab => \inst_PWM_cnt|r_reg\(0),
	datad => VCC,
	cout => \inst_PWM_comp|LessThan0~1_cout\);

-- Location: LCCOMB_X1_Y24_N10
\inst_PWM_comp|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~3_cout\ = CARRY((\inst_PWM_reg|R\(1) & ((!\inst_PWM_comp|LessThan0~1_cout\) # (!\inst_PWM_cnt|r_reg\(1)))) # (!\inst_PWM_reg|R\(1) & (!\inst_PWM_cnt|r_reg\(1) & !\inst_PWM_comp|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_reg|R\(1),
	datab => \inst_PWM_cnt|r_reg\(1),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~1_cout\,
	cout => \inst_PWM_comp|LessThan0~3_cout\);

-- Location: LCCOMB_X1_Y24_N12
\inst_PWM_comp|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~5_cout\ = CARRY((\inst_PWM_reg|R\(2) & (\inst_PWM_cnt|r_reg\(2) & !\inst_PWM_comp|LessThan0~3_cout\)) # (!\inst_PWM_reg|R\(2) & ((\inst_PWM_cnt|r_reg\(2)) # (!\inst_PWM_comp|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_reg|R\(2),
	datab => \inst_PWM_cnt|r_reg\(2),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~3_cout\,
	cout => \inst_PWM_comp|LessThan0~5_cout\);

-- Location: LCCOMB_X1_Y24_N14
\inst_PWM_comp|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~7_cout\ = CARRY((\inst_PWM_reg|R\(3) & ((!\inst_PWM_comp|LessThan0~5_cout\) # (!\inst_PWM_cnt|r_reg\(3)))) # (!\inst_PWM_reg|R\(3) & (!\inst_PWM_cnt|r_reg\(3) & !\inst_PWM_comp|LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_reg|R\(3),
	datab => \inst_PWM_cnt|r_reg\(3),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~5_cout\,
	cout => \inst_PWM_comp|LessThan0~7_cout\);

-- Location: LCCOMB_X1_Y24_N16
\inst_PWM_comp|LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~9_cout\ = CARRY((\inst_PWM_cnt|r_reg\(4) & ((!\inst_PWM_comp|LessThan0~7_cout\) # (!\inst_PWM_reg|R\(4)))) # (!\inst_PWM_cnt|r_reg\(4) & (!\inst_PWM_reg|R\(4) & !\inst_PWM_comp|LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(4),
	datab => \inst_PWM_reg|R\(4),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~7_cout\,
	cout => \inst_PWM_comp|LessThan0~9_cout\);

-- Location: LCCOMB_X1_Y24_N18
\inst_PWM_comp|LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~11_cout\ = CARRY((\inst_PWM_reg|R\(5) & ((!\inst_PWM_comp|LessThan0~9_cout\) # (!\inst_PWM_cnt|r_reg\(5)))) # (!\inst_PWM_reg|R\(5) & (!\inst_PWM_cnt|r_reg\(5) & !\inst_PWM_comp|LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_reg|R\(5),
	datab => \inst_PWM_cnt|r_reg\(5),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~9_cout\,
	cout => \inst_PWM_comp|LessThan0~11_cout\);

-- Location: LCCOMB_X1_Y24_N20
\inst_PWM_comp|LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~13_cout\ = CARRY((\inst_PWM_cnt|r_reg\(6) & ((!\inst_PWM_comp|LessThan0~11_cout\) # (!\inst_PWM_reg|R\(6)))) # (!\inst_PWM_cnt|r_reg\(6) & (!\inst_PWM_reg|R\(6) & !\inst_PWM_comp|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst_PWM_cnt|r_reg\(6),
	datab => \inst_PWM_reg|R\(6),
	datad => VCC,
	cin => \inst_PWM_comp|LessThan0~11_cout\,
	cout => \inst_PWM_comp|LessThan0~13_cout\);

-- Location: LCCOMB_X1_Y24_N22
\inst_PWM_comp|LessThan0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_comp|LessThan0~14_combout\ = (\inst_PWM_reg|R\(7) & (\inst_PWM_comp|LessThan0~13_cout\ & \inst_PWM_cnt|r_reg\(7))) # (!\inst_PWM_reg|R\(7) & ((\inst_PWM_comp|LessThan0~13_cout\) # (\inst_PWM_cnt|r_reg\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst_PWM_reg|R\(7),
	datad => \inst_PWM_cnt|r_reg\(7),
	cin => \inst_PWM_comp|LessThan0~13_cout\,
	combout => \inst_PWM_comp|LessThan0~14_combout\);

-- Location: FF_X1_Y24_N23
\inst_PWM_comp|C\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_comp|LessThan0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_comp|C~q\);

-- Location: LCCOMB_X2_Y24_N28
\inst_PWM_RS_latch|q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst_PWM_RS_latch|q~0_combout\ = (!\Reset~input_o\ & \inst_PWM_comp|C~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \inst_PWM_comp|C~q\,
	combout => \inst_PWM_RS_latch|q~0_combout\);

-- Location: FF_X2_Y24_N29
\inst_PWM_RS_latch|q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iClk~inputclkctrl_outclk\,
	d => \inst_PWM_RS_latch|q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst_PWM_RS_latch|q~q\);

ww_Scream_Pain <= \Scream_Pain~output_o\;

ww_oPWM <= \oPWM~output_o\;
END structure;


