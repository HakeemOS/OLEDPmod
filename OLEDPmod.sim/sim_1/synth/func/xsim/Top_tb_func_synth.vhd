-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue Jul  2 20:59:52 2024
-- Host        : DESKTOP-PJ7659C running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/squid/OneDrive/Documents/Vivado/2024/OLEDPmod/OLEDPmod.sim/sim_1/synth/func/xsim/Top_tb_func_synth.vhd
-- Design      : Top_s
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SPI_Tx is
  port (
    nxByte_t : out STD_LOGIC;
    CS_OBUF : out STD_LOGIC;
    MOSI_OBUF : out STD_LOGIC;
    TxReady : out STD_LOGIC;
    CLK : in STD_LOGIC;
    startOUT : in STD_LOGIC;
    byteCountOUT : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_IBUF : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end SPI_Tx;

architecture STRUCTURE of SPI_Tx is
  signal CS_t : STD_LOGIC;
  signal CS_t_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_stt[1]_i_1_n_0\ : STD_LOGIC;
  signal MOSI_t : STD_LOGIC;
  signal MOSI_t0 : STD_LOGIC;
  signal MOSI_t_i_2_n_0 : STD_LOGIC;
  signal MOSI_t_i_3_n_0 : STD_LOGIC;
  signal MOSI_t_i_4_n_0 : STD_LOGIC;
  signal MOSI_t_i_5_n_0 : STD_LOGIC;
  signal MOSI_t_i_6_n_0 : STD_LOGIC;
  signal TxCount : STD_LOGIC;
  signal \TxCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \TxCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \TxCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \TxCount[3]_i_2_n_0\ : STD_LOGIC;
  signal \TxCount[3]_i_3_n_0\ : STD_LOGIC;
  signal \TxCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \TxCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \TxCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \TxCount_reg_n_0_[3]\ : STD_LOGIC;
  signal \^txready\ : STD_LOGIC;
  signal TxReady_t : STD_LOGIC;
  signal TxReady_t_i_1_n_0 : STD_LOGIC;
  signal TxReady_t_i_2_n_0 : STD_LOGIC;
  signal byteCount_i : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCount_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \byteCount_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \byteCount_i[3]_i_3_n_0\ : STD_LOGIC;
  signal \byteCount_i_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteCount_i_reg_n_0_[1]\ : STD_LOGIC;
  signal \byteCount_i_reg_n_0_[2]\ : STD_LOGIC;
  signal \byteCount_i_reg_n_0_[3]\ : STD_LOGIC;
  signal byteReg : STD_LOGIC;
  signal \byteReg_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[1]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[2]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[3]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[4]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[5]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[6]\ : STD_LOGIC;
  signal \byteReg_reg_n_0_[7]\ : STD_LOGIC;
  signal done : STD_LOGIC;
  signal \done__0\ : STD_LOGIC;
  signal lBit : STD_LOGIC;
  signal lBit_reg_n_0 : STD_LOGIC;
  signal nxByte_t_0 : STD_LOGIC;
  signal nxByte_t_i_2_n_0 : STD_LOGIC;
  signal nxByte_t_i_3_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_stt[1]_i_1\ : label is "soft_lutpair13";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[0]\ : label is "rststt:001,idle:010,iSTATE:100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[1]\ : label is "rststt:001,idle:010,iSTATE:100";
  attribute SOFT_HLUTNM of \TxCount[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \TxCount[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \TxCount[3]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of TxReady_t_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \byteCount_i[0]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \byteCount_i[1]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \byteCount_i[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \byteCount_i[3]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \byteCount_i[3]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of nxByte_t_i_2 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of nxByte_t_i_3 : label is "soft_lutpair13";
begin
  TxReady <= \^txready\;
CS_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000008"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[0]\,
      I1 => lBit_reg_n_0,
      I2 => nxByte_t_i_2_n_0,
      I3 => \byteCount_i[3]_i_3_n_0\,
      I4 => TxReady_t,
      I5 => MOSI_t0,
      O => CS_t_i_1_n_0
    );
CS_t_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => TxReady_t,
      I1 => \TxCount_reg_n_0_[3]\,
      I2 => \TxCount_reg_n_0_[0]\,
      I3 => \TxCount_reg_n_0_[1]\,
      I4 => \TxCount_reg_n_0_[2]\,
      O => CS_t
    );
CS_t_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => CS_t,
      D => '0',
      Q => CS_OBUF,
      S => CS_t_i_1_n_0
    );
\FSM_onehot_stt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFE2"
    )
        port map (
      I0 => \done__0\,
      I1 => TxReady_t,
      I2 => \^txready\,
      I3 => MOSI_t0,
      I4 => rst_IBUF,
      O => \FSM_onehot_stt[1]_i_1_n_0\
    );
\FSM_onehot_stt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => rst_IBUF,
      Q => MOSI_t0,
      R => '0'
    );
\FSM_onehot_stt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \FSM_onehot_stt[1]_i_1_n_0\,
      Q => TxReady_t,
      R => '0'
    );
MOSI_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"33333332"
    )
        port map (
      I0 => \TxCount_reg_n_0_[0]\,
      I1 => TxReady_t,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[1]\,
      I4 => \TxCount_reg_n_0_[3]\,
      O => MOSI_t
    );
MOSI_t_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => MOSI_t_i_3_n_0,
      I1 => MOSI_t_i_4_n_0,
      I2 => MOSI_t_i_5_n_0,
      I3 => MOSI_t_i_6_n_0,
      O => MOSI_t_i_2_n_0
    );
MOSI_t_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22400040"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \byteReg_reg_n_0_[3]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[2]\,
      O => MOSI_t_i_3_n_0
    );
MOSI_t_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"11200020"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \byteReg_reg_n_0_[1]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[0]\,
      O => MOSI_t_i_4_n_0
    );
MOSI_t_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88100010"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \byteReg_reg_n_0_[7]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[6]\,
      O => MOSI_t_i_5_n_0
    );
MOSI_t_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44800080"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \byteReg_reg_n_0_[5]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[4]\,
      O => MOSI_t_i_6_n_0
    );
MOSI_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => MOSI_t,
      D => MOSI_t_i_2_n_0,
      Q => MOSI_OBUF,
      R => MOSI_t0
    );
\TxCount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => TxReady_t,
      I1 => MOSI_t0,
      I2 => \TxCount_reg_n_0_[0]\,
      O => \TxCount[0]_i_1_n_0\
    );
\TxCount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1001"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => \TxCount_reg_n_0_[1]\,
      I3 => \TxCount_reg_n_0_[0]\,
      O => \TxCount[1]_i_1_n_0\
    );
\TxCount[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10101001"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[1]\,
      I4 => \TxCount_reg_n_0_[0]\,
      O => \TxCount[2]_i_1_n_0\
    );
\TxCount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFC888"
    )
        port map (
      I0 => nxByte_t_i_2_n_0,
      I1 => \TxCount_reg_n_0_[0]\,
      I2 => \byteCount_i_reg_n_0_[0]\,
      I3 => lBit_reg_n_0,
      I4 => nxByte_t_i_3_n_0,
      I5 => \TxCount[3]_i_3_n_0\,
      O => TxCount
    );
\TxCount[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFEFEFFFEFEFEEF"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => \TxCount_reg_n_0_[3]\,
      I3 => \TxCount_reg_n_0_[2]\,
      I4 => \TxCount_reg_n_0_[1]\,
      I5 => \TxCount_reg_n_0_[0]\,
      O => \TxCount[3]_i_2_n_0\
    );
\TxCount[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \TxCount_reg_n_0_[2]\,
      I1 => \TxCount_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[3]\,
      O => \TxCount[3]_i_3_n_0\
    );
\TxCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => TxCount,
      D => \TxCount[0]_i_1_n_0\,
      Q => \TxCount_reg_n_0_[0]\,
      R => '0'
    );
\TxCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => TxCount,
      D => \TxCount[1]_i_1_n_0\,
      Q => \TxCount_reg_n_0_[1]\,
      R => '0'
    );
\TxCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => TxCount,
      D => \TxCount[2]_i_1_n_0\,
      Q => \TxCount_reg_n_0_[2]\,
      R => '0'
    );
\TxCount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => TxCount,
      D => \TxCount[3]_i_2_n_0\,
      Q => \TxCount_reg_n_0_[3]\,
      R => '0'
    );
TxReady_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000055010000FFAB"
    )
        port map (
      I0 => TxReady_t,
      I1 => TxReady_t_i_2_n_0,
      I2 => \byteCount_i[3]_i_3_n_0\,
      I3 => \^txready\,
      I4 => MOSI_t0,
      I5 => startOUT,
      O => TxReady_t_i_1_n_0
    );
TxReady_t_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFF7"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[0]\,
      I1 => lBit_reg_n_0,
      I2 => \byteCount_i_reg_n_0_[3]\,
      I3 => \byteCount_i_reg_n_0_[1]\,
      I4 => \byteCount_i_reg_n_0_[2]\,
      O => TxReady_t_i_2_n_0
    );
TxReady_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => TxReady_t_i_1_n_0,
      Q => \^txready\,
      R => '0'
    );
\byteCount_i[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => byteCountOUT(0),
      I1 => TxReady_t,
      I2 => \byteCount_i_reg_n_0_[0]\,
      O => byteCount_i(0)
    );
\byteCount_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[1]\,
      I1 => \byteCount_i_reg_n_0_[0]\,
      I2 => TxReady_t,
      O => \byteCount_i[1]_i_1_n_0\
    );
\byteCount_i[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00A9"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[2]\,
      I1 => \byteCount_i_reg_n_0_[1]\,
      I2 => \byteCount_i_reg_n_0_[0]\,
      I3 => TxReady_t,
      O => \byteCount_i[2]_i_1_n_0\
    );
\byteCount_i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000055545554"
    )
        port map (
      I0 => \byteCount_i[3]_i_3_n_0\,
      I1 => \byteCount_i_reg_n_0_[3]\,
      I2 => \byteCount_i_reg_n_0_[1]\,
      I3 => \byteCount_i_reg_n_0_[2]\,
      I4 => startOUT,
      I5 => TxReady_t,
      O => \byteCount_i[3]_i_1_n_0\
    );
\byteCount_i[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AAA9"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[3]\,
      I1 => \byteCount_i_reg_n_0_[2]\,
      I2 => \byteCount_i_reg_n_0_[1]\,
      I3 => \byteCount_i_reg_n_0_[0]\,
      I4 => TxReady_t,
      O => \byteCount_i[3]_i_2_n_0\
    );
\byteCount_i[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \TxCount_reg_n_0_[3]\,
      I1 => \TxCount_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[0]\,
      O => \byteCount_i[3]_i_3_n_0\
    );
\byteCount_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => byteCount_i(0),
      Q => \byteCount_i_reg_n_0_[0]\,
      R => MOSI_t0
    );
\byteCount_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => \byteCount_i[1]_i_1_n_0\,
      Q => \byteCount_i_reg_n_0_[1]\,
      R => MOSI_t0
    );
\byteCount_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => \byteCount_i[2]_i_1_n_0\,
      Q => \byteCount_i_reg_n_0_[2]\,
      R => MOSI_t0
    );
\byteCount_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => \byteCount_i[3]_i_2_n_0\,
      Q => \byteCount_i_reg_n_0_[3]\,
      R => MOSI_t0
    );
\byteReg[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF000404"
    )
        port map (
      I0 => \byteCount_i[3]_i_3_n_0\,
      I1 => nxByte_t_i_2_n_0,
      I2 => MOSI_t0,
      I3 => startOUT,
      I4 => TxReady_t,
      O => byteReg
    );
\byteReg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(0),
      Q => \byteReg_reg_n_0_[0]\,
      R => '0'
    );
\byteReg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(1),
      Q => \byteReg_reg_n_0_[1]\,
      R => '0'
    );
\byteReg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(2),
      Q => \byteReg_reg_n_0_[2]\,
      R => '0'
    );
\byteReg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(3),
      Q => \byteReg_reg_n_0_[3]\,
      R => '0'
    );
\byteReg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(4),
      Q => \byteReg_reg_n_0_[4]\,
      R => '0'
    );
\byteReg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(5),
      Q => \byteReg_reg_n_0_[5]\,
      R => '0'
    );
\byteReg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(6),
      Q => \byteReg_reg_n_0_[6]\,
      R => '0'
    );
\byteReg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => byteReg,
      D => D(7),
      Q => \byteReg_reg_n_0_[7]\,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => \byteCount_i[3]_i_3_n_0\,
      I3 => nxByte_t_i_2_n_0,
      I4 => lBit_reg_n_0,
      I5 => \byteCount_i_reg_n_0_[0]\,
      O => done
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => done,
      Q => \done__0\,
      R => '0'
    );
lBit_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100010101010101"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => \byteCount_i[3]_i_3_n_0\,
      I3 => nxByte_t_i_2_n_0,
      I4 => lBit_reg_n_0,
      I5 => \byteCount_i_reg_n_0_[0]\,
      O => lBit
    );
lBit_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => lBit,
      Q => lBit_reg_n_0,
      R => '0'
    );
nxByte_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => nxByte_t_i_2_n_0,
      I1 => \TxCount_reg_n_0_[3]\,
      I2 => nxByte_t_i_3_n_0,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \TxCount_reg_n_0_[1]\,
      I5 => \TxCount_reg_n_0_[2]\,
      O => nxByte_t_0
    );
nxByte_t_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[2]\,
      I1 => \byteCount_i_reg_n_0_[1]\,
      I2 => \byteCount_i_reg_n_0_[3]\,
      O => nxByte_t_i_2_n_0
    );
nxByte_t_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      O => nxByte_t_i_3_n_0
    );
nxByte_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => CLK,
      CE => '1',
      D => nxByte_t_0,
      Q => nxByte_t,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity byteBuffer_s is
  port (
    startOUT : out STD_LOGIC;
    byteCountOUT : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    \byteCountIN_i_reg[0]_0\ : in STD_LOGIC;
    oneByte_reg_0 : in STD_LOGIC;
    done0 : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    srcSel : in STD_LOGIC;
    byteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    \bytesIN_i_reg[0][0]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_1\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_2\ : in STD_LOGIC;
    \bytesIN_i_reg[0][4]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][4]_1\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_3\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_4\ : in STD_LOGIC;
    \bytesIN_i[9][0]_i_7_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_5\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_1\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_2\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_1\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_2\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_6\ : in STD_LOGIC;
    \bytesIN_i_reg[0][0]_7\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_3\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_4\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_5\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_6\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_3\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_4\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_5\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_7\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_8\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_9\ : in STD_LOGIC;
    TxReady : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_6\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_7\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_8\ : in STD_LOGIC;
    \bytesIN_i_reg[0][3]_9\ : in STD_LOGIC;
    \bytesIN_i[9][0]_i_7_1\ : in STD_LOGIC;
    nxByte_t : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC
  );
end byteBuffer_s;

architecture STRUCTURE of byteBuffer_s is
  signal \FSM_sequential_stt[0]_i_2_n_0\ : STD_LOGIC;
  signal byteCountIN_i : STD_LOGIC;
  signal \byteCountIN_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteCountIN_i__0\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^bytecountout\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCountOUT_t[0]_i_1_n_0\ : STD_LOGIC;
  signal byteOUT_t : STD_LOGIC;
  signal \byteOUT_t[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_1_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_10_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_11_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_6_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_7_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_8_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_9_n_0\ : STD_LOGIC;
  signal \bytesIN[9]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \bytesIN_i[0]_3\ : STD_LOGIC;
  signal \bytesIN_i[1]_1\ : STD_LOGIC;
  signal \bytesIN_i[2]_2\ : STD_LOGIC;
  signal \bytesIN_i[3]_7\ : STD_LOGIC;
  signal \bytesIN_i[4]_6\ : STD_LOGIC;
  signal \bytesIN_i[5]_5\ : STD_LOGIC;
  signal \bytesIN_i[6]_4\ : STD_LOGIC;
  signal \bytesIN_i[7]_10\ : STD_LOGIC;
  signal \bytesIN_i[8]_9\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_10_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_7_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_8_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_9_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_2__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_2__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][4]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_10_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_11_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_12_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_7_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_8_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_9_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9]_8\ : STD_LOGIC;
  signal \bytesIN_i_reg[0]_11\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \bytesIN_i_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][7]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][7]\ : STD_LOGIC;
  signal followED : STD_LOGIC;
  signal followED_i_1_n_0 : STD_LOGIC;
  signal leadED : STD_LOGIC;
  signal leadED_i_1_n_0 : STD_LOGIC;
  signal leadED_reg_n_0 : STD_LOGIC;
  signal lxDone_reg_n_0 : STD_LOGIC;
  signal lxFlag_reg_n_0 : STD_LOGIC;
  signal nByteCount : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \nByteCount[0]_i_2_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_1_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_3_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_4_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_5_n_0\ : STD_LOGIC;
  signal \nByteCount_reg_n_0_[0]\ : STD_LOGIC;
  signal \nByteCount_reg_n_0_[1]\ : STD_LOGIC;
  signal \nByteCount_reg_n_0_[2]\ : STD_LOGIC;
  signal \nByteCount_reg_n_0_[3]\ : STD_LOGIC;
  signal nxByteED : STD_LOGIC;
  signal nxByteED_i_1_n_0 : STD_LOGIC;
  signal oneByte_i_1_n_0 : STD_LOGIC;
  signal oneByte_i_2_n_0 : STD_LOGIC;
  signal oneByte_reg_n_0 : STD_LOGIC;
  signal rdy_t : STD_LOGIC;
  signal \^startout\ : STD_LOGIC;
  signal startOUT_t_i_1_n_0 : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \stt__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sxDone_i_1_n_0 : STD_LOGIC;
  signal sxDone_reg_n_0 : STD_LOGIC;
  signal sxFlag_i_1_n_0 : STD_LOGIC;
  signal sxFlag_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_stt[0]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \FSM_sequential_stt[1]_i_1__0\ : label is "soft_lutpair1";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "rststt:00,iSTATE:11,idle:01,lx:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "rststt:00,iSTATE:11,idle:01,lx:10";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_10\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_8\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_9\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \bytesIN_i[9][0]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bytesIN_i[9][3]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bytesIN_i[9][4]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bytesIN_i[9][6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \bytesIN_i[9][7]_i_10\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bytesIN_i[9][7]_i_11\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \bytesIN_i[9][7]_i_12\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of followED_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of lxFlag_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \nByteCount[3]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of nxByteED_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of startOUT_t_i_1 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of sxFlag_i_2 : label is "soft_lutpair3";
begin
  byteCountOUT(0) <= \^bytecountout\(0);
  startOUT <= \^startout\;
\FSM_sequential_stt[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BAAA"
    )
        port map (
      I0 => \FSM_sequential_stt[0]_i_2_n_0\,
      I1 => sxDone_reg_n_0,
      I2 => rdy_t,
      I3 => stt(1),
      O => \stt__0\(0)
    );
\FSM_sequential_stt[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFF55FF0FCC55FF"
    )
        port map (
      I0 => lxFlag_reg_n_0,
      I1 => oneByte_reg_n_0,
      I2 => oneByte_reg_0,
      I3 => rdy_t,
      I4 => stt(1),
      I5 => lxDone_reg_n_0,
      O => \FSM_sequential_stt[0]_i_2_n_0\
    );
\FSM_sequential_stt[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAF03AF0"
    )
        port map (
      I0 => lxFlag_reg_n_0,
      I1 => sxDone_reg_n_0,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => oneByte_reg_0,
      O => \stt__0\(1)
    );
\FSM_sequential_stt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(0),
      Q => rdy_t,
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(1),
      Q => stt(1),
      R => rst_IBUF
    );
\byteCountIN_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000002222E222"
    )
        port map (
      I0 => \byteCountIN_i__0\(0),
      I1 => byteCountIN_i,
      I2 => \byteCountIN_i_reg[0]_0\,
      I3 => \bytesIN_i[9][7]_i_8_n_0\,
      I4 => done0,
      I5 => \bytesIN_i[9][7]_i_1_n_0\,
      O => \byteCountIN_i[0]_i_1_n_0\
    );
\byteCountIN_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountIN_i[0]_i_1_n_0\,
      Q => \byteCountIN_i__0\(0),
      R => '0'
    );
\byteCountOUT_t[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"ACC0"
    )
        port map (
      I0 => \byteCountIN_i__0\(0),
      I1 => \^bytecountout\(0),
      I2 => rdy_t,
      I3 => stt(1),
      O => \byteCountOUT_t[0]_i_1_n_0\
    );
\byteCountOUT_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountOUT_t[0]_i_1_n_0\,
      Q => \^bytecountout\(0),
      R => '0'
    );
\byteOUT_t[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[0]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][0]\,
      I4 => \byteOUT_t[0]_i_3_n_0\,
      I5 => \byteOUT_t[0]_i_4_n_0\,
      O => \byteOUT_t[0]_i_1_n_0\
    );
\byteOUT_t[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][0]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][0]\,
      I4 => \bytesIN_i_reg_n_0_[8][0]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[0]_i_2_n_0\
    );
\byteOUT_t[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(0),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][0]\,
      I4 => \bytesIN_i_reg_n_0_[2][0]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[0]_i_3_n_0\
    );
\byteOUT_t[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][0]\,
      I1 => \bytesIN_i_reg_n_0_[4][0]\,
      I2 => \bytesIN_i_reg_n_0_[5][0]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[0]_i_4_n_0\
    );
\byteOUT_t[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[1]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][1]\,
      I4 => \byteOUT_t[1]_i_3_n_0\,
      I5 => \byteOUT_t[1]_i_4_n_0\,
      O => \byteOUT_t[1]_i_1_n_0\
    );
\byteOUT_t[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][1]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][1]\,
      I4 => \bytesIN_i_reg_n_0_[8][1]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[1]_i_2_n_0\
    );
\byteOUT_t[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(1),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][1]\,
      I4 => \bytesIN_i_reg_n_0_[2][1]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[1]_i_3_n_0\
    );
\byteOUT_t[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][1]\,
      I1 => \bytesIN_i_reg_n_0_[4][1]\,
      I2 => \bytesIN_i_reg_n_0_[5][1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[1]_i_4_n_0\
    );
\byteOUT_t[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[2]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][2]\,
      I4 => \byteOUT_t[2]_i_3_n_0\,
      I5 => \byteOUT_t[2]_i_4_n_0\,
      O => \byteOUT_t[2]_i_1_n_0\
    );
\byteOUT_t[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][2]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][2]\,
      I4 => \bytesIN_i_reg_n_0_[8][2]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[2]_i_2_n_0\
    );
\byteOUT_t[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(2),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][2]\,
      I4 => \bytesIN_i_reg_n_0_[2][2]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[2]_i_3_n_0\
    );
\byteOUT_t[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][2]\,
      I1 => \bytesIN_i_reg_n_0_[4][2]\,
      I2 => \bytesIN_i_reg_n_0_[5][2]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[2]_i_4_n_0\
    );
\byteOUT_t[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[3]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][3]\,
      I4 => \byteOUT_t[3]_i_3_n_0\,
      I5 => \byteOUT_t[3]_i_4_n_0\,
      O => \byteOUT_t[3]_i_1_n_0\
    );
\byteOUT_t[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][3]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][3]\,
      I4 => \bytesIN_i_reg_n_0_[8][3]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[3]_i_2_n_0\
    );
\byteOUT_t[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(3),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][3]\,
      I4 => \bytesIN_i_reg_n_0_[2][3]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[3]_i_3_n_0\
    );
\byteOUT_t[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][3]\,
      I1 => \bytesIN_i_reg_n_0_[4][3]\,
      I2 => \bytesIN_i_reg_n_0_[5][3]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[3]_i_4_n_0\
    );
\byteOUT_t[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[4]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][4]\,
      I4 => \byteOUT_t[4]_i_3_n_0\,
      I5 => \byteOUT_t[4]_i_4_n_0\,
      O => \byteOUT_t[4]_i_1_n_0\
    );
\byteOUT_t[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][4]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][4]\,
      I4 => \bytesIN_i_reg_n_0_[8][4]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[4]_i_2_n_0\
    );
\byteOUT_t[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(4),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][4]\,
      I4 => \bytesIN_i_reg_n_0_[2][4]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[4]_i_3_n_0\
    );
\byteOUT_t[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][4]\,
      I1 => \bytesIN_i_reg_n_0_[4][4]\,
      I2 => \bytesIN_i_reg_n_0_[5][4]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[4]_i_4_n_0\
    );
\byteOUT_t[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[5]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][5]\,
      I4 => \byteOUT_t[5]_i_3_n_0\,
      I5 => \byteOUT_t[5]_i_4_n_0\,
      O => \byteOUT_t[5]_i_1_n_0\
    );
\byteOUT_t[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][5]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][5]\,
      I4 => \bytesIN_i_reg_n_0_[8][5]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[5]_i_2_n_0\
    );
\byteOUT_t[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(5),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][5]\,
      I4 => \bytesIN_i_reg_n_0_[2][5]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[5]_i_3_n_0\
    );
\byteOUT_t[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][5]\,
      I1 => \bytesIN_i_reg_n_0_[4][5]\,
      I2 => \bytesIN_i_reg_n_0_[5][5]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[5]_i_4_n_0\
    );
\byteOUT_t[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[6]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][6]\,
      I4 => \byteOUT_t[6]_i_3_n_0\,
      I5 => \byteOUT_t[6]_i_4_n_0\,
      O => \byteOUT_t[6]_i_1_n_0\
    );
\byteOUT_t[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][6]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][6]\,
      I4 => \bytesIN_i_reg_n_0_[8][6]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[6]_i_2_n_0\
    );
\byteOUT_t[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(6),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][6]\,
      I4 => \bytesIN_i_reg_n_0_[2][6]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[6]_i_3_n_0\
    );
\byteOUT_t[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][6]\,
      I1 => \bytesIN_i_reg_n_0_[4][6]\,
      I2 => \bytesIN_i_reg_n_0_[5][6]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[6]_i_4_n_0\
    );
\byteOUT_t[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000E0FF2000"
    )
        port map (
      I0 => \byteOUT_t[7]_i_3_n_0\,
      I1 => \^startout\,
      I2 => nxByteED,
      I3 => sxFlag_reg_n_0,
      I4 => TxReady,
      I5 => \byteOUT_t[7]_i_4_n_0\,
      O => byteOUT_t
    );
\byteOUT_t[7]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      O => \byteOUT_t[7]_i_10_n_0\
    );
\byteOUT_t[7]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      O => \byteOUT_t[7]_i_11_n_0\
    );
\byteOUT_t[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \byteOUT_t[7]_i_5_n_0\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[9][7]\,
      I4 => \byteOUT_t[7]_i_6_n_0\,
      I5 => \byteOUT_t[7]_i_7_n_0\,
      O => \byteOUT_t[7]_i_2_n_0\
    );
\byteOUT_t[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      O => \byteOUT_t[7]_i_3_n_0\
    );
\byteOUT_t[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rdy_t,
      I1 => stt(1),
      O => \byteOUT_t[7]_i_4_n_0\
    );
\byteOUT_t[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \byteOUT_t[7]_i_8_n_0\,
      I1 => \bytesIN_i_reg_n_0_[6][7]\,
      I2 => \byteOUT_t[7]_i_9_n_0\,
      I3 => \bytesIN_i_reg_n_0_[7][7]\,
      I4 => \bytesIN_i_reg_n_0_[8][7]\,
      I5 => \byteOUT_t[7]_i_10_n_0\,
      O => \byteOUT_t[7]_i_5_n_0\
    );
\byteOUT_t[7]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF222F222F222"
    )
        port map (
      I0 => \bytesIN_i_reg[0]_11\(7),
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i[9][7]_i_12_n_0\,
      I3 => \bytesIN_i_reg_n_0_[1][7]\,
      I4 => \bytesIN_i_reg_n_0_[2][7]\,
      I5 => \bytesIN_i[9][7]_i_11_n_0\,
      O => \byteOUT_t[7]_i_6_n_0\
    );
\byteOUT_t[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00F0CCAA00000000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[3][7]\,
      I1 => \bytesIN_i_reg_n_0_[4][7]\,
      I2 => \bytesIN_i_reg_n_0_[5][7]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \byteOUT_t[7]_i_11_n_0\,
      O => \byteOUT_t[7]_i_7_n_0\
    );
\byteOUT_t[7]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      O => \byteOUT_t[7]_i_8_n_0\
    );
\byteOUT_t[7]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      O => \byteOUT_t[7]_i_9_n_0\
    );
\byteOUT_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[0]_i_1_n_0\,
      Q => Q(0),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[1]_i_1_n_0\,
      Q => Q(1),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[2]_i_1_n_0\,
      Q => Q(2),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[3]_i_1_n_0\,
      Q => Q(3),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[4]_i_1_n_0\,
      Q => Q(4),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[5]_i_1_n_0\,
      Q => Q(5),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[6]_i_1_n_0\,
      Q => Q(6),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\byteOUT_t_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \byteOUT_t[7]_i_2_n_0\,
      Q => Q(7),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[3]\,
      O => \bytesIN_i[0]_3\
    );
\bytesIN_i[2][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000100000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[2]_2\
    );
\bytesIN_i[3][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[3]_7\
    );
\bytesIN_i[4][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[4]_6\
    );
\bytesIN_i[5][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[5]_5\
    );
\bytesIN_i[6][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000200000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[6]_4\
    );
\bytesIN_i[7][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \nByteCount_reg_n_0_[3]\,
      O => \bytesIN_i[7]_10\
    );
\bytesIN_i[8][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[8]_9\
    );
\bytesIN_i[9][0]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_7_1\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      O => \bytesIN_i[9][0]_i_10_n_0\
    );
\bytesIN_i[9][0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2_n_0\,
      I1 => \bytesIN_i[9][0]_i_3_n_0\,
      I2 => \bytesIN_i[9][0]_i_4_n_0\,
      I3 => \bytesIN_i[9][0]_i_5_n_0\,
      I4 => \bytesIN_i[9][0]_i_6_n_0\,
      I5 => \bytesIN_i[9][0]_i_7_n_0\,
      O => \bytesIN[9]_0\(0)
    );
\bytesIN_i[9][0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F222FFFFF2220000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][0]_0\,
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => \bytesIN_i_reg[0][0]_1\,
      I3 => \bytesIN_i[9][7]_i_12_n_0\,
      I4 => \bytesIN_i[9][7]_i_8_n_0\,
      I5 => \bytesIN_i[9][0]_i_8_n_0\,
      O => \bytesIN_i[9][0]_i_2_n_0\
    );
\bytesIN_i[9][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008000000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][0]_6\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i[9][7]_i_8_n_0\,
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[3]\,
      O => \bytesIN_i[9][0]_i_3_n_0\
    );
\bytesIN_i[9][0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008000000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][0]_7\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \bytesIN_i[9][7]_i_8_n_0\,
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[3]\,
      O => \bytesIN_i[9][0]_i_4_n_0\
    );
\bytesIN_i[9][0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000008800000088"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_10_n_0\,
      I1 => \bytesIN_i_reg[0][0]_3\,
      I2 => \bytesIN_i[9][3]_i_4_n_0\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg[0][0]_4\,
      O => \bytesIN_i[9][0]_i_5_n_0\
    );
\bytesIN_i[9][0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00808000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg[0][0]_5\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      O => \bytesIN_i[9][0]_i_6_n_0\
    );
\bytesIN_i[9][0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFEAAAEAAAEAAA"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_9_n_0\,
      I1 => \bytesIN_i_reg[0][0]_2\,
      I2 => \bytesIN_i[9][7]_i_8_n_0\,
      I3 => \bytesIN_i[9][7]_i_11_n_0\,
      I4 => \bytesIN_i[9][0]_i_10_n_0\,
      I5 => \bytesIN_i[9][3]_i_4_n_0\,
      O => \bytesIN_i[9][0]_i_7_n_0\
    );
\bytesIN_i[9][0]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][0]_i_8_n_0\
    );
\bytesIN_i[9][0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000080008000000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_7_0\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg[0][4]_1\,
      I5 => \bytesIN_i_reg[0][4]_0\,
      O => \bytesIN_i[9][0]_i_9_n_0\
    );
\bytesIN_i[9][1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCCCFEEEFEEE"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2__0_n_0\,
      I1 => \bytesIN_i[9][3]_i_3_n_0\,
      I2 => \bytesIN_i[9][3]_i_4_n_0\,
      I3 => \bytesIN_i[9][3]_i_5_n_0\,
      I4 => \bytesIN_i[9][3]_i_6_n_0\,
      I5 => \bytesIN_i[9][7]_i_8_n_0\,
      O => \bytesIN[9]_0\(1)
    );
\bytesIN_i[9][1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][1]_i_2__0_n_0\
    );
\bytesIN_i[9][2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFCFFFE"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2__0_n_0\,
      I1 => \bytesIN_i[9][7]_i_5_n_0\,
      I2 => \bytesIN_i[9][7]_i_6_n_0\,
      I3 => \bytesIN_i[9][7]_i_7_n_0\,
      I4 => \bytesIN_i[9][7]_i_8_n_0\,
      I5 => \bytesIN_i[9][7]_i_9_n_0\,
      O => \bytesIN[9]_0\(2)
    );
\bytesIN_i[9][2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][2]_i_2__0_n_0\
    );
\bytesIN_i[9][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFCCCFEEEFEEE"
    )
        port map (
      I0 => \bytesIN_i[9][3]_i_2_n_0\,
      I1 => \bytesIN_i[9][3]_i_3_n_0\,
      I2 => \bytesIN_i[9][3]_i_4_n_0\,
      I3 => \bytesIN_i[9][3]_i_5_n_0\,
      I4 => \bytesIN_i[9][3]_i_6_n_0\,
      I5 => \bytesIN_i[9][7]_i_8_n_0\,
      O => \bytesIN[9]_0\(3)
    );
\bytesIN_i[9][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][3]_i_2_n_0\
    );
\bytesIN_i[9][3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FB0BF80800000000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][3]_0\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg[0][3]_1\,
      I4 => \bytesIN_i_reg[0][3]_2\,
      I5 => \bytesIN_i[9][7]_i_10_n_0\,
      O => \bytesIN_i[9][3]_i_3_n_0\
    );
\bytesIN_i[9][3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0440"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0][4]_0\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      O => \bytesIN_i[9][3]_i_4_n_0\
    );
\bytesIN_i[9][3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAFC0AFCFA0C0A0C"
    )
        port map (
      I0 => \bytesIN_i_reg[0][3]_6\,
      I1 => \bytesIN_i_reg[0][3]_7\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \bytesIN_i_reg[0][3]_8\,
      I5 => \bytesIN_i_reg[0][3]_9\,
      O => \bytesIN_i[9][3]_i_5_n_0\
    );
\bytesIN_i[9][3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF444F444F444"
    )
        port map (
      I0 => \nByteCount[3]_i_4_n_0\,
      I1 => \bytesIN_i_reg[0][3]_3\,
      I2 => \bytesIN_i[9][7]_i_11_n_0\,
      I3 => \bytesIN_i_reg[0][3]_4\,
      I4 => \bytesIN_i[9][7]_i_12_n_0\,
      I5 => \bytesIN_i_reg[0][3]_5\,
      O => \bytesIN_i[9][3]_i_6_n_0\
    );
\bytesIN_i[9][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => \bytesIN_i[9][4]_i_2_n_0\,
      I1 => \bytesIN_i_reg[0][4]_0\,
      I2 => \bytesIN_i_reg[0][4]_1\,
      O => \bytesIN[9]_0\(4)
    );
\bytesIN_i[9][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][4]_i_2_n_0\
    );
\bytesIN_i[9][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFCFFFE"
    )
        port map (
      I0 => \bytesIN_i[9][5]_i_2_n_0\,
      I1 => \bytesIN_i[9][7]_i_5_n_0\,
      I2 => \bytesIN_i[9][7]_i_6_n_0\,
      I3 => \bytesIN_i[9][7]_i_7_n_0\,
      I4 => \bytesIN_i[9][7]_i_8_n_0\,
      I5 => \bytesIN_i[9][7]_i_9_n_0\,
      O => \bytesIN[9]_0\(5)
    );
\bytesIN_i[9][5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][5]_i_2_n_0\
    );
\bytesIN_i[9][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => \bytesIN_i[9][6]_i_2_n_0\,
      I1 => \bytesIN_i_reg[0][4]_0\,
      I2 => \bytesIN_i_reg[0][4]_1\,
      O => \bytesIN[9]_0\(6)
    );
\bytesIN_i[9][6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][6]_i_2_n_0\
    );
\bytesIN_i[9][7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(1),
      I1 => rdy_t,
      O => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i[9][7]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => \bytesIN_i_reg[0][4]_0\,
      I1 => \bytesIN_i_reg[0][4]_1\,
      I2 => \nByteCount_reg_n_0_[3]\,
      O => \bytesIN_i[9][7]_i_10_n_0\
    );
\bytesIN_i[9][7]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      O => \bytesIN_i[9][7]_i_11_n_0\
    );
\bytesIN_i[9][7]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      O => \bytesIN_i[9][7]_i_12_n_0\
    );
\bytesIN_i[9][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000002000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[9]_8\
    );
\bytesIN_i[9][7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFCFFFE"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_n_0\,
      I1 => \bytesIN_i[9][7]_i_5_n_0\,
      I2 => \bytesIN_i[9][7]_i_6_n_0\,
      I3 => \bytesIN_i[9][7]_i_7_n_0\,
      I4 => \bytesIN_i[9][7]_i_8_n_0\,
      I5 => \bytesIN_i[9][7]_i_9_n_0\,
      O => \bytesIN[9]_0\(7)
    );
\bytesIN_i[9][7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => '0',
      I1 => '0',
      I2 => '1',
      I3 => '1',
      I4 => '1',
      I5 => '1',
      O => \bytesIN_i[9][7]_i_4_n_0\
    );
\bytesIN_i[9][7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FB0BF80800000000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][7]_0\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg[0][7]_1\,
      I4 => \bytesIN_i_reg[0][7]_2\,
      I5 => \bytesIN_i[9][7]_i_10_n_0\,
      O => \bytesIN_i[9][7]_i_5_n_0\
    );
\bytesIN_i[9][7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2800000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i_reg[0][7]_5\,
      I3 => \bytesIN_i_reg[0][7]_6\,
      I4 => \bytesIN_i[9][3]_i_4_n_0\,
      O => \bytesIN_i[9][7]_i_6_n_0\
    );
\bytesIN_i[9][7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"51400000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i_reg[0][7]_3\,
      I3 => \bytesIN_i_reg[0][7]_4\,
      I4 => \bytesIN_i[9][3]_i_4_n_0\,
      O => \bytesIN_i[9][7]_i_7_n_0\
    );
\bytesIN_i[9][7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bytesIN_i_reg[0][4]_1\,
      I1 => \bytesIN_i_reg[0][4]_0\,
      O => \bytesIN_i[9][7]_i_8_n_0\
    );
\bytesIN_i[9][7]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF444F444F444"
    )
        port map (
      I0 => \nByteCount[3]_i_4_n_0\,
      I1 => \bytesIN_i_reg[0][7]_7\,
      I2 => \bytesIN_i[9][7]_i_11_n_0\,
      I3 => \bytesIN_i_reg[0][7]_8\,
      I4 => \bytesIN_i[9][7]_i_12_n_0\,
      I5 => \bytesIN_i_reg[0][7]_9\,
      O => \bytesIN_i[9][7]_i_9_n_0\
    );
\bytesIN_i_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg[0]_11\(0),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg[0]_11\(1),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg[0]_11\(2),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg[0]_11\(3),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg[0]_11\(4),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg[0]_11\(5),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg[0]_11\(6),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0]_3\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg[0]_11\(7),
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[1][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[1][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[1][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[1][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[1][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[1][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[1][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_1\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[1][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[2][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[2][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[2][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[2][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[2][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[2][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[2][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_2\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[2][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[3][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[3][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[3][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[3][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[3][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[3][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[3][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3]_7\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[3][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[4][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[4][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[4][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[4][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[4][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[4][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[4][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4]_6\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[4][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[5][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[5][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[5][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[5][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[5][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[5][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[5][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5]_5\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[5][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[6][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[6][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[6][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[6][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[6][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[6][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[6][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_4\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[6][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[7][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[7][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[7][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[7][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[7][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[7][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[7][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[7][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7]_10\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[7][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[8][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[8][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[8][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[8][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[8][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[8][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[8][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[8][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8]_9\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[8][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[9][0]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[9][1]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[9][2]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[9][3]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[9][4]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[9][5]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[9][6]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i_reg[9][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9]_8\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[9][7]\,
      R => \bytesIN_i[9][7]_i_1_n_0\
    );
followED_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => leadED_reg_n_0,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => followED,
      O => followED_i_1_n_0
    );
followED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => followED_i_1_n_0,
      Q => followED,
      R => '0'
    );
leadED_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => nxByte_t,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => leadED_reg_n_0,
      O => leadED_i_1_n_0
    );
leadED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => leadED_i_1_n_0,
      Q => leadED_reg_n_0,
      R => '0'
    );
lxDone_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => rdy_t,
      I5 => stt(1),
      O => \bytesIN_i[1]_1\
    );
lxDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[1]_1\,
      Q => lxDone_reg_n_0,
      R => '0'
    );
lxFlag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => stt(1),
      I1 => rdy_t,
      I2 => oneByte_reg_0,
      O => byteCountIN_i
    );
lxFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteCountIN_i,
      Q => lxFlag_reg_n_0,
      R => '0'
    );
\nByteCount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCECFCFCFCEC"
    )
        port map (
      I0 => \byteCountIN_i__0\(0),
      I1 => \nByteCount[0]_i_2_n_0\,
      I2 => stt(1),
      I3 => \nByteCount[3]_i_4_n_0\,
      I4 => rdy_t,
      I5 => \nByteCount_reg_n_0_[0]\,
      O => nByteCount(0)
    );
\nByteCount[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0202020000000200"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_8_n_0\,
      I1 => done0,
      I2 => stt(1),
      I3 => uifByteCount(0),
      I4 => srcSel,
      I5 => byteCount(0),
      O => \nByteCount[0]_i_2_n_0\
    );
\nByteCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA00000000AAA8"
    )
        port map (
      I0 => stt(1),
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => rdy_t,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \nByteCount_reg_n_0_[0]\,
      O => nByteCount(1)
    );
\nByteCount[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00AA00AA0000A8"
    )
        port map (
      I0 => stt(1),
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => rdy_t,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => nByteCount(2)
    );
\nByteCount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEFAAEAAAEFAAEFA"
    )
        port map (
      I0 => \nByteCount[3]_i_3_n_0\,
      I1 => oneByte_reg_0,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => \nByteCount[3]_i_4_n_0\,
      I5 => oneByte_reg_n_0,
      O => \nByteCount[3]_i_1_n_0\
    );
\nByteCount[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0A0A0A0A0A008"
    )
        port map (
      I0 => stt(1),
      I1 => rdy_t,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \nByteCount_reg_n_0_[2]\,
      O => nByteCount(3)
    );
\nByteCount[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0FF200020002000"
    )
        port map (
      I0 => \nByteCount[3]_i_5_n_0\,
      I1 => \^startout\,
      I2 => nxByteED,
      I3 => sxFlag_reg_n_0,
      I4 => leadED,
      I5 => TxReady,
      O => \nByteCount[3]_i_3_n_0\
    );
\nByteCount[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      O => \nByteCount[3]_i_4_n_0\
    );
\nByteCount[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F0F0F0F080"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \nByteCount[3]_i_5_n_0\
    );
\nByteCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \nByteCount[3]_i_1_n_0\,
      D => nByteCount(0),
      Q => \nByteCount_reg_n_0_[0]\,
      R => '0'
    );
\nByteCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \nByteCount[3]_i_1_n_0\,
      D => nByteCount(1),
      Q => \nByteCount_reg_n_0_[1]\,
      R => '0'
    );
\nByteCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \nByteCount[3]_i_1_n_0\,
      D => nByteCount(2),
      Q => \nByteCount_reg_n_0_[2]\,
      R => '0'
    );
\nByteCount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \nByteCount[3]_i_1_n_0\,
      D => nByteCount(3),
      Q => \nByteCount_reg_n_0_[3]\,
      R => '0'
    );
nxByteED_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2FFF2000"
    )
        port map (
      I0 => leadED_reg_n_0,
      I1 => followED,
      I2 => rdy_t,
      I3 => stt(1),
      I4 => nxByteED,
      O => nxByteED_i_1_n_0
    );
nxByteED_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => nxByteED_i_1_n_0,
      Q => nxByteED,
      R => '0'
    );
oneByte_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00AA00AAF0F0C0F0"
    )
        port map (
      I0 => oneByte_reg_0,
      I1 => \nByteCount[3]_i_4_n_0\,
      I2 => oneByte_reg_n_0,
      I3 => stt(1),
      I4 => rdy_t,
      I5 => oneByte_i_2_n_0,
      O => oneByte_i_1_n_0
    );
oneByte_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000008000000"
    )
        port map (
      I0 => \byteCountIN_i_reg[0]_0\,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => \bytesIN_i[9][7]_i_8_n_0\,
      I4 => oneByte_reg_0,
      I5 => done0,
      O => oneByte_i_2_n_0
    );
oneByte_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => oneByte_i_1_n_0,
      Q => oneByte_reg_n_0,
      R => '0'
    );
startOUT_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C4F0F000"
    )
        port map (
      I0 => sxFlag_reg_n_0,
      I1 => TxReady,
      I2 => \^startout\,
      I3 => rdy_t,
      I4 => stt(1),
      O => startOUT_t_i_1_n_0
    );
startOUT_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => startOUT_t_i_1_n_0,
      Q => \^startout\,
      R => '0'
    );
sxDone_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF000010000000"
    )
        port map (
      I0 => \byteOUT_t[7]_i_3_n_0\,
      I1 => \^startout\,
      I2 => sxFlag_reg_n_0,
      I3 => rdy_t,
      I4 => stt(1),
      I5 => sxDone_reg_n_0,
      O => sxDone_i_1_n_0
    );
sxDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sxDone_i_1_n_0,
      Q => sxDone_reg_n_0,
      R => '0'
    );
sxFlag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFFFF000000"
    )
        port map (
      I0 => \nByteCount[3]_i_4_n_0\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \^startout\,
      I3 => leadED,
      I4 => TxReady,
      I5 => sxFlag_reg_n_0,
      O => sxFlag_i_1_n_0
    );
sxFlag_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => rdy_t,
      I1 => stt(1),
      O => leadED
    );
sxFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sxFlag_i_1_n_0,
      Q => sxFlag_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity onSeq_S is
  port (
    PRst_OBUF : out STD_LOGIC;
    Vddc_OBUF : out STD_LOGIC;
    rdy_OBUF : out STD_LOGIC;
    byteFlag : out STD_LOGIC;
    byteCount : out STD_LOGIC_VECTOR ( 0 to 0 );
    \OLEDByte[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \byteCount_t_reg[0]_0\ : out STD_LOGIC;
    byteFlag_t_reg_0 : out STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    srcSel : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    sw_IBUF : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC
  );
end onSeq_S;

architecture STRUCTURE of onSeq_S is
  signal \FSM_sequential_stt[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[2]_i_2_n_0\ : STD_LOGIC;
  signal \OLEDByte0_t[0]_i_1_n_0\ : STD_LOGIC;
  signal \^oledbyte[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal OLEDPRst_t : STD_LOGIC;
  signal OLEDPRst_t_i_1_n_0 : STD_LOGIC;
  signal OLEDPRst_t_i_2_n_0 : STD_LOGIC;
  signal OLEDPRst_t_i_3_n_0 : STD_LOGIC;
  signal OLEDRdy_t_i_1_n_0 : STD_LOGIC;
  signal OLEDRdy_t_i_2_n_0 : STD_LOGIC;
  signal OLEDVddc_t_i_1_n_0 : STD_LOGIC;
  signal \^prst_obuf\ : STD_LOGIC;
  signal \^vddc_obuf\ : STD_LOGIC;
  signal \^bytecount\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal byteCount_t : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCount_t[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \^byteflag\ : STD_LOGIC;
  signal byteFlag_t_i_1_n_0 : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 11 downto 1 );
  signal \delay200ms[0]_i_1_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_1_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_2_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_3_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_4_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_5_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_6_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_7_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_8_n_0\ : STD_LOGIC;
  signal \delay200ms[27]_i_9_n_0\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[0]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[10]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[11]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[12]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[13]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[14]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[15]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[16]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[17]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[18]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[19]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[1]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[20]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[21]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[22]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[23]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[24]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[25]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[26]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[27]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[2]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[3]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[4]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[5]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[6]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[7]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[8]\ : STD_LOGIC;
  signal \delay200ms_reg_n_0_[9]\ : STD_LOGIC;
  signal \delay4us[0]_i_1_n_0\ : STD_LOGIC;
  signal \delay4us[11]_i_1_n_0\ : STD_LOGIC;
  signal \delay4us[11]_i_2_n_0\ : STD_LOGIC;
  signal \delay4us[11]_i_4_n_0\ : STD_LOGIC;
  signal \delay4us[11]_i_5_n_0\ : STD_LOGIC;
  signal \delay4us[11]_i_6_n_0\ : STD_LOGIC;
  signal \delay4us_reg[11]_i_3_n_2\ : STD_LOGIC;
  signal \delay4us_reg[11]_i_3_n_3\ : STD_LOGIC;
  signal \delay4us_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \delay4us_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \delay4us_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \delay4us_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \delay4us_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \delay4us_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \delay4us_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \delay4us_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[0]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[10]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[11]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[1]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[2]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[3]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[4]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[5]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[6]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[7]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[8]\ : STD_LOGIC;
  signal \delay4us_reg_n_0_[9]\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__1_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__2_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__3_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__5_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__5_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__5_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__5_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__5_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal powerOff : STD_LOGIC;
  signal powerOff_i_1_n_0 : STD_LOGIC;
  signal powerOff_reg_n_0 : STD_LOGIC;
  signal powerOn : STD_LOGIC;
  signal powerOn0 : STD_LOGIC;
  signal powerOn_i_1_n_0 : STD_LOGIC;
  signal powerOn_i_3_n_0 : STD_LOGIC;
  signal powerOn_i_4_n_0 : STD_LOGIC;
  signal powerOn_reg_n_0 : STD_LOGIC;
  signal \^rdy_obuf\ : STD_LOGIC;
  signal rstDone_i_1_n_0 : STD_LOGIC;
  signal rstDone_reg_n_0 : STD_LOGIC;
  signal running : STD_LOGIC;
  signal running_i_2_n_0 : STD_LOGIC;
  signal running_i_4_n_0 : STD_LOGIC;
  signal running_i_5_n_0 : STD_LOGIC;
  signal running_i_6_n_0 : STD_LOGIC;
  signal running_i_7_n_0 : STD_LOGIC;
  signal running_i_8_n_0 : STD_LOGIC;
  signal running_reg_n_0 : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \stt__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_delay4us_reg[11]_i_3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_delay4us_reg[11]_i_3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_plusOp_inferred__0/i__carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_inferred__0/i__carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_stt[0]_i_2__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \FSM_sequential_stt[3]_i_1\ : label is "soft_lutpair18";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[2]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[3]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute SOFT_HLUTNM of \OLEDByte0_t[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of OLEDPRst_t_i_2 : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of OLEDPRst_t_i_3 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of OLEDRdy_t_i_2 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \byteCount_t[0]_i_1__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of byteFlag_t_i_1 : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \delay200ms[27]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \delay200ms[27]_i_4\ : label is "soft_lutpair20";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \delay4us_reg[11]_i_3\ : label is 35;
  attribute ADDER_THRESHOLD of \delay4us_reg[4]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \delay4us_reg[8]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__4\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__5\ : label is 35;
  attribute SOFT_HLUTNM of powerOff_i_2 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of powerOn_i_2 : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of powerOn_i_3 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of rstDone_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of running_i_3 : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of running_i_5 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of running_i_7 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of running_i_8 : label is "soft_lutpair19";
begin
  \OLEDByte[0]\(0) <= \^oledbyte[0]\(0);
  PRst_OBUF <= \^prst_obuf\;
  Vddc_OBUF <= \^vddc_obuf\;
  byteCount(0) <= \^bytecount\(0);
  byteFlag <= \^byteflag\;
  rdy_OBUF <= \^rdy_obuf\;
\FSM_sequential_stt[0]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF40EA"
    )
        port map (
      I0 => stt(3),
      I1 => byteCount_t(0),
      I2 => \FSM_sequential_stt[0]_i_2__0_n_0\,
      I3 => \^rdy_obuf\,
      I4 => \FSM_sequential_stt[0]_i_3_n_0\,
      I5 => \FSM_sequential_stt[0]_i_4_n_0\,
      O => \stt__0\(0)
    );
\FSM_sequential_stt[0]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => stt(0),
      I1 => OLEDPRst_t,
      O => \FSM_sequential_stt[0]_i_2__0_n_0\
    );
\FSM_sequential_stt[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00020002000200C2"
    )
        port map (
      I0 => rstDone_reg_n_0,
      I1 => stt(0),
      I2 => OLEDPRst_t,
      I3 => stt(3),
      I4 => byteCount_t(0),
      I5 => \^vddc_obuf\,
      O => \FSM_sequential_stt[0]_i_3_n_0\
    );
\FSM_sequential_stt[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000003AA00"
    )
        port map (
      I0 => \^prst_obuf\,
      I1 => powerOn_reg_n_0,
      I2 => powerOff_reg_n_0,
      I3 => OLEDPRst_t,
      I4 => stt(0),
      I5 => stt(3),
      O => \FSM_sequential_stt[0]_i_4_n_0\
    );
\FSM_sequential_stt[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000322FF00"
    )
        port map (
      I0 => \FSM_sequential_stt[1]_i_2_n_0\,
      I1 => byteCount_t(0),
      I2 => \^vddc_obuf\,
      I3 => OLEDPRst_t,
      I4 => stt(0),
      I5 => stt(3),
      O => \stt__0\(1)
    );
\FSM_sequential_stt[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => powerOn_reg_n_0,
      I1 => powerOff_reg_n_0,
      O => \FSM_sequential_stt[1]_i_2_n_0\
    );
\FSM_sequential_stt[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAABFFAAAA"
    )
        port map (
      I0 => \FSM_sequential_stt[2]_i_2_n_0\,
      I1 => OLEDPRst_t,
      I2 => \^rdy_obuf\,
      I3 => stt(0),
      I4 => byteCount_t(0),
      I5 => stt(3),
      O => \stt__0\(2)
    );
\FSM_sequential_stt[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080008000B00080"
    )
        port map (
      I0 => \^vddc_obuf\,
      I1 => OLEDPRst_t,
      I2 => stt(0),
      I3 => OLEDPRst_t_i_2_n_0,
      I4 => powerOff_reg_n_0,
      I5 => powerOn_reg_n_0,
      O => \FSM_sequential_stt[2]_i_2_n_0\
    );
\FSM_sequential_stt[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAC000"
    )
        port map (
      I0 => \^rdy_obuf\,
      I1 => stt(0),
      I2 => OLEDPRst_t,
      I3 => byteCount_t(0),
      I4 => stt(3),
      O => \stt__0\(3)
    );
\FSM_sequential_stt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(0),
      Q => stt(0),
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(1),
      Q => OLEDPRst_t,
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(2),
      Q => byteCount_t(0),
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(3),
      Q => stt(3),
      R => rst_IBUF
    );
\OLEDByte0_t[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFDE0010"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(0),
      I2 => byteCount_t(0),
      I3 => stt(3),
      I4 => \^oledbyte[0]\(0),
      O => \OLEDByte0_t[0]_i_1_n_0\
    );
\OLEDByte0_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \OLEDByte0_t[0]_i_1_n_0\,
      Q => \^oledbyte[0]\(0),
      R => '0'
    );
OLEDPRst_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFCFFFFF00040004"
    )
        port map (
      I0 => \delay4us[11]_i_4_n_0\,
      I1 => OLEDPRst_t,
      I2 => stt(0),
      I3 => OLEDPRst_t_i_2_n_0,
      I4 => OLEDPRst_t_i_3_n_0,
      I5 => \^prst_obuf\,
      O => OLEDPRst_t_i_1_n_0
    );
OLEDPRst_t_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(3),
      O => OLEDPRst_t_i_2_n_0
    );
OLEDPRst_t_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => sw_IBUF,
      I1 => running_reg_n_0,
      O => OLEDPRst_t_i_3_n_0
    );
OLEDPRst_t_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => OLEDPRst_t_i_1_n_0,
      Q => \^prst_obuf\,
      S => powerOn0
    );
OLEDRdy_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0FFFB00000008"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => OLEDRdy_t_i_2_n_0,
      I2 => running_i_4_n_0,
      I3 => \delay200ms[27]_i_5_n_0\,
      I4 => stt(3),
      I5 => \^rdy_obuf\,
      O => OLEDRdy_t_i_1_n_0
    );
OLEDRdy_t_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"09"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      I2 => OLEDPRst_t,
      O => OLEDRdy_t_i_2_n_0
    );
OLEDRdy_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => OLEDRdy_t_i_1_n_0,
      Q => \^rdy_obuf\,
      R => powerOn0
    );
OLEDVddc_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FEF7FE00000008"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(0),
      I2 => stt(3),
      I3 => byteCount_t(0),
      I4 => \delay4us[11]_i_4_n_0\,
      I5 => \^vddc_obuf\,
      O => OLEDVddc_t_i_1_n_0
    );
OLEDVddc_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => OLEDVddc_t_i_1_n_0,
      Q => \^vddc_obuf\,
      R => '0'
    );
\byteCountIN_i[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^bytecount\(0),
      I1 => srcSel,
      I2 => uifByteCount(0),
      O => \byteCount_t_reg[0]_0\
    );
\byteCount_t[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0030"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(0),
      I2 => byteCount_t(0),
      I3 => stt(3),
      I4 => \^bytecount\(0),
      O => \byteCount_t[0]_i_1__0_n_0\
    );
\byteCount_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCount_t[0]_i_1__0_n_0\,
      Q => \^bytecount\(0),
      R => '0'
    );
byteFlag_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00F70022"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      I2 => OLEDPRst_t,
      I3 => stt(3),
      I4 => \^byteflag\,
      O => byteFlag_t_i_1_n_0
    );
byteFlag_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteFlag_t_i_1_n_0,
      Q => \^byteflag\,
      R => '0'
    );
\delay200ms[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5510AAEA"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => byteCount_t(0),
      I3 => OLEDPRst_t,
      I4 => \delay200ms_reg_n_0_[0]\,
      O => \delay200ms[0]_i_1_n_0\
    );
\delay200ms[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02020202020202AA"
    )
        port map (
      I0 => \delay200ms[27]_i_2_n_0\,
      I1 => byteCount_t(0),
      I2 => stt(3),
      I3 => \delay200ms[27]_i_3_n_0\,
      I4 => \delay200ms[27]_i_4_n_0\,
      I5 => \delay200ms[27]_i_5_n_0\,
      O => \delay200ms[27]_i_1_n_0\
    );
\delay200ms[27]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAEF"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => byteCount_t(0),
      I3 => OLEDPRst_t,
      O => \delay200ms[27]_i_2_n_0\
    );
\delay200ms[27]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFEFF"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[14]\,
      I1 => \delay200ms_reg_n_0_[15]\,
      I2 => \delay200ms_reg_n_0_[12]\,
      I3 => \delay200ms_reg_n_0_[13]\,
      I4 => \delay200ms[27]_i_6_n_0\,
      O => \delay200ms[27]_i_3_n_0\
    );
\delay200ms[27]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[6]\,
      I1 => \delay200ms_reg_n_0_[7]\,
      I2 => \delay200ms_reg_n_0_[4]\,
      I3 => \delay200ms_reg_n_0_[5]\,
      I4 => \delay200ms[27]_i_7_n_0\,
      O => \delay200ms[27]_i_4_n_0\
    );
\delay200ms[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFBF"
    )
        port map (
      I0 => \delay200ms[27]_i_8_n_0\,
      I1 => \delay200ms_reg_n_0_[21]\,
      I2 => \delay200ms_reg_n_0_[20]\,
      I3 => \delay200ms_reg_n_0_[23]\,
      I4 => \delay200ms_reg_n_0_[22]\,
      I5 => \delay200ms[27]_i_9_n_0\,
      O => \delay200ms[27]_i_5_n_0\
    );
\delay200ms[27]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[16]\,
      I1 => \delay200ms_reg_n_0_[17]\,
      I2 => \delay200ms_reg_n_0_[19]\,
      I3 => \delay200ms_reg_n_0_[18]\,
      O => \delay200ms[27]_i_6_n_0\
    );
\delay200ms[27]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[9]\,
      I1 => \delay200ms_reg_n_0_[8]\,
      I2 => \delay200ms_reg_n_0_[11]\,
      I3 => \delay200ms_reg_n_0_[10]\,
      O => \delay200ms[27]_i_7_n_0\
    );
\delay200ms[27]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[24]\,
      I1 => \delay200ms_reg_n_0_[25]\,
      I2 => \delay200ms_reg_n_0_[27]\,
      I3 => \delay200ms_reg_n_0_[26]\,
      O => \delay200ms[27]_i_8_n_0\
    );
\delay200ms[27]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[1]\,
      I1 => \delay200ms_reg_n_0_[0]\,
      I2 => \delay200ms_reg_n_0_[3]\,
      I3 => \delay200ms_reg_n_0_[2]\,
      O => \delay200ms[27]_i_9_n_0\
    );
\delay200ms_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \delay200ms[0]_i_1_n_0\,
      Q => \delay200ms_reg_n_0_[0]\,
      R => '0'
    );
\delay200ms_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_6\,
      Q => \delay200ms_reg_n_0_[10]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_5\,
      Q => \delay200ms_reg_n_0_[11]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_4\,
      Q => \delay200ms_reg_n_0_[12]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_7\,
      Q => \delay200ms_reg_n_0_[13]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_6\,
      Q => \delay200ms_reg_n_0_[14]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_5\,
      Q => \delay200ms_reg_n_0_[15]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_4\,
      Q => \delay200ms_reg_n_0_[16]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_7\,
      Q => \delay200ms_reg_n_0_[17]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_6\,
      Q => \delay200ms_reg_n_0_[18]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_5\,
      Q => \delay200ms_reg_n_0_[19]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_7\,
      Q => \delay200ms_reg_n_0_[1]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_4\,
      Q => \delay200ms_reg_n_0_[20]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_7\,
      Q => \delay200ms_reg_n_0_[21]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_6\,
      Q => \delay200ms_reg_n_0_[22]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_5\,
      Q => \delay200ms_reg_n_0_[23]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_4\,
      Q => \delay200ms_reg_n_0_[24]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__5_n_7\,
      Q => \delay200ms_reg_n_0_[25]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__5_n_6\,
      Q => \delay200ms_reg_n_0_[26]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__5_n_5\,
      Q => \delay200ms_reg_n_0_[27]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_6\,
      Q => \delay200ms_reg_n_0_[2]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_5\,
      Q => \delay200ms_reg_n_0_[3]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_4\,
      Q => \delay200ms_reg_n_0_[4]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_7\,
      Q => \delay200ms_reg_n_0_[5]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_6\,
      Q => \delay200ms_reg_n_0_[6]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_5\,
      Q => \delay200ms_reg_n_0_[7]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_4\,
      Q => \delay200ms_reg_n_0_[8]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay200ms_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay200ms[27]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_7\,
      Q => \delay200ms_reg_n_0_[9]\,
      R => \delay200ms[27]_i_1_n_0\
    );
\delay4us[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FC02"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(3),
      I2 => byteCount_t(0),
      I3 => \delay4us_reg_n_0_[0]\,
      O => \delay4us[0]_i_1_n_0\
    );
\delay4us[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0007"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => \delay4us[11]_i_4_n_0\,
      I2 => stt(3),
      I3 => byteCount_t(0),
      O => \delay4us[11]_i_1_n_0\
    );
\delay4us[11]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(3),
      I1 => byteCount_t(0),
      O => \delay4us[11]_i_2_n_0\
    );
\delay4us[11]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => \delay4us[11]_i_5_n_0\,
      I1 => \delay4us_reg_n_0_[5]\,
      I2 => \delay4us_reg_n_0_[4]\,
      I3 => \delay4us_reg_n_0_[7]\,
      I4 => \delay4us_reg_n_0_[6]\,
      I5 => \delay4us[11]_i_6_n_0\,
      O => \delay4us[11]_i_4_n_0\
    );
\delay4us[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \delay4us_reg_n_0_[8]\,
      I1 => \delay4us_reg_n_0_[9]\,
      I2 => \delay4us_reg_n_0_[11]\,
      I3 => \delay4us_reg_n_0_[10]\,
      O => \delay4us[11]_i_5_n_0\
    );
\delay4us[11]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \delay4us_reg_n_0_[1]\,
      I1 => \delay4us_reg_n_0_[0]\,
      I2 => \delay4us_reg_n_0_[3]\,
      I3 => \delay4us_reg_n_0_[2]\,
      O => \delay4us[11]_i_6_n_0\
    );
\delay4us_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \delay4us[0]_i_1_n_0\,
      Q => \delay4us_reg_n_0_[0]\,
      R => '0'
    );
\delay4us_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(10),
      Q => \delay4us_reg_n_0_[10]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(11),
      Q => \delay4us_reg_n_0_[11]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[11]_i_3\: unisim.vcomponents.CARRY4
     port map (
      CI => \delay4us_reg[8]_i_1_n_0\,
      CO(3 downto 2) => \NLW_delay4us_reg[11]_i_3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \delay4us_reg[11]_i_3_n_2\,
      CO(0) => \delay4us_reg[11]_i_3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_delay4us_reg[11]_i_3_O_UNCONNECTED\(3),
      O(2 downto 0) => data0(11 downto 9),
      S(3) => '0',
      S(2) => \delay4us_reg_n_0_[11]\,
      S(1) => \delay4us_reg_n_0_[10]\,
      S(0) => \delay4us_reg_n_0_[9]\
    );
\delay4us_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(1),
      Q => \delay4us_reg_n_0_[1]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(2),
      Q => \delay4us_reg_n_0_[2]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(3),
      Q => \delay4us_reg_n_0_[3]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(4),
      Q => \delay4us_reg_n_0_[4]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \delay4us_reg[4]_i_1_n_0\,
      CO(2) => \delay4us_reg[4]_i_1_n_1\,
      CO(1) => \delay4us_reg[4]_i_1_n_2\,
      CO(0) => \delay4us_reg[4]_i_1_n_3\,
      CYINIT => \delay4us_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3) => \delay4us_reg_n_0_[4]\,
      S(2) => \delay4us_reg_n_0_[3]\,
      S(1) => \delay4us_reg_n_0_[2]\,
      S(0) => \delay4us_reg_n_0_[1]\
    );
\delay4us_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(5),
      Q => \delay4us_reg_n_0_[5]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(6),
      Q => \delay4us_reg_n_0_[6]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(7),
      Q => \delay4us_reg_n_0_[7]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(8),
      Q => \delay4us_reg_n_0_[8]\,
      R => \delay4us[11]_i_1_n_0\
    );
\delay4us_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \delay4us_reg[4]_i_1_n_0\,
      CO(3) => \delay4us_reg[8]_i_1_n_0\,
      CO(2) => \delay4us_reg[8]_i_1_n_1\,
      CO(1) => \delay4us_reg[8]_i_1_n_2\,
      CO(0) => \delay4us_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3) => \delay4us_reg_n_0_[8]\,
      S(2) => \delay4us_reg_n_0_[7]\,
      S(1) => \delay4us_reg_n_0_[6]\,
      S(0) => \delay4us_reg_n_0_[5]\
    );
\delay4us_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay4us[11]_i_2_n_0\,
      D => data0(9),
      Q => \delay4us_reg_n_0_[9]\,
      R => \delay4us[11]_i_1_n_0\
    );
\plusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \plusOp_inferred__0/i__carry_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry_n_3\,
      CYINIT => \delay200ms_reg_n_0_[0]\,
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry_n_4\,
      O(2) => \plusOp_inferred__0/i__carry_n_5\,
      O(1) => \plusOp_inferred__0/i__carry_n_6\,
      O(0) => \plusOp_inferred__0/i__carry_n_7\,
      S(3) => \delay200ms_reg_n_0_[4]\,
      S(2) => \delay200ms_reg_n_0_[3]\,
      S(1) => \delay200ms_reg_n_0_[2]\,
      S(0) => \delay200ms_reg_n_0_[1]\
    );
\plusOp_inferred__0/i__carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry_n_0\,
      CO(3) => \plusOp_inferred__0/i__carry__0_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry__0_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry__0_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry__0_n_4\,
      O(2) => \plusOp_inferred__0/i__carry__0_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__0_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__0_n_7\,
      S(3) => \delay200ms_reg_n_0_[8]\,
      S(2) => \delay200ms_reg_n_0_[7]\,
      S(1) => \delay200ms_reg_n_0_[6]\,
      S(0) => \delay200ms_reg_n_0_[5]\
    );
\plusOp_inferred__0/i__carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__0_n_0\,
      CO(3) => \plusOp_inferred__0/i__carry__1_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry__1_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry__1_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry__1_n_4\,
      O(2) => \plusOp_inferred__0/i__carry__1_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__1_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__1_n_7\,
      S(3) => \delay200ms_reg_n_0_[12]\,
      S(2) => \delay200ms_reg_n_0_[11]\,
      S(1) => \delay200ms_reg_n_0_[10]\,
      S(0) => \delay200ms_reg_n_0_[9]\
    );
\plusOp_inferred__0/i__carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__1_n_0\,
      CO(3) => \plusOp_inferred__0/i__carry__2_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry__2_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry__2_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry__2_n_4\,
      O(2) => \plusOp_inferred__0/i__carry__2_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__2_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__2_n_7\,
      S(3) => \delay200ms_reg_n_0_[16]\,
      S(2) => \delay200ms_reg_n_0_[15]\,
      S(1) => \delay200ms_reg_n_0_[14]\,
      S(0) => \delay200ms_reg_n_0_[13]\
    );
\plusOp_inferred__0/i__carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__2_n_0\,
      CO(3) => \plusOp_inferred__0/i__carry__3_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry__3_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry__3_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry__3_n_4\,
      O(2) => \plusOp_inferred__0/i__carry__3_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__3_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__3_n_7\,
      S(3) => \delay200ms_reg_n_0_[20]\,
      S(2) => \delay200ms_reg_n_0_[19]\,
      S(1) => \delay200ms_reg_n_0_[18]\,
      S(0) => \delay200ms_reg_n_0_[17]\
    );
\plusOp_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__3_n_0\,
      CO(3) => \plusOp_inferred__0/i__carry__4_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry__4_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry__4_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry__4_n_4\,
      O(2) => \plusOp_inferred__0/i__carry__4_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__4_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__4_n_7\,
      S(3) => \delay200ms_reg_n_0_[24]\,
      S(2) => \delay200ms_reg_n_0_[23]\,
      S(1) => \delay200ms_reg_n_0_[22]\,
      S(0) => \delay200ms_reg_n_0_[21]\
    );
\plusOp_inferred__0/i__carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__4_n_0\,
      CO(3 downto 2) => \NLW_plusOp_inferred__0/i__carry__5_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_inferred__0/i__carry__5_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__5_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_inferred__0/i__carry__5_O_UNCONNECTED\(3),
      O(2) => \plusOp_inferred__0/i__carry__5_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__5_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__5_n_7\,
      S(3) => '0',
      S(2) => \delay200ms_reg_n_0_[27]\,
      S(1) => \delay200ms_reg_n_0_[26]\,
      S(0) => \delay200ms_reg_n_0_[25]\
    );
powerOff_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFEFFAAAA0200"
    )
        port map (
      I0 => powerOff,
      I1 => running_i_4_n_0,
      I2 => \delay200ms[27]_i_5_n_0\,
      I3 => running_i_5_n_0,
      I4 => powerOn_i_4_n_0,
      I5 => powerOff_reg_n_0,
      O => powerOff_i_1_n_0
    );
powerOff_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => sw_IBUF,
      I3 => running_reg_n_0,
      O => powerOff
    );
powerOff_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => powerOff_i_1_n_0,
      Q => powerOff_reg_n_0,
      R => powerOn0
    );
powerOn_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFEFFAAAA0200"
    )
        port map (
      I0 => powerOn,
      I1 => running_i_4_n_0,
      I2 => \delay200ms[27]_i_5_n_0\,
      I3 => powerOn_i_3_n_0,
      I4 => powerOn_i_4_n_0,
      I5 => powerOn_reg_n_0,
      O => powerOn_i_1_n_0
    );
powerOn_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => running_reg_n_0,
      I1 => sw_IBUF,
      I2 => byteCount_t(0),
      O => powerOn
    );
powerOn_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(0),
      I2 => stt(3),
      I3 => byteCount_t(0),
      O => powerOn_i_3_n_0
    );
powerOn_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000060000"
    )
        port map (
      I0 => running_reg_n_0,
      I1 => sw_IBUF,
      I2 => byteCount_t(0),
      I3 => stt(3),
      I4 => stt(0),
      I5 => OLEDPRst_t,
      O => powerOn_i_4_n_0
    );
powerOn_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => powerOn_i_1_n_0,
      Q => powerOn_reg_n_0,
      R => powerOn0
    );
rstDone_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0001"
    )
        port map (
      I0 => stt(0),
      I1 => stt(3),
      I2 => byteCount_t(0),
      I3 => OLEDPRst_t,
      I4 => rstDone_reg_n_0,
      O => rstDone_i_1_n_0
    );
rstDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => rstDone_i_1_n_0,
      Q => rstDone_reg_n_0,
      R => '0'
    );
running_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => OLEDPRst_t,
      I1 => stt(0),
      I2 => stt(3),
      I3 => byteCount_t(0),
      O => powerOn0
    );
running_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAFEFFAAAA0200"
    )
        port map (
      I0 => running,
      I1 => running_i_4_n_0,
      I2 => \delay200ms[27]_i_5_n_0\,
      I3 => running_i_5_n_0,
      I4 => running_i_6_n_0,
      I5 => running_reg_n_0,
      O => running_i_2_n_0
    );
running_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => running_reg_n_0,
      I3 => sw_IBUF,
      O => running
    );
running_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \delay200ms[27]_i_7_n_0\,
      I1 => running_i_7_n_0,
      I2 => \delay200ms[27]_i_6_n_0\,
      I3 => running_i_8_n_0,
      O => running_i_4_n_0
    );
running_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF01"
    )
        port map (
      I0 => stt(0),
      I1 => OLEDPRst_t,
      I2 => byteCount_t(0),
      I3 => stt(3),
      O => running_i_5_n_0
    );
running_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => running_reg_n_0,
      I1 => sw_IBUF,
      I2 => byteCount_t(0),
      I3 => stt(3),
      I4 => stt(0),
      I5 => OLEDPRst_t,
      O => running_i_6_n_0
    );
running_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[5]\,
      I1 => \delay200ms_reg_n_0_[4]\,
      I2 => \delay200ms_reg_n_0_[7]\,
      I3 => \delay200ms_reg_n_0_[6]\,
      O => running_i_7_n_0
    );
running_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \delay200ms_reg_n_0_[13]\,
      I1 => \delay200ms_reg_n_0_[12]\,
      I2 => \delay200ms_reg_n_0_[15]\,
      I3 => \delay200ms_reg_n_0_[14]\,
      O => running_i_8_n_0
    );
running_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => running_i_2_n_0,
      Q => running_reg_n_0,
      R => powerOn0
    );
srcSel_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AE"
    )
        port map (
      I0 => \^byteflag\,
      I1 => srcSel,
      I2 => \^rdy_obuf\,
      I3 => rst_IBUF,
      O => byteFlag_t_reg_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sclk_s is
  port (
    CLK : out STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC
  );
end sclk_s;

architecture STRUCTURE of sclk_s is
  signal \^clk\ : STD_LOGIC;
  signal clk_7p1MHz_t_i_1_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \counter[3]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \counter[3]_i_3\ : label is "soft_lutpair29";
begin
  CLK <= \^clk\;
clk_7p1MHz_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => counter(1),
      I1 => counter(2),
      I2 => counter(0),
      I3 => counter(3),
      I4 => \^clk\,
      O => clk_7p1MHz_t_i_1_n_0
    );
clk_7p1MHz_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => clk_7p1MHz_t_i_1_n_0,
      Q => \^clk\,
      R => rst_IBUF
    );
\counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter(0),
      O => plusOp(0)
    );
\counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      O => plusOp(1)
    );
\counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => counter(0),
      I1 => counter(1),
      I2 => counter(2),
      O => plusOp(2)
    );
\counter[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00001000"
    )
        port map (
      I0 => counter(0),
      I1 => counter(3),
      I2 => counter(2),
      I3 => counter(1),
      I4 => rst_IBUF,
      O => \counter[3]_i_1_n_0\
    );
\counter[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_IBUF,
      O => p_0_in
    );
\counter[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => counter(1),
      I1 => counter(0),
      I2 => counter(2),
      I3 => counter(3),
      O => plusOp(3)
    );
\counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => p_0_in,
      D => plusOp(0),
      Q => counter(0),
      R => \counter[3]_i_1_n_0\
    );
\counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => p_0_in,
      D => plusOp(1),
      Q => counter(1),
      R => \counter[3]_i_1_n_0\
    );
\counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => p_0_in,
      D => plusOp(2),
      Q => counter(2),
      R => \counter[3]_i_1_n_0\
    );
\counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => p_0_in,
      D => plusOp(3),
      Q => counter(3),
      R => \counter[3]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity userIF_s is
  port (
    byteFlag_w : out STD_LOGIC;
    uifByteCount : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    sw0_IBUF : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC
  );
end userIF_s;

architecture STRUCTURE of userIF_s is
  signal byteCount_t : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCount_t[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteFlag_t_i_1__0_n_0\ : STD_LOGIC;
  signal \^byteflag_w\ : STD_LOGIC;
  signal fdoDone : STD_LOGIC;
  signal fdoDone_reg_n_0 : STD_LOGIC;
  signal fdoFlag : STD_LOGIC;
  signal fdoFlag_reg_n_0 : STD_LOGIC;
  signal rstDone : STD_LOGIC;
  signal \rstDone_i_1__0_n_0\ : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \stt__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^uifbytecount\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "rststt:00,disponfull:10,iSTATE:11,idle:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "rststt:00,disponfull:10,iSTATE:11,idle:01";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \byteCount_t[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of fdoDone_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of fdoFlag_i_1 : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \rstDone_i_1__0\ : label is "soft_lutpair28";
begin
  byteFlag_w <= \^byteflag_w\;
  uifByteCount(0) <= \^uifbytecount\(0);
\FSM_sequential_stt[0]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FA0CFAFC"
    )
        port map (
      I0 => \^byteflag_w\,
      I1 => rstDone,
      I2 => stt(0),
      I3 => byteCount_t(0),
      I4 => fdoFlag_reg_n_0,
      O => \stt__0\(0)
    );
\FSM_sequential_stt[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5F88"
    )
        port map (
      I0 => stt(0),
      I1 => fdoFlag_reg_n_0,
      I2 => fdoDone_reg_n_0,
      I3 => byteCount_t(0),
      O => \stt__0\(1)
    );
\FSM_sequential_stt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(0),
      Q => stt(0),
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \stt__0\(1),
      Q => byteCount_t(0),
      R => rst_IBUF
    );
\byteCount_t[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^uifbytecount\(0),
      I1 => stt(0),
      I2 => byteCount_t(0),
      O => \byteCount_t[0]_i_1_n_0\
    );
\byteCount_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCount_t[0]_i_1_n_0\,
      Q => \^uifbytecount\(0),
      R => '0'
    );
\byteFlag_t_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      O => \byteFlag_t_i_1__0_n_0\
    );
byteFlag_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteFlag_t_i_1__0_n_0\,
      Q => \^byteflag_w\,
      R => '0'
    );
fdoDone_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      I2 => sw0_IBUF,
      O => fdoDone
    );
fdoDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => fdoDone,
      Q => fdoDone_reg_n_0,
      R => '0'
    );
fdoFlag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      I2 => sw0_IBUF,
      O => fdoFlag
    );
fdoFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => fdoFlag,
      Q => fdoFlag_reg_n_0,
      R => '0'
    );
\rstDone_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(0),
      I1 => byteCount_t(0),
      O => \rstDone_i_1__0_n_0\
    );
rstDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \rstDone_i_1__0_n_0\,
      Q => rstDone,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity OLEDCtrl_s is
  port (
    CS_OBUF : out STD_LOGIC;
    MOSI_OBUF : out STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    CLK : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    srcSel : in STD_LOGIC;
    byteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    \byteCountIN_i_reg[0]\ : in STD_LOGIC;
    \OLEDByte[0]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    byteFlag : in STD_LOGIC;
    byteFlag_w : in STD_LOGIC
  );
end OLEDCtrl_s;

architecture STRUCTURE of OLEDCtrl_s is
  signal L : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \LxCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[0]_i_2_n_0\ : STD_LOGIC;
  signal \LxCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[3]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[3]_i_2_n_0\ : STD_LOGIC;
  signal TxReady : STD_LOGIC;
  signal byteCountOUT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteFlag_w__0_n_0\ : STD_LOGIC;
  signal byteFlag_w_i_1_n_0 : STD_LOGIC;
  signal byteOUT_t : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \byteSel[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteSel[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteSel_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteSel_reg_n_0_[1]\ : STD_LOGIC;
  signal \bytesIN_i[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[0][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[1][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[1][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[2][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[2][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[2][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[3][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[3][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[3][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[4][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[4][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[4][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[5][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[5][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[5][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[7][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[7][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[7][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[8][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[8][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[8][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_2__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[3][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[4][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[5][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[6][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[7][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[8][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[9][2]\ : STD_LOGIC;
  signal done0 : STD_LOGIC;
  signal nxByte_t : STD_LOGIC;
  signal startOUT : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[0]\ : label is "rststt:001,iSTATE:100,idle:010";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \LxCount[0]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \LxCount[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \LxCount[3]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bytesIN_i[9][1]_i_2\ : label is "soft_lutpair16";
begin
BB0: entity work.byteBuffer_s
     port map (
      Q(7 downto 0) => byteOUT_t(7 downto 0),
      TxReady => TxReady,
      byteCount(0) => byteCount(0),
      \byteCountIN_i_reg[0]_0\ => \byteCountIN_i_reg[0]\,
      byteCountOUT(0) => byteCountOUT(0),
      \bytesIN_i[9][0]_i_7_0\ => \bytesIN_i_reg_n_0_[8][0]\,
      \bytesIN_i[9][0]_i_7_1\ => \bytesIN_i_reg_n_0_[3][0]\,
      \bytesIN_i_reg[0][0]_0\ => \bytesIN_i_reg_n_0_[0][0]\,
      \bytesIN_i_reg[0][0]_1\ => \bytesIN_i_reg_n_0_[1][0]\,
      \bytesIN_i_reg[0][0]_2\ => \bytesIN_i_reg_n_0_[2][0]\,
      \bytesIN_i_reg[0][0]_3\ => \bytesIN_i_reg_n_0_[7][0]\,
      \bytesIN_i_reg[0][0]_4\ => \bytesIN_i_reg_n_0_[6][0]\,
      \bytesIN_i_reg[0][0]_5\ => \bytesIN_i_reg_n_0_[9][0]\,
      \bytesIN_i_reg[0][0]_6\ => \bytesIN_i_reg_n_0_[4][0]\,
      \bytesIN_i_reg[0][0]_7\ => \bytesIN_i_reg_n_0_[5][0]\,
      \bytesIN_i_reg[0][3]_0\ => \bytesIN_i_reg_n_0_[8][1]\,
      \bytesIN_i_reg[0][3]_1\ => \bytesIN_i_reg_n_0_[9][1]\,
      \bytesIN_i_reg[0][3]_2\ => \bytesIN_i_reg_n_0_[7][1]\,
      \bytesIN_i_reg[0][3]_3\ => \bytesIN_i_reg_n_0_[0][1]\,
      \bytesIN_i_reg[0][3]_4\ => \bytesIN_i_reg_n_0_[2][1]\,
      \bytesIN_i_reg[0][3]_5\ => \bytesIN_i_reg_n_0_[1][1]\,
      \bytesIN_i_reg[0][3]_6\ => \bytesIN_i_reg_n_0_[4][1]\,
      \bytesIN_i_reg[0][3]_7\ => \bytesIN_i_reg_n_0_[3][1]\,
      \bytesIN_i_reg[0][3]_8\ => \bytesIN_i_reg_n_0_[6][1]\,
      \bytesIN_i_reg[0][3]_9\ => \bytesIN_i_reg_n_0_[5][1]\,
      \bytesIN_i_reg[0][4]_0\ => \byteSel_reg_n_0_[1]\,
      \bytesIN_i_reg[0][4]_1\ => \byteSel_reg_n_0_[0]\,
      \bytesIN_i_reg[0][7]_0\ => \bytesIN_i_reg_n_0_[8][2]\,
      \bytesIN_i_reg[0][7]_1\ => \bytesIN_i_reg_n_0_[9][2]\,
      \bytesIN_i_reg[0][7]_2\ => \bytesIN_i_reg_n_0_[7][2]\,
      \bytesIN_i_reg[0][7]_3\ => \bytesIN_i_reg_n_0_[4][2]\,
      \bytesIN_i_reg[0][7]_4\ => \bytesIN_i_reg_n_0_[3][2]\,
      \bytesIN_i_reg[0][7]_5\ => \bytesIN_i_reg_n_0_[6][2]\,
      \bytesIN_i_reg[0][7]_6\ => \bytesIN_i_reg_n_0_[5][2]\,
      \bytesIN_i_reg[0][7]_7\ => \bytesIN_i_reg_n_0_[0][2]\,
      \bytesIN_i_reg[0][7]_8\ => \bytesIN_i_reg_n_0_[2][2]\,
      \bytesIN_i_reg[0][7]_9\ => \bytesIN_i_reg_n_0_[1][2]\,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      done0 => done0,
      nxByte_t => nxByte_t,
      oneByte_reg_0 => \byteFlag_w__0_n_0\,
      rst_IBUF => rst_IBUF,
      srcSel => srcSel,
      startOUT => startOUT,
      uifByteCount(0) => uifByteCount(0)
    );
\FSM_onehot_stt_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => '0',
      Q => done0,
      S => rst_IBUF
    );
\LxCount[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"32333222"
    )
        port map (
      I0 => \LxCount[0]_i_2_n_0\,
      I1 => L(0),
      I2 => byteCount(0),
      I3 => srcSel,
      I4 => uifByteCount(0),
      O => \LxCount[0]_i_1_n_0\
    );
\LxCount[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => L(2),
      I1 => L(1),
      I2 => L(3),
      O => \LxCount[0]_i_2_n_0\
    );
\LxCount[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F00E"
    )
        port map (
      I0 => L(2),
      I1 => L(3),
      I2 => L(1),
      I3 => L(0),
      O => \LxCount[1]_i_1_n_0\
    );
\LxCount[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"CCC2"
    )
        port map (
      I0 => L(3),
      I1 => L(2),
      I2 => L(1),
      I3 => L(0),
      O => \LxCount[2]_i_1_n_0\
    );
\LxCount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => byteFlag,
      I1 => byteFlag_w,
      I2 => L(0),
      I3 => L(2),
      I4 => L(1),
      I5 => L(3),
      O => \LxCount[3]_i_1_n_0\
    );
\LxCount[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA8"
    )
        port map (
      I0 => L(3),
      I1 => L(2),
      I2 => L(1),
      I3 => L(0),
      O => \LxCount[3]_i_2_n_0\
    );
\LxCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \LxCount[3]_i_1_n_0\,
      D => \LxCount[0]_i_1_n_0\,
      Q => L(0),
      R => done0
    );
\LxCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \LxCount[3]_i_1_n_0\,
      D => \LxCount[1]_i_1_n_0\,
      Q => L(1),
      R => done0
    );
\LxCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \LxCount[3]_i_1_n_0\,
      D => \LxCount[2]_i_1_n_0\,
      Q => L(2),
      R => done0
    );
\LxCount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \LxCount[3]_i_1_n_0\,
      D => \LxCount[3]_i_2_n_0\,
      Q => L(3),
      R => done0
    );
SPI0: entity work.SPI_Tx
     port map (
      CLK => CLK,
      CS_OBUF => CS_OBUF,
      D(7 downto 0) => byteOUT_t(7 downto 0),
      MOSI_OBUF => MOSI_OBUF,
      TxReady => TxReady,
      byteCountOUT(0) => byteCountOUT(0),
      nxByte_t => nxByte_t,
      rst_IBUF => rst_IBUF,
      startOUT => startOUT
    );
\byteFlag_w__0\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteFlag_w_i_1_n_0,
      Q => \byteFlag_w__0_n_0\,
      R => '0'
    );
byteFlag_w_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => L(2),
      I1 => L(1),
      I2 => L(3),
      I3 => L(0),
      I4 => done0,
      O => byteFlag_w_i_1_n_0
    );
\byteSel[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ABA8ABAA"
    )
        port map (
      I0 => \byteSel_reg_n_0_[0]\,
      I1 => \LxCount[0]_i_2_n_0\,
      I2 => L(0),
      I3 => byteFlag_w,
      I4 => byteFlag,
      I5 => done0,
      O => \byteSel[0]_i_1_n_0\
    );
\byteSel[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000ABABA8AA"
    )
        port map (
      I0 => \byteSel_reg_n_0_[1]\,
      I1 => \LxCount[0]_i_2_n_0\,
      I2 => L(0),
      I3 => byteFlag_w,
      I4 => byteFlag,
      I5 => done0,
      O => \byteSel[1]_i_1_n_0\
    );
\byteSel_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteSel[0]_i_1_n_0\,
      Q => \byteSel_reg_n_0_[0]\,
      R => '0'
    );
\byteSel_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteSel[1]_i_1_n_0\,
      Q => \byteSel_reg_n_0_[1]\,
      R => '0'
    );
\bytesIN_i[0][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(1),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[0][0]\,
      O => \bytesIN_i[0][0]_i_1_n_0\
    );
\bytesIN_i[0][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(1),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[0][1]\,
      O => \bytesIN_i[0][1]_i_1_n_0\
    );
\bytesIN_i[0][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFB00000008"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(1),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[0][2]\,
      O => \bytesIN_i[0][2]_i_1_n_0\
    );
\bytesIN_i[1][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[1][0]\,
      O => \bytesIN_i[1][0]_i_1_n_0\
    );
\bytesIN_i[1][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[1][1]\,
      O => \bytesIN_i[1][1]_i_1_n_0\
    );
\bytesIN_i[1][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[1][2]\,
      O => \bytesIN_i[1][2]_i_1_n_0\
    );
\bytesIN_i[2][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[2][0]\,
      O => \bytesIN_i[2][0]_i_1_n_0\
    );
\bytesIN_i[2][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[2][1]\,
      O => \bytesIN_i[2][1]_i_1_n_0\
    );
\bytesIN_i[2][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[2][2]\,
      O => \bytesIN_i[2][2]_i_1_n_0\
    );
\bytesIN_i[3][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[3][0]\,
      O => \bytesIN_i[3][0]_i_1_n_0\
    );
\bytesIN_i[3][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[3][1]\,
      O => \bytesIN_i[3][1]_i_1_n_0\
    );
\bytesIN_i[3][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFEFFFF00020000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[3][2]\,
      O => \bytesIN_i[3][2]_i_1_n_0\
    );
\bytesIN_i[4][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[4][0]\,
      O => \bytesIN_i[4][0]_i_1_n_0\
    );
\bytesIN_i[4][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[4][1]\,
      O => \bytesIN_i[4][1]_i_1_n_0\
    );
\bytesIN_i[4][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(1),
      I2 => L(0),
      I3 => L(3),
      I4 => L(2),
      I5 => \bytesIN_i_reg_n_0_[4][2]\,
      O => \bytesIN_i[4][2]_i_1_n_0\
    );
\bytesIN_i[5][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(0),
      I2 => L(2),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[5][0]\,
      O => \bytesIN_i[5][0]_i_1_n_0\
    );
\bytesIN_i[5][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(0),
      I2 => L(2),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[5][1]\,
      O => \bytesIN_i[5][1]_i_1_n_0\
    );
\bytesIN_i[5][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(0),
      I2 => L(2),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[5][2]\,
      O => \bytesIN_i[5][2]_i_1_n_0\
    );
\bytesIN_i[6][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[6][0]\,
      O => \bytesIN_i[6][0]_i_1_n_0\
    );
\bytesIN_i[6][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[6][1]\,
      O => \bytesIN_i[6][1]_i_1_n_0\
    );
\bytesIN_i[6][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFBFFFFF00800000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(2),
      I2 => L(0),
      I3 => L(3),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[6][2]\,
      O => \bytesIN_i[6][2]_i_1_n_0\
    );
\bytesIN_i[7][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[7][0]\,
      O => \bytesIN_i[7][0]_i_1_n_0\
    );
\bytesIN_i[7][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[7][1]\,
      O => \bytesIN_i[7][1]_i_1_n_0\
    );
\bytesIN_i[7][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFEF00000020"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(0),
      I2 => L(3),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[7][2]\,
      O => \bytesIN_i[7][2]_i_1_n_0\
    );
\bytesIN_i[8][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBF00000080"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(3),
      I2 => L(0),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[8][0]\,
      O => \bytesIN_i[8][0]_i_1_n_0\
    );
\bytesIN_i[8][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBF00000080"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(3),
      I2 => L(0),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[8][1]\,
      O => \bytesIN_i[8][1]_i_1_n_0\
    );
\bytesIN_i[8][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFBF00000080"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(3),
      I2 => L(0),
      I3 => L(2),
      I4 => L(1),
      I5 => \bytesIN_i_reg_n_0_[8][2]\,
      O => \bytesIN_i[8][2]_i_1_n_0\
    );
\bytesIN_i[9][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2__0_n_0\,
      I1 => L(0),
      I2 => L(1),
      I3 => L(2),
      I4 => L(3),
      I5 => \bytesIN_i_reg_n_0_[9][0]\,
      O => \bytesIN_i[9][0]_i_1_n_0\
    );
\bytesIN_i[9][0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002000200030000"
    )
        port map (
      I0 => \OLEDByte[0]\(0),
      I1 => L(2),
      I2 => L(1),
      I3 => L(3),
      I4 => uifByteCount(0),
      I5 => srcSel,
      O => \bytesIN_i[9][0]_i_2__0_n_0\
    );
\bytesIN_i[9][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => L(0),
      I2 => L(1),
      I3 => L(2),
      I4 => L(3),
      I5 => \bytesIN_i_reg_n_0_[9][1]\,
      O => \bytesIN_i[9][1]_i_1_n_0\
    );
\bytesIN_i[9][1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => srcSel,
      I1 => byteCount(0),
      I2 => L(3),
      I3 => L(1),
      I4 => L(2),
      O => \bytesIN_i[9][1]_i_2_n_0\
    );
\bytesIN_i[9][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFFF00200000"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => L(0),
      I2 => L(1),
      I3 => L(2),
      I4 => L(3),
      I5 => \bytesIN_i_reg_n_0_[9][2]\,
      O => \bytesIN_i[9][2]_i_1_n_0\
    );
\bytesIN_i[9][2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000E2"
    )
        port map (
      I0 => uifByteCount(0),
      I1 => srcSel,
      I2 => byteCount(0),
      I3 => L(3),
      I4 => L(1),
      I5 => L(2),
      O => \bytesIN_i[9][2]_i_2_n_0\
    );
\bytesIN_i_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[0][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][0]\,
      R => done0
    );
\bytesIN_i_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[0][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][1]\,
      R => done0
    );
\bytesIN_i_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[0][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][2]\,
      R => done0
    );
\bytesIN_i_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[1][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][0]\,
      R => done0
    );
\bytesIN_i_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[1][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][1]\,
      R => done0
    );
\bytesIN_i_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[1][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][2]\,
      R => done0
    );
\bytesIN_i_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[2][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][0]\,
      R => done0
    );
\bytesIN_i_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[2][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][1]\,
      R => done0
    );
\bytesIN_i_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[2][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][2]\,
      R => done0
    );
\bytesIN_i_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[3][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][0]\,
      R => done0
    );
\bytesIN_i_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[3][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][1]\,
      R => done0
    );
\bytesIN_i_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[3][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][2]\,
      R => done0
    );
\bytesIN_i_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[4][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][0]\,
      R => done0
    );
\bytesIN_i_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[4][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][1]\,
      R => done0
    );
\bytesIN_i_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[4][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][2]\,
      R => done0
    );
\bytesIN_i_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[5][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][0]\,
      R => done0
    );
\bytesIN_i_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[5][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][1]\,
      R => done0
    );
\bytesIN_i_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[5][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][2]\,
      R => done0
    );
\bytesIN_i_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[6][0]\,
      R => done0
    );
\bytesIN_i_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[6][1]\,
      R => done0
    );
\bytesIN_i_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[6][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[6][2]\,
      R => done0
    );
\bytesIN_i_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[7][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[7][0]\,
      R => done0
    );
\bytesIN_i_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[7][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[7][1]\,
      R => done0
    );
\bytesIN_i_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[7][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[7][2]\,
      R => done0
    );
\bytesIN_i_reg[8][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[8][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[8][0]\,
      R => done0
    );
\bytesIN_i_reg[8][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[8][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[8][1]\,
      R => done0
    );
\bytesIN_i_reg[8][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[8][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[8][2]\,
      R => done0
    );
\bytesIN_i_reg[9][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[9][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[9][0]\,
      R => done0
    );
\bytesIN_i_reg[9][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[9][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[9][1]\,
      R => done0
    );
\bytesIN_i_reg[9][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[9][2]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[9][2]\,
      R => done0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Top_s is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    sw : in STD_LOGIC;
    sw0 : in STD_LOGIC;
    CS : out STD_LOGIC;
    DC : out STD_LOGIC;
    MOSI : out STD_LOGIC;
    pin3 : out STD_LOGIC;
    PRst : out STD_LOGIC;
    rdy : out STD_LOGIC;
    sclk : out STD_LOGIC;
    Vbat : out STD_LOGIC;
    Vddc : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Top_s : entity is true;
end Top_s;

architecture STRUCTURE of Top_s is
  signal CS_OBUF : STD_LOGIC;
  signal MOSI_OBUF : STD_LOGIC;
  signal \OLEDByte[0]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal OnSeq0_n_6 : STD_LOGIC;
  signal OnSeq0_n_7 : STD_LOGIC;
  signal PRst_OBUF : STD_LOGIC;
  signal Vddc_OBUF : STD_LOGIC;
  signal byteCount : STD_LOGIC_VECTOR ( 0 to 0 );
  signal byteFlag : STD_LOGIC;
  signal byteFlag_w : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal rdy_OBUF : STD_LOGIC;
  signal rst_IBUF : STD_LOGIC;
  signal sclk_OBUF : STD_LOGIC;
  signal srcSel : STD_LOGIC;
  signal sw0_IBUF : STD_LOGIC;
  signal sw_IBUF : STD_LOGIC;
  signal uifByteCount : STD_LOGIC_VECTOR ( 0 to 0 );
begin
CS_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => CS_OBUF,
      O => CS
    );
DC_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => DC
    );
MOSI_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => MOSI_OBUF,
      O => MOSI
    );
OC0: entity work.OLEDCtrl_s
     port map (
      CLK => sclk_OBUF,
      CS_OBUF => CS_OBUF,
      MOSI_OBUF => MOSI_OBUF,
      \OLEDByte[0]\(0) => \OLEDByte[0]\(0),
      byteCount(0) => byteCount(0),
      \byteCountIN_i_reg[0]\ => OnSeq0_n_6,
      byteFlag => byteFlag,
      byteFlag_w => byteFlag_w,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF,
      srcSel => srcSel,
      uifByteCount(0) => uifByteCount(0)
    );
OnSeq0: entity work.onSeq_S
     port map (
      \OLEDByte[0]\(0) => \OLEDByte[0]\(0),
      PRst_OBUF => PRst_OBUF,
      Vddc_OBUF => Vddc_OBUF,
      byteCount(0) => byteCount(0),
      \byteCount_t_reg[0]_0\ => OnSeq0_n_6,
      byteFlag => byteFlag,
      byteFlag_t_reg_0 => OnSeq0_n_7,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rdy_OBUF => rdy_OBUF,
      rst_IBUF => rst_IBUF,
      srcSel => srcSel,
      sw_IBUF => sw_IBUF,
      uifByteCount(0) => uifByteCount(0)
    );
PRst_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => PRst_OBUF,
      O => PRst
    );
UIF0: entity work.userIF_s
     port map (
      byteFlag_w => byteFlag_w,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF,
      sw0_IBUF => sw0_IBUF,
      uifByteCount(0) => uifByteCount(0)
    );
Vbat_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Vddc_OBUF,
      O => Vbat
    );
Vddc_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Vddc_OBUF,
      O => Vddc
    );
clk_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_IBUF,
      O => clk_IBUF_BUFG
    );
clk_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk,
      O => clk_IBUF
    );
pin3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => '0',
      O => pin3
    );
rdy_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => rdy_OBUF,
      O => rdy
    );
rst_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => rst,
      O => rst_IBUF
    );
sclk0: entity work.sclk_s
     port map (
      CLK => sclk_OBUF,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF
    );
sclk_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => sclk_OBUF,
      O => sclk
    );
srcSel_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => OnSeq0_n_7,
      Q => srcSel,
      R => '0'
    );
sw0_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sw0,
      O => sw0_IBUF
    );
sw_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => sw,
      O => sw_IBUF
    );
end STRUCTURE;
