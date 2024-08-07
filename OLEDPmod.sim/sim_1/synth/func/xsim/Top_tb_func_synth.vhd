-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue Jul 16 20:03:07 2024
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
    sclk_OBUF : in STD_LOGIC;
    startOUT : in STD_LOGIC;
    byteCountOUT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    rst_IBUF : in STD_LOGIC;
    D : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end SPI_Tx;

architecture STRUCTURE of SPI_Tx is
  signal CS_t : STD_LOGIC;
  signal CS_t_i_1_n_0 : STD_LOGIC;
  signal \FSM_onehot_stt[1]_i_1_n_0\ : STD_LOGIC;
  signal MOSI_t0 : STD_LOGIC;
  signal MOSI_t_i_1_n_0 : STD_LOGIC;
  signal MOSI_t_i_3_n_0 : STD_LOGIC;
  signal MOSI_t_i_4_n_0 : STD_LOGIC;
  signal MOSI_t_i_5_n_0 : STD_LOGIC;
  signal MOSI_t_reg_i_2_n_0 : STD_LOGIC;
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
  signal byteCount_i : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \byteCount_i[3]_i_1_n_0\ : STD_LOGIC;
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
  signal done_i_1_n_0 : STD_LOGIC;
  signal done_i_2_n_0 : STD_LOGIC;
  signal lBit : STD_LOGIC;
  signal lBit_i_2_n_0 : STD_LOGIC;
  signal lBit_i_3_n_0 : STD_LOGIC;
  signal lBit_reg_n_0 : STD_LOGIC;
  signal nxByte_t_0 : STD_LOGIC;
  signal nxByte_t_i_2_n_0 : STD_LOGIC;
  signal nxByte_t_i_3_n_0 : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[0]\ : label is "rststt:001,idle:010,iSTATE:100";
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[1]\ : label is "rststt:001,idle:010,iSTATE:100";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \TxCount[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \TxCount[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \TxCount[3]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of TxReady_t_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \byteCount_i[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \byteCount_i[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \byteCount_i[3]_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \byteCount_i[3]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of done_i_1 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of lBit_i_1 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of lBit_i_2 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of lBit_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of nxByte_t_i_2 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of nxByte_t_i_3 : label is "soft_lutpair12";
begin
  TxReady <= \^txready\;
CS_t_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
      I2 => done_i_2_n_0,
      O => CS_t_i_1_n_0
    );
CS_t_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => \TxCount_reg_n_0_[0]\,
      I1 => \TxCount_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[3]\,
      I4 => TxReady_t,
      O => CS_t
    );
CS_t_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => CS_t,
      D => '0',
      Q => CS_OBUF,
      S => CS_t_i_1_n_0
    );
\FSM_onehot_stt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFB8"
    )
        port map (
      I0 => \^txready\,
      I1 => TxReady_t,
      I2 => done,
      I3 => MOSI_t0,
      I4 => rst_IBUF,
      O => \FSM_onehot_stt[1]_i_1_n_0\
    );
\FSM_onehot_stt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => sclk_OBUF,
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
      C => sclk_OBUF,
      CE => '1',
      D => \FSM_onehot_stt[1]_i_1_n_0\,
      Q => TxReady_t,
      R => '0'
    );
MOSI_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555554"
    )
        port map (
      I0 => TxReady_t,
      I1 => \TxCount_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[3]\,
      I4 => \TxCount_reg_n_0_[0]\,
      O => MOSI_t_i_1_n_0
    );
MOSI_t_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1E"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[0]\,
      I2 => \TxCount_reg_n_0_[2]\,
      O => MOSI_t_i_3_n_0
    );
MOSI_t_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FACF0ACFFAC00AC0"
    )
        port map (
      I0 => \byteReg_reg_n_0_[4]\,
      I1 => \byteReg_reg_n_0_[5]\,
      I2 => \TxCount_reg_n_0_[1]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[6]\,
      I5 => \byteReg_reg_n_0_[7]\,
      O => MOSI_t_i_4_n_0
    );
MOSI_t_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FACF0ACFFAC00AC0"
    )
        port map (
      I0 => \byteReg_reg_n_0_[0]\,
      I1 => \byteReg_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[1]\,
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \byteReg_reg_n_0_[2]\,
      I5 => \byteReg_reg_n_0_[3]\,
      O => MOSI_t_i_5_n_0
    );
MOSI_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => MOSI_t_i_1_n_0,
      D => MOSI_t_reg_i_2_n_0,
      Q => MOSI_OBUF,
      R => MOSI_t0
    );
MOSI_t_reg_i_2: unisim.vcomponents.MUXF7
     port map (
      I0 => MOSI_t_i_4_n_0,
      I1 => MOSI_t_i_5_n_0,
      O => MOSI_t_reg_i_2_n_0,
      S => MOSI_t_i_3_n_0
    );
\TxCount[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => MOSI_t0,
      I1 => TxReady_t,
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
      I2 => \TxCount_reg_n_0_[0]\,
      I3 => \TxCount_reg_n_0_[1]\,
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
      I3 => \TxCount_reg_n_0_[0]\,
      I4 => \TxCount_reg_n_0_[1]\,
      O => \TxCount[2]_i_1_n_0\
    );
\TxCount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFF4F"
    )
        port map (
      I0 => \TxCount[3]_i_3_n_0\,
      I1 => \TxCount_reg_n_0_[0]\,
      I2 => nxByte_t_i_2_n_0,
      I3 => \TxCount_reg_n_0_[1]\,
      I4 => \TxCount_reg_n_0_[2]\,
      I5 => \TxCount_reg_n_0_[3]\,
      O => TxCount
    );
\TxCount[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFCFCFCFF"
    )
        port map (
      I0 => \TxCount_reg_n_0_[0]\,
      I1 => TxReady_t,
      I2 => MOSI_t0,
      I3 => \TxCount_reg_n_0_[1]\,
      I4 => \TxCount_reg_n_0_[2]\,
      I5 => \TxCount_reg_n_0_[3]\,
      O => \TxCount[3]_i_2_n_0\
    );
\TxCount[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000007"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[0]\,
      I1 => lBit_reg_n_0,
      I2 => \byteCount_i_reg_n_0_[3]\,
      I3 => \byteCount_i_reg_n_0_[2]\,
      I4 => \byteCount_i_reg_n_0_[1]\,
      O => \TxCount[3]_i_3_n_0\
    );
\TxCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
      CE => TxCount,
      D => \TxCount[3]_i_2_n_0\,
      Q => \TxCount_reg_n_0_[3]\,
      R => '0'
    );
TxReady_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00545554"
    )
        port map (
      I0 => MOSI_t0,
      I1 => done_i_2_n_0,
      I2 => \^txready\,
      I3 => TxReady_t,
      I4 => startOUT,
      O => TxReady_t_i_1_n_0
    );
TxReady_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
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
\byteCount_i[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B88B"
    )
        port map (
      I0 => byteCountOUT(1),
      I1 => TxReady_t,
      I2 => \byteCount_i_reg_n_0_[0]\,
      I3 => \byteCount_i_reg_n_0_[1]\,
      O => byteCount_i(1)
    );
\byteCount_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8B8B88B"
    )
        port map (
      I0 => byteCountOUT(2),
      I1 => TxReady_t,
      I2 => \byteCount_i_reg_n_0_[2]\,
      I3 => \byteCount_i_reg_n_0_[1]\,
      I4 => \byteCount_i_reg_n_0_[0]\,
      O => byteCount_i(2)
    );
\byteCount_i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA0000AAAAFFFC"
    )
        port map (
      I0 => startOUT,
      I1 => \byteCount_i_reg_n_0_[1]\,
      I2 => \byteCount_i_reg_n_0_[2]\,
      I3 => \byteCount_i_reg_n_0_[3]\,
      I4 => TxReady_t,
      I5 => \byteCount_i[3]_i_3_n_0\,
      O => \byteCount_i[3]_i_1_n_0\
    );
\byteCount_i[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FE01"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[1]\,
      I1 => \byteCount_i_reg_n_0_[0]\,
      I2 => \byteCount_i_reg_n_0_[2]\,
      I3 => \byteCount_i_reg_n_0_[3]\,
      I4 => TxReady_t,
      O => byteCount_i(3)
    );
\byteCount_i[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => \TxCount_reg_n_0_[3]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \TxCount_reg_n_0_[1]\,
      I3 => \TxCount_reg_n_0_[0]\,
      O => \byteCount_i[3]_i_3_n_0\
    );
\byteCount_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
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
      C => sclk_OBUF,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => byteCount_i(1),
      Q => \byteCount_i_reg_n_0_[1]\,
      R => MOSI_t0
    );
\byteCount_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => byteCount_i(2),
      Q => \byteCount_i_reg_n_0_[2]\,
      R => MOSI_t0
    );
\byteCount_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => \byteCount_i[3]_i_1_n_0\,
      D => byteCount_i(3),
      Q => \byteCount_i_reg_n_0_[3]\,
      R => MOSI_t0
    );
\byteReg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA00AA03AA00AA00"
    )
        port map (
      I0 => startOUT,
      I1 => nxByte_t_i_3_n_0,
      I2 => MOSI_t0,
      I3 => TxReady_t,
      I4 => lBit_i_2_n_0,
      I5 => \TxCount_reg_n_0_[0]\,
      O => byteReg
    );
\byteReg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
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
      C => sclk_OBUF,
      CE => byteReg,
      D => D(7),
      Q => \byteReg_reg_n_0_[7]\,
      R => '0'
    );
done_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => done_i_2_n_0,
      I1 => MOSI_t0,
      I2 => TxReady_t,
      O => done_i_1_n_0
    );
done_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => lBit_reg_n_0,
      I1 => \byteCount_i_reg_n_0_[1]\,
      I2 => \byteCount_i_reg_n_0_[0]\,
      I3 => \byteCount_i_reg_n_0_[3]\,
      I4 => \byteCount_i_reg_n_0_[2]\,
      I5 => \byteCount_i[3]_i_3_n_0\,
      O => done_i_2_n_0
    );
done_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => '1',
      D => done_i_1_n_0,
      Q => done,
      R => '0'
    );
lBit_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => lBit_i_2_n_0,
      I1 => \TxCount_reg_n_0_[0]\,
      I2 => TxReady_t,
      I3 => lBit_i_3_n_0,
      I4 => MOSI_t0,
      O => lBit
    );
lBit_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \TxCount_reg_n_0_[1]\,
      I1 => \TxCount_reg_n_0_[2]\,
      I2 => \TxCount_reg_n_0_[3]\,
      O => lBit_i_2_n_0
    );
lBit_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[2]\,
      I1 => \byteCount_i_reg_n_0_[3]\,
      I2 => \byteCount_i_reg_n_0_[0]\,
      I3 => \byteCount_i_reg_n_0_[1]\,
      I4 => lBit_reg_n_0,
      O => lBit_i_3_n_0
    );
lBit_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
      CE => '1',
      D => lBit,
      Q => lBit_reg_n_0,
      R => '0'
    );
nxByte_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000001000000"
    )
        port map (
      I0 => \TxCount_reg_n_0_[0]\,
      I1 => \TxCount_reg_n_0_[1]\,
      I2 => \TxCount_reg_n_0_[2]\,
      I3 => \TxCount_reg_n_0_[3]\,
      I4 => nxByte_t_i_2_n_0,
      I5 => nxByte_t_i_3_n_0,
      O => nxByte_t_0
    );
nxByte_t_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => TxReady_t,
      I1 => MOSI_t0,
      O => nxByte_t_i_2_n_0
    );
nxByte_t_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \byteCount_i_reg_n_0_[1]\,
      I1 => \byteCount_i_reg_n_0_[2]\,
      I2 => \byteCount_i_reg_n_0_[3]\,
      O => nxByte_t_i_3_n_0
    );
nxByte_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '1'
    )
        port map (
      C => sclk_OBUF,
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
    byteCountOUT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \byteOUT_t_reg[7]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_IBUF_BUFG : in STD_LOGIC;
    TxReady : in STD_LOGIC;
    \byteCountIN_i_reg[0]_0\ : in STD_LOGIC;
    byteCount : in STD_LOGIC_VECTOR ( 2 downto 0 );
    srcSel : in STD_LOGIC;
    done0 : in STD_LOGIC;
    \bytesIN_i_reg[0][4]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][4]_1\ : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \bytesIN_i[9][7]_i_4_0\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \bytesIN_i[9][7]_i_4_1\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \bytesIN_i[9][7]_i_4_2\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    oneByte_reg_0 : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    \bytesIN_i[9][7]_i_4_3\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \bytesIN_i[9][7]_i_4_4\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \bytesIN_i[9][7]_i_4_5\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    nxByte_t : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC
  );
end byteBuffer_s;

architecture STRUCTURE of byteBuffer_s is
  signal \FSM_sequential_stt[0]_i_2_n_0\ : STD_LOGIC;
  signal byteCountIN_i : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \byteCountIN_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteCountIN_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteCountIN_i[2]_i_2_n_0\ : STD_LOGIC;
  signal byteCountIN_i_0 : STD_LOGIC;
  signal byteCountIN_w : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^bytecountout\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \byteCountOUT_t[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteCountOUT_t[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteCountOUT_t[2]_i_1_n_0\ : STD_LOGIC;
  signal byteOUT_t : STD_LOGIC;
  signal \byteOUT_t[0]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[0]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[1]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[2]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[3]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[4]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[5]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_2_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[6]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_3_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_4_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_5_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_6_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_7_n_0\ : STD_LOGIC;
  signal \byteOUT_t[7]_i_8_n_0\ : STD_LOGIC;
  signal \bytesIN[9]_0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \bytesIN_i[0][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[1]_2\ : STD_LOGIC;
  signal \bytesIN_i[2]_1\ : STD_LOGIC;
  signal \bytesIN_i[3][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[4][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[5][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6]_3\ : STD_LOGIC;
  signal \bytesIN_i[7][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[8][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][0]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][1]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][2]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][3]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][4]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][4]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][4]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][4]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][5]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][6]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_5_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_6_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_7_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9][7]_i_8_n_0\ : STD_LOGIC;
  signal \bytesIN_i[9]__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \bytesIN_i_reg[0]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
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
  signal leadED_i_1_n_0 : STD_LOGIC;
  signal leadED_reg_n_0 : STD_LOGIC;
  signal lxDone_reg_n_0 : STD_LOGIC;
  signal lxFlag_reg_n_0 : STD_LOGIC;
  signal nByteCount : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \nByteCount[1]_i_2_n_0\ : STD_LOGIC;
  signal \nByteCount[2]_i_2_n_0\ : STD_LOGIC;
  signal \nByteCount[2]_i_3_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_1_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_3_n_0\ : STD_LOGIC;
  signal \nByteCount[3]_i_4_n_0\ : STD_LOGIC;
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
  signal startOUT_t0 : STD_LOGIC;
  signal startOUT_t_i_1_n_0 : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \stt__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal sxDone_i_1_n_0 : STD_LOGIC;
  signal sxDone_reg_n_0 : STD_LOGIC;
  signal sxFlag_i_1_n_0 : STD_LOGIC;
  signal sxFlag_reg_n_0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_stt[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \FSM_sequential_stt[1]_i_1\ : label is "soft_lutpair6";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "rststt:00,iSTATE:11,idle:01,lx:10";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "rststt:00,iSTATE:11,idle:01,lx:10";
  attribute SOFT_HLUTNM of \byteOUT_t[0]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \byteOUT_t[7]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \bytesIN_i[9][4]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bytesIN_i[9][5]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bytesIN_i[9][5]_i_6\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bytesIN_i[9][6]_i_4\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \bytesIN_i[9][6]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bytesIN_i[9][7]_i_6\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \bytesIN_i[9][7]_i_8\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of followED_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of lxFlag_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \nByteCount[2]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of nxByteED_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of oneByte_i_3 : label is "soft_lutpair3";
begin
  byteCountOUT(2 downto 0) <= \^bytecountout\(2 downto 0);
  startOUT <= \^startout\;
\FSM_sequential_stt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7000"
    )
        port map (
      I0 => \byteCountIN_i_reg[0]_0\,
      I1 => sxDone_reg_n_0,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => \FSM_sequential_stt[0]_i_2_n_0\,
      O => \stt__0\(0)
    );
\FSM_sequential_stt[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000FEFEF"
    )
        port map (
      I0 => lxDone_reg_n_0,
      I1 => oneByte_reg_n_0,
      I2 => stt(1),
      I3 => lxFlag_reg_n_0,
      I4 => rdy_t,
      O => \FSM_sequential_stt[0]_i_2_n_0\
    );
\FSM_sequential_stt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFF0D0F0"
    )
        port map (
      I0 => sxDone_reg_n_0,
      I1 => \byteCountIN_i_reg[0]_0\,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => lxFlag_reg_n_0,
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
\byteCountIN_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FBFF0800"
    )
        port map (
      I0 => byteCountIN_w(0),
      I1 => \byteCountIN_i_reg[0]_0\,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => byteCountIN_i(0),
      O => \byteCountIN_i[0]_i_1_n_0\
    );
\byteCountIN_i[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000FFFF20000000"
    )
        port map (
      I0 => \nByteCount[2]_i_3_n_0\,
      I1 => done0,
      I2 => byteCount(1),
      I3 => srcSel,
      I4 => byteCountIN_i_0,
      I5 => byteCountIN_i(1),
      O => \byteCountIN_i[1]_i_1_n_0\
    );
\byteCountIN_i[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(1),
      I1 => rdy_t,
      O => startOUT_t0
    );
\byteCountIN_i[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080FFFF00800000"
    )
        port map (
      I0 => byteCount(2),
      I1 => srcSel,
      I2 => \nByteCount[2]_i_3_n_0\,
      I3 => done0,
      I4 => byteCountIN_i_0,
      I5 => byteCountIN_i(2),
      O => \byteCountIN_i[2]_i_2_n_0\
    );
\byteCountIN_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountIN_i[0]_i_1_n_0\,
      Q => byteCountIN_i(0),
      R => startOUT_t0
    );
\byteCountIN_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountIN_i[1]_i_1_n_0\,
      Q => byteCountIN_i(1),
      R => startOUT_t0
    );
\byteCountIN_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountIN_i[2]_i_2_n_0\,
      Q => byteCountIN_i(2),
      R => startOUT_t0
    );
\byteCountOUT_t[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BE82"
    )
        port map (
      I0 => byteCountIN_i(0),
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \^bytecountout\(0),
      O => \byteCountOUT_t[0]_i_1_n_0\
    );
\byteCountOUT_t[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BE82"
    )
        port map (
      I0 => byteCountIN_i(1),
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \^bytecountout\(1),
      O => \byteCountOUT_t[1]_i_1_n_0\
    );
\byteCountOUT_t[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BE82"
    )
        port map (
      I0 => byteCountIN_i(2),
      I1 => stt(1),
      I2 => rdy_t,
      I3 => \^bytecountout\(2),
      O => \byteCountOUT_t[2]_i_1_n_0\
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
      R => startOUT_t0
    );
\byteCountOUT_t_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountOUT_t[1]_i_1_n_0\,
      Q => \^bytecountout\(1),
      R => startOUT_t0
    );
\byteCountOUT_t_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \byteCountOUT_t[2]_i_1_n_0\,
      Q => \^bytecountout\(2),
      R => startOUT_t0
    );
\byteOUT_t[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[0]_i_2_n_0\,
      I4 => \byteOUT_t[0]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(0)
    );
\byteOUT_t[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(0),
      I3 => \byteOUT_t[0]_i_4_n_0\,
      I4 => \byteOUT_t[0]_i_5_n_0\,
      O => \byteOUT_t[0]_i_2_n_0\
    );
\byteOUT_t[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][0]\,
      O => \byteOUT_t[0]_i_3_n_0\
    );
\byteOUT_t[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][0]\,
      I1 => \bytesIN_i_reg_n_0_[5][0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][0]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][0]\,
      O => \byteOUT_t[0]_i_4_n_0\
    );
\byteOUT_t[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][0]\,
      O => \byteOUT_t[0]_i_5_n_0\
    );
\byteOUT_t[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[1]_i_2_n_0\,
      I4 => \byteOUT_t[1]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(1)
    );
\byteOUT_t[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(1),
      I3 => \byteOUT_t[1]_i_4_n_0\,
      I4 => \byteOUT_t[1]_i_5_n_0\,
      O => \byteOUT_t[1]_i_2_n_0\
    );
\byteOUT_t[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][1]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][1]\,
      O => \byteOUT_t[1]_i_3_n_0\
    );
\byteOUT_t[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][1]\,
      I1 => \bytesIN_i_reg_n_0_[5][1]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][1]\,
      O => \byteOUT_t[1]_i_4_n_0\
    );
\byteOUT_t[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][1]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][1]\,
      O => \byteOUT_t[1]_i_5_n_0\
    );
\byteOUT_t[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][2]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[2]_i_2_n_0\,
      I4 => \byteOUT_t[2]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(2)
    );
\byteOUT_t[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(2),
      I3 => \byteOUT_t[2]_i_4_n_0\,
      I4 => \byteOUT_t[2]_i_5_n_0\,
      O => \byteOUT_t[2]_i_2_n_0\
    );
\byteOUT_t[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][2]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][2]\,
      O => \byteOUT_t[2]_i_3_n_0\
    );
\byteOUT_t[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][2]\,
      I1 => \bytesIN_i_reg_n_0_[5][2]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][2]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][2]\,
      O => \byteOUT_t[2]_i_4_n_0\
    );
\byteOUT_t[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][2]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][2]\,
      O => \byteOUT_t[2]_i_5_n_0\
    );
\byteOUT_t[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][3]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[3]_i_2_n_0\,
      I4 => \byteOUT_t[3]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(3)
    );
\byteOUT_t[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(3),
      I3 => \byteOUT_t[3]_i_4_n_0\,
      I4 => \byteOUT_t[3]_i_5_n_0\,
      O => \byteOUT_t[3]_i_2_n_0\
    );
\byteOUT_t[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][3]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][3]\,
      O => \byteOUT_t[3]_i_3_n_0\
    );
\byteOUT_t[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][3]\,
      I1 => \bytesIN_i_reg_n_0_[5][3]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][3]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][3]\,
      O => \byteOUT_t[3]_i_4_n_0\
    );
\byteOUT_t[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][3]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][3]\,
      O => \byteOUT_t[3]_i_5_n_0\
    );
\byteOUT_t[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][4]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[4]_i_2_n_0\,
      I4 => \byteOUT_t[4]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(4)
    );
\byteOUT_t[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(4),
      I3 => \byteOUT_t[4]_i_4_n_0\,
      I4 => \byteOUT_t[4]_i_5_n_0\,
      O => \byteOUT_t[4]_i_2_n_0\
    );
\byteOUT_t[4]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][4]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][4]\,
      O => \byteOUT_t[4]_i_3_n_0\
    );
\byteOUT_t[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][4]\,
      I1 => \bytesIN_i_reg_n_0_[5][4]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][4]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][4]\,
      O => \byteOUT_t[4]_i_4_n_0\
    );
\byteOUT_t[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][4]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][4]\,
      O => \byteOUT_t[4]_i_5_n_0\
    );
\byteOUT_t[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][5]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[5]_i_2_n_0\,
      I4 => \byteOUT_t[5]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(5)
    );
\byteOUT_t[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(5),
      I3 => \byteOUT_t[5]_i_4_n_0\,
      I4 => \byteOUT_t[5]_i_5_n_0\,
      O => \byteOUT_t[5]_i_2_n_0\
    );
\byteOUT_t[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][5]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][5]\,
      O => \byteOUT_t[5]_i_3_n_0\
    );
\byteOUT_t[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][5]\,
      I1 => \bytesIN_i_reg_n_0_[5][5]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][5]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][5]\,
      O => \byteOUT_t[5]_i_4_n_0\
    );
\byteOUT_t[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][5]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][5]\,
      O => \byteOUT_t[5]_i_5_n_0\
    );
\byteOUT_t[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][6]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[6]_i_2_n_0\,
      I4 => \byteOUT_t[6]_i_3_n_0\,
      O => \bytesIN_i[9]__0\(6)
    );
\byteOUT_t[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(6),
      I3 => \byteOUT_t[6]_i_4_n_0\,
      I4 => \byteOUT_t[6]_i_5_n_0\,
      O => \byteOUT_t[6]_i_2_n_0\
    );
\byteOUT_t[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][6]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][6]\,
      O => \byteOUT_t[6]_i_3_n_0\
    );
\byteOUT_t[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][6]\,
      I1 => \bytesIN_i_reg_n_0_[5][6]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][6]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][6]\,
      O => \byteOUT_t[6]_i_4_n_0\
    );
\byteOUT_t[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][6]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][6]\,
      O => \byteOUT_t[6]_i_5_n_0\
    );
\byteOUT_t[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A200A280"
    )
        port map (
      I0 => \byteOUT_t[7]_i_3_n_0\,
      I1 => sxFlag_reg_n_0,
      I2 => nxByteED,
      I3 => TxReady,
      I4 => \^startout\,
      I5 => \byteOUT_t[7]_i_4_n_0\,
      O => byteOUT_t
    );
\byteOUT_t[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF8F00"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \bytesIN_i_reg_n_0_[9][7]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \byteOUT_t[7]_i_5_n_0\,
      I4 => \byteOUT_t[7]_i_6_n_0\,
      O => \bytesIN_i[9]__0\(7)
    );
\byteOUT_t[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => stt(1),
      I1 => rdy_t,
      O => \byteOUT_t[7]_i_3_n_0\
    );
\byteOUT_t[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \nByteCount_reg_n_0_[3]\,
      I2 => \^startout\,
      I3 => sxFlag_reg_n_0,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \byteOUT_t[7]_i_4_n_0\
    );
\byteOUT_t[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFDC10"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i_reg[0]\(7),
      I3 => \byteOUT_t[7]_i_7_n_0\,
      I4 => \byteOUT_t[7]_i_8_n_0\,
      O => \byteOUT_t[7]_i_5_n_0\
    );
\byteOUT_t[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23002000"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[8][7]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => \bytesIN_i_reg_n_0_[7][7]\,
      O => \byteOUT_t[7]_i_6_n_0\
    );
\byteOUT_t[7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \bytesIN_i_reg_n_0_[6][7]\,
      I1 => \bytesIN_i_reg_n_0_[5][7]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \bytesIN_i_reg_n_0_[4][7]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[3][7]\,
      O => \byteOUT_t[7]_i_7_n_0\
    );
\byteOUT_t[7]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AF00AEAAAA00AEAA"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \bytesIN_i_reg_n_0_[1][7]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i_reg_n_0_[2][7]\,
      O => \byteOUT_t[7]_i_8_n_0\
    );
\byteOUT_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(0),
      Q => \byteOUT_t_reg[7]_0\(0),
      R => startOUT_t0
    );
\byteOUT_t_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(1),
      Q => \byteOUT_t_reg[7]_0\(1),
      R => startOUT_t0
    );
\byteOUT_t_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(2),
      Q => \byteOUT_t_reg[7]_0\(2),
      R => startOUT_t0
    );
\byteOUT_t_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(3),
      Q => \byteOUT_t_reg[7]_0\(3),
      R => startOUT_t0
    );
\byteOUT_t_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(4),
      Q => \byteOUT_t_reg[7]_0\(4),
      R => startOUT_t0
    );
\byteOUT_t_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(5),
      Q => \byteOUT_t_reg[7]_0\(5),
      R => startOUT_t0
    );
\byteOUT_t_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(6),
      Q => \byteOUT_t_reg[7]_0\(6),
      R => startOUT_t0
    );
\byteOUT_t_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => byteOUT_t,
      D => \bytesIN_i[9]__0\(7),
      Q => \byteOUT_t_reg[7]_0\(7),
      R => startOUT_t0
    );
\bytesIN_i[0][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \nByteCount_reg_n_0_[2]\,
      O => \bytesIN_i[0][7]_i_1_n_0\
    );
\bytesIN_i[2][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \nByteCount_reg_n_0_[2]\,
      O => \bytesIN_i[2]_1\
    );
\bytesIN_i[3][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[3][7]_i_1_n_0\
    );
\bytesIN_i[4][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[4][7]_i_1_n_0\
    );
\bytesIN_i[5][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[5][7]_i_1_n_0\
    );
\bytesIN_i[6][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000800000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \nByteCount_reg_n_0_[3]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[6]_3\
    );
\bytesIN_i[7][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[7][7]_i_1_n_0\
    );
\bytesIN_i[8][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[8][7]_i_1_n_0\
    );
\bytesIN_i[9][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0202FF00020200"
    )
        port map (
      I0 => \bytesIN_i[9][0]_i_2_n_0\,
      I1 => \bytesIN_i[9][0]_i_3_n_0\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      I5 => \bytesIN_i[9][0]_i_4_n_0\,
      O => \bytesIN[9]_0\(0)
    );
\bytesIN_i[9][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_2\(0),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \bytesIN_i[9][7]_i_4_1\(0),
      I4 => \bytesIN_i[9][0]_i_5_n_0\,
      O => \bytesIN_i[9][0]_i_2_n_0\
    );
\bytesIN_i[9][0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001D1D00FF"
    )
        port map (
      I0 => Q(0),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i[9][7]_i_4_0\(0),
      I3 => \bytesIN_i[9][7]_i_4_3\(0),
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][0]_i_3_n_0\
    );
\bytesIN_i[9][0]_i_4\: unisim.vcomponents.LUT6
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
      O => \bytesIN_i[9][0]_i_4_n_0\
    );
\bytesIN_i[9][0]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4540FFFF"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_5\(0),
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \bytesIN_i[9][7]_i_4_4\(0),
      I4 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][0]_i_5_n_0\
    );
\bytesIN_i[9][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0202FF00020200"
    )
        port map (
      I0 => \bytesIN_i[9][1]_i_2_n_0\,
      I1 => \bytesIN_i[9][1]_i_3_n_0\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      I5 => \bytesIN_i[9][1]_i_4_n_0\,
      O => \bytesIN[9]_0\(1)
    );
\bytesIN_i[9][1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_2\(1),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \bytesIN_i[9][7]_i_4_1\(1),
      I4 => \bytesIN_i[9][1]_i_5_n_0\,
      O => \bytesIN_i[9][1]_i_2_n_0\
    );
\bytesIN_i[9][1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001D1D00FF"
    )
        port map (
      I0 => Q(1),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i[9][7]_i_4_0\(1),
      I3 => \bytesIN_i[9][7]_i_4_3\(1),
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][1]_i_3_n_0\
    );
\bytesIN_i[9][1]_i_4\: unisim.vcomponents.LUT6
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
      O => \bytesIN_i[9][1]_i_4_n_0\
    );
\bytesIN_i[9][1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4540FFFF"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_5\(1),
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \bytesIN_i[9][7]_i_4_4\(1),
      I4 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][1]_i_5_n_0\
    );
\bytesIN_i[9][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0202FF00020200"
    )
        port map (
      I0 => \bytesIN_i[9][2]_i_2_n_0\,
      I1 => \bytesIN_i[9][2]_i_3_n_0\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      I5 => \bytesIN_i[9][2]_i_4_n_0\,
      O => \bytesIN[9]_0\(2)
    );
\bytesIN_i[9][2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_2\(2),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \bytesIN_i[9][7]_i_4_1\(2),
      I4 => \bytesIN_i[9][2]_i_5_n_0\,
      O => \bytesIN_i[9][2]_i_2_n_0\
    );
\bytesIN_i[9][2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001D1D00FF"
    )
        port map (
      I0 => Q(2),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i[9][7]_i_4_0\(2),
      I3 => \bytesIN_i[9][7]_i_4_3\(2),
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][2]_i_3_n_0\
    );
\bytesIN_i[9][2]_i_4\: unisim.vcomponents.LUT6
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
      O => \bytesIN_i[9][2]_i_4_n_0\
    );
\bytesIN_i[9][2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4540FFFF"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_5\(2),
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \bytesIN_i[9][7]_i_4_4\(2),
      I4 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][2]_i_5_n_0\
    );
\bytesIN_i[9][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF0202FF00020200"
    )
        port map (
      I0 => \bytesIN_i[9][3]_i_2_n_0\,
      I1 => \bytesIN_i[9][3]_i_3_n_0\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      I5 => \bytesIN_i[9][3]_i_4_n_0\,
      O => \bytesIN[9]_0\(3)
    );
\bytesIN_i[9][3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_2\(3),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \bytesIN_i[9][7]_i_4_1\(3),
      I4 => \bytesIN_i[9][3]_i_5_n_0\,
      O => \bytesIN_i[9][3]_i_2_n_0\
    );
\bytesIN_i[9][3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000001D1D00FF"
    )
        port map (
      I0 => Q(3),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i[9][7]_i_4_0\(3),
      I3 => \bytesIN_i[9][7]_i_4_3\(3),
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][3]_i_3_n_0\
    );
\bytesIN_i[9][3]_i_4\: unisim.vcomponents.LUT6
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
      O => \bytesIN_i[9][3]_i_4_n_0\
    );
\bytesIN_i[9][3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"4540FFFF"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_5\(3),
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \bytesIN_i[9][7]_i_4_4\(3),
      I4 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][3]_i_5_n_0\
    );
\bytesIN_i[9][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACFCFAAAA0000AA"
    )
        port map (
      I0 => \bytesIN_i[9][4]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_0\,
      I4 => \bytesIN_i_reg[0][4]_1\,
      I5 => \bytesIN_i[9][4]_i_3_n_0\,
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
\bytesIN_i[9][4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000BAFF"
    )
        port map (
      I0 => \bytesIN_i[9][4]_i_4_n_0\,
      I1 => \bytesIN_i[9][7]_i_6_n_0\,
      I2 => Q(4),
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \bytesIN_i[9][4]_i_5_n_0\,
      I5 => \bytesIN_i[9][7]_i_8_n_0\,
      O => \bytesIN_i[9][4]_i_3_n_0\
    );
\bytesIN_i[9][4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AFC0A0C0"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_2\(4),
      I1 => \bytesIN_i[9][7]_i_4_1\(4),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \bytesIN_i[9][7]_i_4_0\(4),
      O => \bytesIN_i[9][4]_i_4_n_0\
    );
\bytesIN_i[9][4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0011051155110511"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_3\(4),
      I2 => \bytesIN_i[9][7]_i_4_4\(4),
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i[9][7]_i_4_5\(4),
      O => \bytesIN_i[9][4]_i_5_n_0\
    );
\bytesIN_i[9][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACFCFAAAA0000AA"
    )
        port map (
      I0 => \bytesIN_i[9][5]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_0\,
      I4 => \bytesIN_i_reg[0][4]_1\,
      I5 => \bytesIN_i[9][5]_i_3_n_0\,
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
\bytesIN_i[9][5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000AF00EF00EF"
    )
        port map (
      I0 => \bytesIN_i[9][5]_i_4_n_0\,
      I1 => \bytesIN_i[9][7]_i_4_0\(5),
      I2 => \nByteCount_reg_n_0_[2]\,
      I3 => \bytesIN_i[9][5]_i_5_n_0\,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \bytesIN_i[9][5]_i_6_n_0\,
      O => \bytesIN_i[9][5]_i_3_n_0\
    );
\bytesIN_i[9][5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0CA00CA"
    )
        port map (
      I0 => Q(5),
      I1 => \bytesIN_i[9][7]_i_4_1\(5),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \bytesIN_i[9][7]_i_4_2\(5),
      O => \bytesIN_i[9][5]_i_4_n_0\
    );
\bytesIN_i[9][5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0011051155110511"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[2]\,
      I1 => \bytesIN_i[9][7]_i_4_3\(5),
      I2 => \bytesIN_i[9][7]_i_4_4\(5),
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i[9][7]_i_4_5\(5),
      O => \bytesIN_i[9][5]_i_5_n_0\
    );
\bytesIN_i[9][5]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      O => \bytesIN_i[9][5]_i_6_n_0\
    );
\bytesIN_i[9][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACFCFAAAA0000AA"
    )
        port map (
      I0 => \bytesIN_i[9][6]_i_2_n_0\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_0\,
      I4 => \bytesIN_i_reg[0][4]_1\,
      I5 => \bytesIN_i[9][6]_i_3_n_0\,
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
\bytesIN_i[9][6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000EAFF"
    )
        port map (
      I0 => \bytesIN_i[9][6]_i_4_n_0\,
      I1 => \bytesIN_i[9][6]_i_5_n_0\,
      I2 => \bytesIN_i[9][7]_i_4_2\(6),
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \bytesIN_i[9][6]_i_6_n_0\,
      I5 => \bytesIN_i[9][7]_i_8_n_0\,
      O => \bytesIN_i[9][6]_i_3_n_0\
    );
\bytesIN_i[9][6]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => Q(6),
      I1 => \bytesIN_i[9][7]_i_4_1\(6),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \bytesIN_i[9][7]_i_4_0\(6),
      O => \bytesIN_i[9][6]_i_4_n_0\
    );
\bytesIN_i[9][6]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][6]_i_5_n_0\
    );
\bytesIN_i[9][6]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0011031133110311"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_3\(6),
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \bytesIN_i[9][7]_i_4_4\(6),
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[0]\,
      I5 => \bytesIN_i[9][7]_i_4_5\(6),
      O => \bytesIN_i[9][6]_i_6_n_0\
    );
\bytesIN_i[9][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000200000"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => stt(1),
      I5 => rdy_t,
      O => \bytesIN_i[9][7]_i_1_n_0\
    );
\bytesIN_i[9][7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AACFCFAAAA0000AA"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_3_n_0\,
      I1 => \nByteCount_reg_n_0_[1]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \bytesIN_i_reg[0][4]_0\,
      I4 => \bytesIN_i_reg[0][4]_1\,
      I5 => \bytesIN_i[9][7]_i_4_n_0\,
      O => \bytesIN[9]_0\(7)
    );
\bytesIN_i[9][7]_i_3\: unisim.vcomponents.LUT6
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
      O => \bytesIN_i[9][7]_i_3_n_0\
    );
\bytesIN_i[9][7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000BAFF"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_5_n_0\,
      I1 => \bytesIN_i[9][7]_i_6_n_0\,
      I2 => Q(7),
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \bytesIN_i[9][7]_i_7_n_0\,
      I5 => \bytesIN_i[9][7]_i_8_n_0\,
      O => \bytesIN_i[9][7]_i_4_n_0\
    );
\bytesIN_i[9][7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FAC00AC0"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_0\(7),
      I1 => \bytesIN_i[9][7]_i_4_1\(7),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \bytesIN_i[9][7]_i_4_2\(7),
      O => \bytesIN_i[9][7]_i_5_n_0\
    );
\bytesIN_i[9][7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[0]\,
      I1 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][7]_i_6_n_0\
    );
\bytesIN_i[9][7]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00004700000047FF"
    )
        port map (
      I0 => \bytesIN_i[9][7]_i_4_5\(7),
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \bytesIN_i[9][7]_i_4_4\(7),
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[2]\,
      I5 => \bytesIN_i[9][7]_i_4_3\(7),
      O => \bytesIN_i[9][7]_i_7_n_0\
    );
\bytesIN_i[9][7]_i_8\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A2"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[3]\,
      I1 => \nByteCount_reg_n_0_[0]\,
      I2 => \nByteCount_reg_n_0_[1]\,
      O => \bytesIN_i[9][7]_i_8_n_0\
    );
\bytesIN_i_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg[0]\(0),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg[0]\(1),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg[0]\(2),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg[0]\(3),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg[0]\(4),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg[0]\(5),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg[0]\(6),
      R => startOUT_t0
    );
\bytesIN_i_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg[0]\(7),
      R => startOUT_t0
    );
\bytesIN_i_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[1][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[1][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[1][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[1][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[1][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[1][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[1][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1]_2\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[1][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[2][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[2][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[2][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[2][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[2][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[2][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[2][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2]_1\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[2][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[3][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[3][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[3][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[3][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[3][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[3][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[3][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[3][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[4][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[4][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[4][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[4][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[4][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[4][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[4][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[4][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[5][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[5][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[5][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[5][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[5][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[5][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[5][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[5][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[6][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[6][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[6][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[6][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[6][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[6][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[6][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6]_3\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[6][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[7][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[7][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[7][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[7][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[7][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[7][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[7][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[7][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[7][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[7][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[8][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[8][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[8][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[8][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[8][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[8][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[8][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[8][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[8][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[8][7]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(0),
      Q => \bytesIN_i_reg_n_0_[9][0]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(1),
      Q => \bytesIN_i_reg_n_0_[9][1]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(2),
      Q => \bytesIN_i_reg_n_0_[9][2]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(3),
      Q => \bytesIN_i_reg_n_0_[9][3]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(4),
      Q => \bytesIN_i_reg_n_0_[9][4]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(5),
      Q => \bytesIN_i_reg_n_0_[9][5]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(6),
      Q => \bytesIN_i_reg_n_0_[9][6]\,
      R => startOUT_t0
    );
\bytesIN_i_reg[9][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[9][7]_i_1_n_0\,
      D => \bytesIN[9]_0\(7),
      Q => \bytesIN_i_reg_n_0_[9][7]\,
      R => startOUT_t0
    );
followED_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => leadED_reg_n_0,
      I1 => stt(1),
      I2 => rdy_t,
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
      I1 => stt(1),
      I2 => rdy_t,
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
      INIT => X"0000000000000400"
    )
        port map (
      I0 => rdy_t,
      I1 => stt(1),
      I2 => \nByteCount_reg_n_0_[0]\,
      I3 => \nByteCount_reg_n_0_[1]\,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \nByteCount_reg_n_0_[2]\,
      O => \bytesIN_i[1]_2\
    );
lxDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \bytesIN_i[1]_2\,
      Q => lxDone_reg_n_0,
      R => '0'
    );
lxFlag_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \byteCountIN_i_reg[0]_0\,
      I1 => stt(1),
      I2 => rdy_t,
      O => byteCountIN_i_0
    );
lxFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteCountIN_i_0,
      Q => lxFlag_reg_n_0,
      R => '0'
    );
\nByteCount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40EFFFFF40EF0000"
    )
        port map (
      I0 => rdy_t,
      I1 => byteCountIN_i(0),
      I2 => \nByteCount[3]_i_4_n_0\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => stt(1),
      I5 => byteCountIN_w(0),
      O => nByteCount(0)
    );
\nByteCount[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000E2E200"
    )
        port map (
      I0 => uifByteCount(0),
      I1 => srcSel,
      I2 => byteCount(0),
      I3 => \bytesIN_i_reg[0][4]_1\,
      I4 => \bytesIN_i_reg[0][4]_0\,
      I5 => done0,
      O => byteCountIN_w(0)
    );
\nByteCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88B8888888888888"
    )
        port map (
      I0 => \nByteCount[1]_i_2_n_0\,
      I1 => stt(1),
      I2 => \nByteCount[2]_i_3_n_0\,
      I3 => done0,
      I4 => byteCount(1),
      I5 => srcSel,
      O => nByteCount(1)
    );
\nByteCount[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0F40F0F0F0E"
    )
        port map (
      I0 => rdy_t,
      I1 => byteCountIN_i(1),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \nByteCount_reg_n_0_[0]\,
      O => \nByteCount[1]_i_2_n_0\
    );
\nByteCount[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88888888B8888888"
    )
        port map (
      I0 => \nByteCount[2]_i_2_n_0\,
      I1 => stt(1),
      I2 => byteCount(2),
      I3 => srcSel,
      I4 => \nByteCount[2]_i_3_n_0\,
      I5 => done0,
      O => nByteCount(2)
    );
\nByteCount[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF04F00FF00E"
    )
        port map (
      I0 => rdy_t,
      I1 => byteCountIN_i(2),
      I2 => \nByteCount_reg_n_0_[1]\,
      I3 => \nByteCount_reg_n_0_[2]\,
      I4 => \nByteCount_reg_n_0_[3]\,
      I5 => \nByteCount_reg_n_0_[0]\,
      O => \nByteCount[2]_i_2_n_0\
    );
\nByteCount[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \bytesIN_i_reg[0][4]_1\,
      I1 => \bytesIN_i_reg[0][4]_0\,
      O => \nByteCount[2]_i_3_n_0\
    );
\nByteCount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4C407C707C707C70"
    )
        port map (
      I0 => \nByteCount[3]_i_3_n_0\,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => \byteCountIN_i_reg[0]_0\,
      I4 => \nByteCount[3]_i_4_n_0\,
      I5 => oneByte_reg_n_0,
      O => \nByteCount[3]_i_1_n_0\
    );
\nByteCount[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C0C0C0C0C0C0C008"
    )
        port map (
      I0 => rdy_t,
      I1 => stt(1),
      I2 => \nByteCount_reg_n_0_[3]\,
      I3 => \nByteCount_reg_n_0_[0]\,
      I4 => \nByteCount_reg_n_0_[1]\,
      I5 => \nByteCount_reg_n_0_[2]\,
      O => nByteCount(3)
    );
\nByteCount[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEFFAFAF"
    )
        port map (
      I0 => \byteOUT_t[7]_i_4_n_0\,
      I1 => \^startout\,
      I2 => TxReady,
      I3 => nxByteED,
      I4 => sxFlag_reg_n_0,
      O => \nByteCount[3]_i_3_n_0\
    );
\nByteCount[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \nByteCount_reg_n_0_[1]\,
      I1 => \nByteCount_reg_n_0_[2]\,
      I2 => \nByteCount_reg_n_0_[3]\,
      O => \nByteCount[3]_i_4_n_0\
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
      I2 => stt(1),
      I3 => rdy_t,
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
      INIT => X"3030B8B80030B8B8"
    )
        port map (
      I0 => \byteCountIN_i_reg[0]_0\,
      I1 => oneByte_i_2_n_0,
      I2 => oneByte_reg_n_0,
      I3 => \nByteCount[3]_i_4_n_0\,
      I4 => stt(1),
      I5 => rdy_t,
      O => oneByte_i_1_n_0
    );
oneByte_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000800"
    )
        port map (
      I0 => byteCountIN_w(0),
      I1 => \byteCountIN_i_reg[0]_0\,
      I2 => stt(1),
      I3 => rdy_t,
      I4 => oneByte_reg_0,
      I5 => byteCountIN_w(1),
      O => oneByte_i_2_n_0
    );
oneByte_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"06000000"
    )
        port map (
      I0 => \bytesIN_i_reg[0][4]_1\,
      I1 => \bytesIN_i_reg[0][4]_0\,
      I2 => done0,
      I3 => byteCount(1),
      I4 => srcSel,
      O => byteCountIN_w(1)
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
      INIT => X"D0CCCC00"
    )
        port map (
      I0 => sxFlag_reg_n_0,
      I1 => \^startout\,
      I2 => TxReady,
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
sxDone_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => \byteOUT_t[7]_i_4_n_0\,
      I1 => rdy_t,
      I2 => stt(1),
      I3 => sxDone_reg_n_0,
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
sxFlag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7F887F00"
    )
        port map (
      I0 => rdy_t,
      I1 => stt(1),
      I2 => \byteOUT_t[7]_i_4_n_0\,
      I3 => sxFlag_reg_n_0,
      I4 => TxReady,
      O => sxFlag_i_1_n_0
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
entity onCtrl_s is
  port (
    byteFlag : out STD_LOGIC;
    PRst_OBUF : out STD_LOGIC;
    Vbat_OBUF : out STD_LOGIC;
    Vddc_OBUF : out STD_LOGIC;
    byteCount : out STD_LOGIC_VECTOR ( 2 downto 0 );
    rdy_OBUF : out STD_LOGIC;
    \OLEDBytes_t_reg[2]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    \OLEDBytes_t_reg[5]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \OLEDBytes_t_reg[1]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    srcSel_reg : out STD_LOGIC;
    srcSel_reg_0 : out STD_LOGIC;
    \byteCount_t_reg[0]_0\ : out STD_LOGIC;
    \OLEDBytes_t_reg[2][4]_0\ : out STD_LOGIC;
    srcSel_reg_1 : out STD_LOGIC;
    \OLEDBytes_t_reg[0][5]_0\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    srcSel_reg_2 : out STD_LOGIC;
    srcSel_reg_3 : out STD_LOGIC;
    OLEDRdy_t_reg_0 : out STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    srcSel : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    \bytesIN_i_reg[0][7]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rst_IBUF : in STD_LOGIC;
    sw_IBUF : in STD_LOGIC
  );
end onCtrl_s;

architecture STRUCTURE of onCtrl_s is
  signal \FSM_sequential_stt[0]_i_2__0_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_sequential_stt[3]_i_2_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[0][5]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[0][5]_i_2_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[1][0]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[2][1]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[2][4]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t[3]_0\ : STD_LOGIC;
  signal \OLEDBytes_t[5][0]_i_1_n_0\ : STD_LOGIC;
  signal \OLEDBytes_t_reg[0]\ : STD_LOGIC_VECTOR ( 5 to 5 );
  signal \^oledbytes_t_reg[1]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^oledbytes_t_reg[2]\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^oledbytes_t_reg[5]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal OLEDPRst_t : STD_LOGIC;
  signal OLEDPRst_t_i_1_n_0 : STD_LOGIC;
  signal OLEDRdy_t : STD_LOGIC;
  signal OLEDRdy_t_i_1_n_0 : STD_LOGIC;
  signal OLEDVbat_t : STD_LOGIC;
  signal OLEDVbat_t_i_1_n_0 : STD_LOGIC;
  signal OLEDVddc_t : STD_LOGIC;
  signal OLEDVddc_t_i_1_n_0 : STD_LOGIC;
  signal \^bytecount\ : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal byteCount_t : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCount_t[1]_i_1_n_0\ : STD_LOGIC;
  signal \^byteflag\ : STD_LOGIC;
  signal byteFlag_t : STD_LOGIC;
  signal byteFlag_t_i_10_n_0 : STD_LOGIC;
  signal byteFlag_t_i_11_n_0 : STD_LOGIC;
  signal byteFlag_t_i_12_n_0 : STD_LOGIC;
  signal byteFlag_t_i_13_n_0 : STD_LOGIC;
  signal byteFlag_t_i_14_n_0 : STD_LOGIC;
  signal byteFlag_t_i_2_n_0 : STD_LOGIC;
  signal byteFlag_t_i_3_n_0 : STD_LOGIC;
  signal byteFlag_t_i_4_n_0 : STD_LOGIC;
  signal byteFlag_t_i_5_n_0 : STD_LOGIC;
  signal byteFlag_t_i_6_n_0 : STD_LOGIC;
  signal byteFlag_t_i_7_n_0 : STD_LOGIC;
  signal byteFlag_t_i_8_n_0 : STD_LOGIC;
  signal byteFlag_t_i_9_n_0 : STD_LOGIC;
  signal delay100ms : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \delay100ms[0]_i_1_n_0\ : STD_LOGIC;
  signal \delay100ms[23]_i_1_n_0\ : STD_LOGIC;
  signal \delay100ms[23]_i_2_n_0\ : STD_LOGIC;
  signal delay2ms : STD_LOGIC_VECTOR ( 19 downto 0 );
  signal \delay2ms[0]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[10]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[11]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[12]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[13]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[14]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[15]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[16]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[17]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[18]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[19]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[19]_i_2_n_0\ : STD_LOGIC;
  signal \delay2ms[19]_i_3_n_0\ : STD_LOGIC;
  signal \delay2ms[1]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[2]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[3]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[4]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[5]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[6]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[7]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[8]_i_1_n_0\ : STD_LOGIC;
  signal \delay2ms[9]_i_1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_0\ : STD_LOGIC;
  signal \plusOp_carry__0_n_1\ : STD_LOGIC;
  signal \plusOp_carry__0_n_2\ : STD_LOGIC;
  signal \plusOp_carry__0_n_3\ : STD_LOGIC;
  signal \plusOp_carry__0_n_4\ : STD_LOGIC;
  signal \plusOp_carry__0_n_5\ : STD_LOGIC;
  signal \plusOp_carry__0_n_6\ : STD_LOGIC;
  signal \plusOp_carry__0_n_7\ : STD_LOGIC;
  signal \plusOp_carry__1_n_0\ : STD_LOGIC;
  signal \plusOp_carry__1_n_1\ : STD_LOGIC;
  signal \plusOp_carry__1_n_2\ : STD_LOGIC;
  signal \plusOp_carry__1_n_3\ : STD_LOGIC;
  signal \plusOp_carry__1_n_4\ : STD_LOGIC;
  signal \plusOp_carry__1_n_5\ : STD_LOGIC;
  signal \plusOp_carry__1_n_6\ : STD_LOGIC;
  signal \plusOp_carry__1_n_7\ : STD_LOGIC;
  signal \plusOp_carry__2_n_0\ : STD_LOGIC;
  signal \plusOp_carry__2_n_1\ : STD_LOGIC;
  signal \plusOp_carry__2_n_2\ : STD_LOGIC;
  signal \plusOp_carry__2_n_3\ : STD_LOGIC;
  signal \plusOp_carry__2_n_4\ : STD_LOGIC;
  signal \plusOp_carry__2_n_5\ : STD_LOGIC;
  signal \plusOp_carry__2_n_6\ : STD_LOGIC;
  signal \plusOp_carry__2_n_7\ : STD_LOGIC;
  signal \plusOp_carry__3_n_2\ : STD_LOGIC;
  signal \plusOp_carry__3_n_3\ : STD_LOGIC;
  signal \plusOp_carry__3_n_5\ : STD_LOGIC;
  signal \plusOp_carry__3_n_6\ : STD_LOGIC;
  signal \plusOp_carry__3_n_7\ : STD_LOGIC;
  signal plusOp_carry_n_0 : STD_LOGIC;
  signal plusOp_carry_n_1 : STD_LOGIC;
  signal plusOp_carry_n_2 : STD_LOGIC;
  signal plusOp_carry_n_3 : STD_LOGIC;
  signal plusOp_carry_n_4 : STD_LOGIC;
  signal plusOp_carry_n_5 : STD_LOGIC;
  signal plusOp_carry_n_6 : STD_LOGIC;
  signal plusOp_carry_n_7 : STD_LOGIC;
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
  signal \plusOp_inferred__0/i__carry__4_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry__4_n_7\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \plusOp_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal powerOff_i_1_n_0 : STD_LOGIC;
  signal powerOff_reg_n_0 : STD_LOGIC;
  signal powerOn : STD_LOGIC;
  signal powerOn_reg_n_0 : STD_LOGIC;
  signal \^rdy_obuf\ : STD_LOGIC;
  signal rstDone : STD_LOGIC;
  signal \rstDone_i_1__0_n_0\ : STD_LOGIC;
  signal running_i_1_n_0 : STD_LOGIC;
  signal running_reg_n_0 : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sttFlag : STD_LOGIC;
  signal sttFlag_reg_n_0 : STD_LOGIC;
  signal \stt__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_plusOp_carry__3_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_carry__3_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_plusOp_inferred__0/i__carry__4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_plusOp_inferred__0/i__carry__4_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_stt[3]_i_2\ : label is "soft_lutpair23";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[2]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[3]\ : label is "s2:0100,s1:0011,s0:0010,rststt:0000,idle:0001,s5:0111,iSTATE:1000,s4:0110,s3:0101";
  attribute SOFT_HLUTNM of \LxCount[0]_i_3\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \LxCount[1]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \LxCount[2]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \OLEDBytes_t[0][4]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \OLEDBytes_t[0][5]_i_2\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \byteCount_t[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \byteCount_t[2]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \bytesIN_i[6][0]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \bytesIN_i[6][6]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \bytesIN_i[6][7]_i_4\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \bytesIN_i[6][7]_i_5\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \delay2ms[10]_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \delay2ms[11]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \delay2ms[12]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \delay2ms[13]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \delay2ms[14]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \delay2ms[15]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \delay2ms[16]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \delay2ms[17]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \delay2ms[18]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \delay2ms[1]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \delay2ms[2]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \delay2ms[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \delay2ms[4]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \delay2ms[5]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \delay2ms[6]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \delay2ms[7]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \delay2ms[8]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \delay2ms[9]_i_1\ : label is "soft_lutpair31";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of plusOp_carry : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__0\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__1\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__2\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__3\ : label is 35;
  attribute ADDER_THRESHOLD of \plusOp_inferred__0/i__carry__4\ : label is 35;
  attribute SOFT_HLUTNM of \rstDone_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of srcSel_i_1 : label is "soft_lutpair24";
begin
  \OLEDBytes_t_reg[1]\(0) <= \^oledbytes_t_reg[1]\(0);
  \OLEDBytes_t_reg[2]\(1 downto 0) <= \^oledbytes_t_reg[2]\(1 downto 0);
  \OLEDBytes_t_reg[5]\(0) <= \^oledbytes_t_reg[5]\(0);
  byteCount(2 downto 0) <= \^bytecount\(2 downto 0);
  byteFlag <= \^byteflag\;
  rdy_OBUF <= \^rdy_obuf\;
\FSM_sequential_stt[0]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5F4F5F5E5F4A0A0"
    )
        port map (
      I0 => stt(3),
      I1 => stt(1),
      I2 => sttFlag_reg_n_0,
      I3 => stt(0),
      I4 => stt(2),
      I5 => \FSM_sequential_stt[0]_i_2__0_n_0\,
      O => \stt__0\(0)
    );
\FSM_sequential_stt[0]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003BBBB00038888"
    )
        port map (
      I0 => sttFlag_reg_n_0,
      I1 => stt(1),
      I2 => powerOff_reg_n_0,
      I3 => powerOn_reg_n_0,
      I4 => stt(0),
      I5 => rstDone,
      O => \FSM_sequential_stt[0]_i_2__0_n_0\
    );
\FSM_sequential_stt[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0550054055000540"
    )
        port map (
      I0 => stt(3),
      I1 => powerOn_reg_n_0,
      I2 => stt(0),
      I3 => stt(1),
      I4 => stt(2),
      I5 => sttFlag_reg_n_0,
      O => \FSM_sequential_stt[1]_i_1__1_n_0\
    );
\FSM_sequential_stt[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"15405540"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => sttFlag_reg_n_0,
      O => \FSM_sequential_stt[2]_i_1_n_0\
    );
\FSM_sequential_stt[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555000055550C00"
    )
        port map (
      I0 => sttFlag_reg_n_0,
      I1 => stt(0),
      I2 => powerOn_reg_n_0,
      I3 => powerOff_reg_n_0,
      I4 => stt(3),
      I5 => \FSM_sequential_stt[3]_i_2_n_0\,
      O => \stt__0\(3)
    );
\FSM_sequential_stt[3]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => stt(1),
      I1 => stt(2),
      O => \FSM_sequential_stt[3]_i_2_n_0\
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
      D => \FSM_sequential_stt[1]_i_1__1_n_0\,
      Q => stt(1),
      R => rst_IBUF
    );
\FSM_sequential_stt_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \FSM_sequential_stt[2]_i_1_n_0\,
      Q => stt(2),
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
\LxCount[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^bytecount\(0),
      I1 => srcSel,
      I2 => uifByteCount(0),
      O => \byteCount_t_reg[0]_0\
    );
\LxCount[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => srcSel,
      I1 => \^bytecount\(1),
      O => srcSel_reg_0
    );
\LxCount[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => srcSel,
      I1 => \^bytecount\(2),
      O => srcSel_reg
    );
\OLEDBytes_t[0][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => stt(3),
      I1 => stt(2),
      I2 => stt(1),
      O => \OLEDBytes_t[0][4]_i_1_n_0\
    );
\OLEDBytes_t[0][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF80038C33"
    )
        port map (
      I0 => byteFlag_t_i_2_n_0,
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => byteFlag_t_i_3_n_0,
      I5 => stt(3),
      O => \OLEDBytes_t[0][5]_i_1_n_0\
    );
\OLEDBytes_t[0][5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => stt(1),
      I1 => stt(2),
      I2 => stt(3),
      O => \OLEDBytes_t[0][5]_i_2_n_0\
    );
\OLEDBytes_t[1][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2E2E2E2E2E2E2E20"
    )
        port map (
      I0 => \^oledbytes_t_reg[1]\(0),
      I1 => \OLEDBytes_t[3]_0\,
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(0),
      I5 => stt(3),
      O => \OLEDBytes_t[1][0]_i_1_n_0\
    );
\OLEDBytes_t[2][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2E2E2E2E2E2E2E0"
    )
        port map (
      I0 => \^oledbytes_t_reg[2]\(0),
      I1 => \OLEDBytes_t[3]_0\,
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(0),
      I5 => stt(3),
      O => \OLEDBytes_t[2][1]_i_1_n_0\
    );
\OLEDBytes_t[2][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEEEEEEEEEE0"
    )
        port map (
      I0 => \^oledbytes_t_reg[2]\(1),
      I1 => \OLEDBytes_t[3]_0\,
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(0),
      I5 => stt(3),
      O => \OLEDBytes_t[2][4]_i_1_n_0\
    );
\OLEDBytes_t[2][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000C0400040"
    )
        port map (
      I0 => byteFlag_t_i_3_n_0,
      I1 => stt(0),
      I2 => stt(2),
      I3 => stt(1),
      I4 => byteFlag_t_i_2_n_0,
      I5 => stt(3),
      O => \OLEDBytes_t[3]_0\
    );
\OLEDBytes_t[5][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAEAAAAAA0"
    )
        port map (
      I0 => \^oledbytes_t_reg[5]\(0),
      I1 => byteFlag_t_i_2_n_0,
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(0),
      I5 => stt(3),
      O => \OLEDBytes_t[5][0]_i_1_n_0\
    );
\OLEDBytes_t_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \OLEDBytes_t[0][5]_i_1_n_0\,
      D => \OLEDBytes_t[0][4]_i_1_n_0\,
      Q => Q(0),
      R => '0'
    );
\OLEDBytes_t_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \OLEDBytes_t[0][5]_i_1_n_0\,
      D => \OLEDBytes_t[0][5]_i_2_n_0\,
      Q => \OLEDBytes_t_reg[0]\(5),
      R => '0'
    );
\OLEDBytes_t_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \OLEDBytes_t[1][0]_i_1_n_0\,
      Q => \^oledbytes_t_reg[1]\(0),
      R => '0'
    );
\OLEDBytes_t_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \OLEDBytes_t[2][1]_i_1_n_0\,
      Q => \^oledbytes_t_reg[2]\(0),
      R => '0'
    );
\OLEDBytes_t_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \OLEDBytes_t[2][4]_i_1_n_0\,
      Q => \^oledbytes_t_reg[2]\(1),
      R => '0'
    );
\OLEDBytes_t_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \OLEDBytes_t[5][0]_i_1_n_0\,
      Q => \^oledbytes_t_reg[5]\(0),
      R => '0'
    );
OLEDPRst_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"03000013"
    )
        port map (
      I0 => byteFlag_t_i_3_n_0,
      I1 => stt(3),
      I2 => stt(2),
      I3 => stt(1),
      I4 => stt(0),
      O => OLEDPRst_t_i_1_n_0
    );
OLEDPRst_t_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(1),
      O => OLEDPRst_t
    );
OLEDPRst_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => OLEDPRst_t_i_1_n_0,
      D => OLEDPRst_t,
      Q => PRst_OBUF,
      R => '0'
    );
OLEDRdy_t_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000FFFC00008000"
    )
        port map (
      I0 => byteFlag_t_i_2_n_0,
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(3),
      I5 => \^rdy_obuf\,
      O => OLEDRdy_t_i_1_n_0
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
      R => '0'
    );
OLEDVbat_t_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1001"
    )
        port map (
      I0 => stt(3),
      I1 => stt(0),
      I2 => stt(2),
      I3 => stt(1),
      O => OLEDVbat_t_i_1_n_0
    );
OLEDVbat_t_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(2),
      O => OLEDVbat_t
    );
OLEDVbat_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => OLEDVbat_t_i_1_n_0,
      D => OLEDVbat_t,
      Q => Vbat_OBUF,
      R => '0'
    );
OLEDVddc_t_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => stt(3),
      I1 => stt(2),
      I2 => stt(1),
      O => OLEDVddc_t_i_1_n_0
    );
OLEDVddc_t_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => stt(0),
      O => OLEDVddc_t
    );
OLEDVddc_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => OLEDVddc_t_i_1_n_0,
      D => OLEDVddc_t,
      Q => Vddc_OBUF,
      R => '0'
    );
\byteCount_t[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => stt(1),
      I1 => stt(3),
      O => byteCount_t(0)
    );
\byteCount_t[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => stt(3),
      I1 => stt(2),
      I2 => stt(1),
      O => \byteCount_t[1]_i_1_n_0\
    );
\byteCount_t[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => stt(2),
      I1 => stt(3),
      O => OLEDRdy_t
    );
\byteCount_t_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \OLEDBytes_t[0][5]_i_1_n_0\,
      D => byteCount_t(0),
      Q => \^bytecount\(0),
      R => '0'
    );
\byteCount_t_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \OLEDBytes_t[0][5]_i_1_n_0\,
      D => \byteCount_t[1]_i_1_n_0\,
      Q => \^bytecount\(1),
      R => '0'
    );
\byteCount_t_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \OLEDBytes_t[0][5]_i_1_n_0\,
      D => OLEDRdy_t,
      Q => \^bytecount\(2),
      R => '0'
    );
byteFlag_t_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => delay2ms(11),
      I1 => delay2ms(13),
      I2 => delay2ms(7),
      I3 => delay2ms(1),
      O => byteFlag_t_i_10_n_0
    );
byteFlag_t_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => delay2ms(10),
      I1 => delay2ms(12),
      I2 => delay2ms(3),
      I3 => delay2ms(0),
      O => byteFlag_t_i_11_n_0
    );
byteFlag_t_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => delay2ms(16),
      I1 => delay2ms(19),
      I2 => delay2ms(6),
      I3 => delay2ms(18),
      O => byteFlag_t_i_12_n_0
    );
byteFlag_t_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => delay2ms(8),
      I1 => delay2ms(5),
      I2 => delay2ms(17),
      I3 => delay2ms(15),
      O => byteFlag_t_i_13_n_0
    );
byteFlag_t_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => delay2ms(9),
      I1 => delay2ms(4),
      I2 => delay2ms(2),
      I3 => delay2ms(14),
      O => byteFlag_t_i_14_n_0
    );
\byteFlag_t_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF8000FFFF8C30"
    )
        port map (
      I0 => byteFlag_t_i_2_n_0,
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(3),
      I5 => byteFlag_t_i_3_n_0,
      O => byteFlag_t
    );
byteFlag_t_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000004"
    )
        port map (
      I0 => byteFlag_t_i_4_n_0,
      I1 => byteFlag_t_i_5_n_0,
      I2 => byteFlag_t_i_6_n_0,
      I3 => byteFlag_t_i_7_n_0,
      I4 => byteFlag_t_i_8_n_0,
      I5 => byteFlag_t_i_9_n_0,
      O => byteFlag_t_i_2_n_0
    );
byteFlag_t_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => byteFlag_t_i_10_n_0,
      I1 => byteFlag_t_i_11_n_0,
      I2 => byteFlag_t_i_12_n_0,
      I3 => byteFlag_t_i_13_n_0,
      I4 => byteFlag_t_i_14_n_0,
      O => byteFlag_t_i_3_n_0
    );
byteFlag_t_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => delay100ms(9),
      I1 => delay100ms(5),
      I2 => delay100ms(21),
      I3 => delay100ms(17),
      O => byteFlag_t_i_4_n_0
    );
byteFlag_t_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => delay100ms(13),
      I1 => delay100ms(15),
      I2 => delay100ms(19),
      I3 => delay100ms(1),
      O => byteFlag_t_i_5_n_0
    );
byteFlag_t_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => delay100ms(18),
      I1 => delay100ms(11),
      I2 => delay100ms(3),
      I3 => delay100ms(14),
      O => byteFlag_t_i_6_n_0
    );
byteFlag_t_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => delay100ms(4),
      I1 => delay100ms(10),
      I2 => delay100ms(2),
      I3 => delay100ms(6),
      O => byteFlag_t_i_7_n_0
    );
byteFlag_t_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => delay100ms(8),
      I1 => delay100ms(7),
      I2 => delay100ms(23),
      I3 => delay100ms(12),
      O => byteFlag_t_i_8_n_0
    );
byteFlag_t_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => delay100ms(20),
      I1 => delay100ms(0),
      I2 => delay100ms(22),
      I3 => delay100ms(16),
      O => byteFlag_t_i_9_n_0
    );
byteFlag_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteFlag_t,
      Q => \^byteflag\,
      R => '0'
    );
\bytesIN_i[6][0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => srcSel,
      I1 => \^oledbytes_t_reg[5]\(0),
      O => srcSel_reg_1
    );
\bytesIN_i[6][6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => srcSel,
      I1 => \^oledbytes_t_reg[2]\(0),
      O => srcSel_reg_3
    );
\bytesIN_i[6][6]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => srcSel,
      I1 => \^oledbytes_t_reg[1]\(0),
      O => srcSel_reg_2
    );
\bytesIN_i[6][7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OLEDBytes_t_reg[0]\(5),
      I1 => srcSel,
      I2 => uifByteCount(0),
      O => \OLEDBytes_t_reg[0][5]_0\
    );
\bytesIN_i[6][7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE000200"
    )
        port map (
      I0 => \^oledbytes_t_reg[2]\(1),
      I1 => \bytesIN_i_reg[0][7]\(0),
      I2 => \bytesIN_i_reg[0][7]\(1),
      I3 => srcSel,
      I4 => \^oledbytes_t_reg[5]\(0),
      O => \OLEDBytes_t_reg[2][4]_0\
    );
\delay100ms[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF6E0080"
    )
        port map (
      I0 => stt(2),
      I1 => stt(1),
      I2 => stt(0),
      I3 => stt(3),
      I4 => delay100ms(0),
      O => \delay100ms[0]_i_1_n_0\
    );
\delay100ms[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000033"
    )
        port map (
      I0 => byteFlag_t_i_2_n_0,
      I1 => stt(3),
      I2 => stt(0),
      I3 => stt(1),
      I4 => stt(2),
      O => \delay100ms[23]_i_1_n_0\
    );
\delay100ms[23]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0091"
    )
        port map (
      I0 => stt(2),
      I1 => stt(1),
      I2 => stt(0),
      I3 => stt(3),
      O => \delay100ms[23]_i_2_n_0\
    );
\delay100ms_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \delay100ms[0]_i_1_n_0\,
      Q => delay100ms(0),
      R => '0'
    );
\delay100ms_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_6\,
      Q => delay100ms(10),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_5\,
      Q => delay100ms(11),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_4\,
      Q => delay100ms(12),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_7\,
      Q => delay100ms(13),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_6\,
      Q => delay100ms(14),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_5\,
      Q => delay100ms(15),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__2_n_4\,
      Q => delay100ms(16),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_7\,
      Q => delay100ms(17),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_6\,
      Q => delay100ms(18),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_5\,
      Q => delay100ms(19),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_7\,
      Q => delay100ms(1),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__3_n_4\,
      Q => delay100ms(20),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_7\,
      Q => delay100ms(21),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_6\,
      Q => delay100ms(22),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__4_n_5\,
      Q => delay100ms(23),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_6\,
      Q => delay100ms(2),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_5\,
      Q => delay100ms(3),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry_n_4\,
      Q => delay100ms(4),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_7\,
      Q => delay100ms(5),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_6\,
      Q => delay100ms(6),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_5\,
      Q => delay100ms(7),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__0_n_4\,
      Q => delay100ms(8),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay100ms_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay100ms[23]_i_2_n_0\,
      D => \plusOp_inferred__0/i__carry__1_n_7\,
      Q => delay100ms(9),
      R => \delay100ms[23]_i_1_n_0\
    );
\delay2ms[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0CF00000A2F"
    )
        port map (
      I0 => byteFlag_t_i_3_n_0,
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(3),
      I5 => delay2ms(0),
      O => \delay2ms[0]_i_1_n_0\
    );
\delay2ms[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__1_n_6\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[10]_i_1_n_0\
    );
\delay2ms[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__1_n_5\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[11]_i_1_n_0\
    );
\delay2ms[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__1_n_4\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[12]_i_1_n_0\
    );
\delay2ms[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__2_n_7\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[13]_i_1_n_0\
    );
\delay2ms[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__2_n_6\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[14]_i_1_n_0\
    );
\delay2ms[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__2_n_5\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[15]_i_1_n_0\
    );
\delay2ms[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__2_n_4\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[16]_i_1_n_0\
    );
\delay2ms[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__3_n_7\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[17]_i_1_n_0\
    );
\delay2ms[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__3_n_6\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[18]_i_1_n_0\
    );
\delay2ms[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000515"
    )
        port map (
      I0 => stt(3),
      I1 => stt(2),
      I2 => stt(1),
      I3 => stt(0),
      I4 => byteFlag_t_i_3_n_0,
      O => \delay2ms[19]_i_1_n_0\
    );
\delay2ms[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0037"
    )
        port map (
      I0 => stt(0),
      I1 => stt(1),
      I2 => stt(2),
      I3 => stt(3),
      O => \delay2ms[19]_i_2_n_0\
    );
\delay2ms[19]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__3_n_5\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[19]_i_3_n_0\
    );
\delay2ms[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => plusOp_carry_n_7,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[1]_i_1_n_0\
    );
\delay2ms[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => plusOp_carry_n_6,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[2]_i_1_n_0\
    );
\delay2ms[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => plusOp_carry_n_5,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[3]_i_1_n_0\
    );
\delay2ms[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => plusOp_carry_n_4,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[4]_i_1_n_0\
    );
\delay2ms[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__0_n_7\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[5]_i_1_n_0\
    );
\delay2ms[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__0_n_6\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[6]_i_1_n_0\
    );
\delay2ms[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__0_n_5\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[7]_i_1_n_0\
    );
\delay2ms[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__0_n_4\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[8]_i_1_n_0\
    );
\delay2ms[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A8"
    )
        port map (
      I0 => \plusOp_carry__1_n_7\,
      I1 => stt(2),
      I2 => stt(1),
      O => \delay2ms[9]_i_1_n_0\
    );
\delay2ms_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \delay2ms[0]_i_1_n_0\,
      Q => delay2ms(0),
      R => '0'
    );
\delay2ms_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[10]_i_1_n_0\,
      Q => delay2ms(10),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[11]_i_1_n_0\,
      Q => delay2ms(11),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[12]_i_1_n_0\,
      Q => delay2ms(12),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[13]_i_1_n_0\,
      Q => delay2ms(13),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[14]_i_1_n_0\,
      Q => delay2ms(14),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[15]_i_1_n_0\,
      Q => delay2ms(15),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[16]_i_1_n_0\,
      Q => delay2ms(16),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[17]_i_1_n_0\,
      Q => delay2ms(17),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[18]_i_1_n_0\,
      Q => delay2ms(18),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[19]_i_3_n_0\,
      Q => delay2ms(19),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[1]_i_1_n_0\,
      Q => delay2ms(1),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[2]_i_1_n_0\,
      Q => delay2ms(2),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[3]_i_1_n_0\,
      Q => delay2ms(3),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[4]_i_1_n_0\,
      Q => delay2ms(4),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[5]_i_1_n_0\,
      Q => delay2ms(5),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[6]_i_1_n_0\,
      Q => delay2ms(6),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[7]_i_1_n_0\,
      Q => delay2ms(7),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[8]_i_1_n_0\,
      Q => delay2ms(8),
      R => \delay2ms[19]_i_1_n_0\
    );
\delay2ms_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \delay2ms[19]_i_2_n_0\,
      D => \delay2ms[9]_i_1_n_0\,
      Q => delay2ms(9),
      R => \delay2ms[19]_i_1_n_0\
    );
plusOp_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => plusOp_carry_n_0,
      CO(2) => plusOp_carry_n_1,
      CO(1) => plusOp_carry_n_2,
      CO(0) => plusOp_carry_n_3,
      CYINIT => delay2ms(0),
      DI(3 downto 0) => B"0000",
      O(3) => plusOp_carry_n_4,
      O(2) => plusOp_carry_n_5,
      O(1) => plusOp_carry_n_6,
      O(0) => plusOp_carry_n_7,
      S(3 downto 0) => delay2ms(4 downto 1)
    );
\plusOp_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => plusOp_carry_n_0,
      CO(3) => \plusOp_carry__0_n_0\,
      CO(2) => \plusOp_carry__0_n_1\,
      CO(1) => \plusOp_carry__0_n_2\,
      CO(0) => \plusOp_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_carry__0_n_4\,
      O(2) => \plusOp_carry__0_n_5\,
      O(1) => \plusOp_carry__0_n_6\,
      O(0) => \plusOp_carry__0_n_7\,
      S(3 downto 0) => delay2ms(8 downto 5)
    );
\plusOp_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__0_n_0\,
      CO(3) => \plusOp_carry__1_n_0\,
      CO(2) => \plusOp_carry__1_n_1\,
      CO(1) => \plusOp_carry__1_n_2\,
      CO(0) => \plusOp_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_carry__1_n_4\,
      O(2) => \plusOp_carry__1_n_5\,
      O(1) => \plusOp_carry__1_n_6\,
      O(0) => \plusOp_carry__1_n_7\,
      S(3 downto 0) => delay2ms(12 downto 9)
    );
\plusOp_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__1_n_0\,
      CO(3) => \plusOp_carry__2_n_0\,
      CO(2) => \plusOp_carry__2_n_1\,
      CO(1) => \plusOp_carry__2_n_2\,
      CO(0) => \plusOp_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_carry__2_n_4\,
      O(2) => \plusOp_carry__2_n_5\,
      O(1) => \plusOp_carry__2_n_6\,
      O(0) => \plusOp_carry__2_n_7\,
      S(3 downto 0) => delay2ms(16 downto 13)
    );
\plusOp_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_carry__2_n_0\,
      CO(3 downto 2) => \NLW_plusOp_carry__3_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_carry__3_n_2\,
      CO(0) => \plusOp_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_carry__3_O_UNCONNECTED\(3),
      O(2) => \plusOp_carry__3_n_5\,
      O(1) => \plusOp_carry__3_n_6\,
      O(0) => \plusOp_carry__3_n_7\,
      S(3) => '0',
      S(2 downto 0) => delay2ms(19 downto 17)
    );
\plusOp_inferred__0/i__carry\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \plusOp_inferred__0/i__carry_n_0\,
      CO(2) => \plusOp_inferred__0/i__carry_n_1\,
      CO(1) => \plusOp_inferred__0/i__carry_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry_n_3\,
      CYINIT => delay100ms(0),
      DI(3 downto 0) => B"0000",
      O(3) => \plusOp_inferred__0/i__carry_n_4\,
      O(2) => \plusOp_inferred__0/i__carry_n_5\,
      O(1) => \plusOp_inferred__0/i__carry_n_6\,
      O(0) => \plusOp_inferred__0/i__carry_n_7\,
      S(3 downto 0) => delay100ms(4 downto 1)
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
      S(3 downto 0) => delay100ms(8 downto 5)
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
      S(3 downto 0) => delay100ms(12 downto 9)
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
      S(3 downto 0) => delay100ms(16 downto 13)
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
      S(3 downto 0) => delay100ms(20 downto 17)
    );
\plusOp_inferred__0/i__carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \plusOp_inferred__0/i__carry__3_n_0\,
      CO(3 downto 2) => \NLW_plusOp_inferred__0/i__carry__4_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \plusOp_inferred__0/i__carry__4_n_2\,
      CO(0) => \plusOp_inferred__0/i__carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_plusOp_inferred__0/i__carry__4_O_UNCONNECTED\(3),
      O(2) => \plusOp_inferred__0/i__carry__4_n_5\,
      O(1) => \plusOp_inferred__0/i__carry__4_n_6\,
      O(0) => \plusOp_inferred__0/i__carry__4_n_7\,
      S(3) => '0',
      S(2 downto 0) => delay100ms(23 downto 21)
    );
powerOff_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => stt(2),
      I1 => stt(1),
      I2 => stt(0),
      I3 => stt(3),
      I4 => running_reg_n_0,
      I5 => sw_IBUF,
      O => powerOff_i_1_n_0
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
      R => '0'
    );
powerOn_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => running_reg_n_0,
      I1 => sw_IBUF,
      I2 => stt(0),
      I3 => stt(3),
      I4 => stt(2),
      I5 => stt(1),
      O => powerOn
    );
powerOn_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => powerOn,
      Q => powerOn_reg_n_0,
      R => '0'
    );
\rstDone_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFD0001"
    )
        port map (
      I0 => stt(0),
      I1 => stt(3),
      I2 => stt(2),
      I3 => stt(1),
      I4 => rstDone,
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
running_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3030303030302220"
    )
        port map (
      I0 => stt(0),
      I1 => stt(3),
      I2 => running_reg_n_0,
      I3 => sw_IBUF,
      I4 => stt(1),
      I5 => stt(2),
      O => running_i_1_n_0
    );
running_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => running_i_1_n_0,
      Q => running_reg_n_0,
      R => '0'
    );
srcSel_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F4"
    )
        port map (
      I0 => \^rdy_obuf\,
      I1 => srcSel,
      I2 => \^byteflag\,
      I3 => rst_IBUF,
      O => OLEDRdy_t_reg_0
    );
sttFlag_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF8000FFFF8F30"
    )
        port map (
      I0 => byteFlag_t_i_2_n_0,
      I1 => stt(0),
      I2 => stt(1),
      I3 => stt(2),
      I4 => stt(3),
      I5 => byteFlag_t_i_3_n_0,
      O => sttFlag
    );
sttFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => sttFlag,
      Q => sttFlag_reg_n_0,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sclk_s is
  port (
    sclk_OBUF : out STD_LOGIC;
    rst_IBUF : in STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC
  );
end sclk_s;

architecture STRUCTURE of sclk_s is
  signal clk_7p1MHz_t_i_1_n_0 : STD_LOGIC;
  signal counter : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \counter[3]_i_1_n_0\ : STD_LOGIC;
  signal \counter[3]_i_2_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \^sclk_obuf\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \counter[0]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \counter[1]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \counter[2]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \counter[3]_i_3\ : label is "soft_lutpair38";
begin
  sclk_OBUF <= \^sclk_obuf\;
clk_7p1MHz_t_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF70008"
    )
        port map (
      I0 => counter(1),
      I1 => counter(2),
      I2 => counter(0),
      I3 => counter(3),
      I4 => \^sclk_obuf\,
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
      Q => \^sclk_obuf\,
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
      O => \counter[3]_i_2_n_0\
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
      CE => \counter[3]_i_2_n_0\,
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
      CE => \counter[3]_i_2_n_0\,
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
      CE => \counter[3]_i_2_n_0\,
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
      CE => \counter[3]_i_2_n_0\,
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
    \byteCount_t_reg[0]_0\ : out STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    byteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    srcSel : in STD_LOGIC;
    sw0_IBUF : in STD_LOGIC;
    rst_IBUF : in STD_LOGIC
  );
end userIF_s;

architecture STRUCTURE of userIF_s is
  signal byteCount_t : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \byteCount_t[0]_i_1__0_n_0\ : STD_LOGIC;
  signal byteFlag_t : STD_LOGIC;
  signal \^byteflag_w\ : STD_LOGIC;
  signal fdoDone : STD_LOGIC;
  signal fdoDone_reg_n_0 : STD_LOGIC;
  signal fdoFlag_i_1_n_0 : STD_LOGIC;
  signal fdoFlag_reg_n_0 : STD_LOGIC;
  signal rstDone : STD_LOGIC;
  signal rstDone_reg_n_0 : STD_LOGIC;
  signal stt : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \stt__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^uifbytecount\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[0]\ : label is "rststt:00,fulldisplayon:10,iSTATE:11,idle:01";
  attribute FSM_ENCODED_STATES of \FSM_sequential_stt_reg[1]\ : label is "rststt:00,fulldisplayon:10,iSTATE:11,idle:01";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \byteCount_t[0]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of byteFlag_t_i_1 : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \bytesIN_i[6][0]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of fdoDone_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of fdoFlag_i_1 : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of rstDone_i_1 : label is "soft_lutpair21";
begin
  byteFlag_w <= \^byteflag_w\;
  uifByteCount(0) <= \^uifbytecount\(0);
\FSM_sequential_stt[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF33AAF0"
    )
        port map (
      I0 => \^byteflag_w\,
      I1 => fdoFlag_reg_n_0,
      I2 => rstDone_reg_n_0,
      I3 => byteCount_t(0),
      I4 => stt(0),
      O => \stt__0\(0)
    );
\FSM_sequential_stt[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7C4C"
    )
        port map (
      I0 => fdoDone_reg_n_0,
      I1 => byteCount_t(0),
      I2 => stt(0),
      I3 => fdoFlag_reg_n_0,
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
\byteCount_t[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \^uifbytecount\(0),
      I1 => stt(0),
      I2 => byteCount_t(0),
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
      Q => \^uifbytecount\(0),
      R => '0'
    );
byteFlag_t_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      O => byteFlag_t
    );
byteFlag_t_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => byteFlag_t,
      Q => \^byteflag_w\,
      R => '0'
    );
\bytesIN_i[6][0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"35"
    )
        port map (
      I0 => \^uifbytecount\(0),
      I1 => byteCount(0),
      I2 => srcSel,
      O => \byteCount_t_reg[0]_0\
    );
fdoDone_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => stt(0),
      I1 => byteCount_t(0),
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
      I1 => sw0_IBUF,
      I2 => stt(0),
      O => fdoFlag_i_1_n_0
    );
fdoFlag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => fdoFlag_i_1_n_0,
      Q => fdoFlag_reg_n_0,
      R => '0'
    );
rstDone_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => byteCount_t(0),
      I1 => stt(0),
      O => rstDone
    );
rstDone_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => rstDone,
      Q => rstDone_reg_n_0,
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
    \LxCount_reg[1]_0\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rst_IBUF : in STD_LOGIC;
    clk_IBUF_BUFG : in STD_LOGIC;
    sclk_OBUF : in STD_LOGIC;
    byteCount : in STD_LOGIC_VECTOR ( 2 downto 0 );
    srcSel : in STD_LOGIC;
    \LxCount_reg[2]_0\ : in STD_LOGIC;
    uifByteCount : in STD_LOGIC_VECTOR ( 0 to 0 );
    byteFlag : in STD_LOGIC;
    byteFlag_w : in STD_LOGIC;
    \OLEDBytes_t_reg[1]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \OLEDBytes_t_reg[5]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    \OLEDBytes_t_reg[2]\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \bytesIN_i_reg[6][5]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[0][7]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[6][0]_0\ : in STD_LOGIC;
    \bytesIN_i_reg[6][0]_1\ : in STD_LOGIC;
    \bytesIN_i_reg[6][0]_2\ : in STD_LOGIC;
    \bytesIN_i_reg[6][6]_0\ : in STD_LOGIC;
    \LxCount_reg[1]_1\ : in STD_LOGIC;
    \LxCount_reg[0]_0\ : in STD_LOGIC
  );
end OLEDCtrl_s;

architecture STRUCTURE of OLEDCtrl_s is
  signal L : STD_LOGIC_VECTOR ( 2 to 2 );
  signal \LxCount[0]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[0]_i_2_n_0\ : STD_LOGIC;
  signal \LxCount[1]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[1]_i_2_n_0\ : STD_LOGIC;
  signal \LxCount[2]_i_1_n_0\ : STD_LOGIC;
  signal \LxCount[2]_i_2_n_0\ : STD_LOGIC;
  signal \^lxcount_reg[1]_0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal TxReady : STD_LOGIC;
  signal byteCountOUT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \byteFlag_w__0_n_0\ : STD_LOGIC;
  signal byteFlag_w_i_1_n_0 : STD_LOGIC;
  signal byteOUT_t : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \byteSel[0]_i_1_n_0\ : STD_LOGIC;
  signal \byteSel[1]_i_1_n_0\ : STD_LOGIC;
  signal \byteSel_reg_n_0_[0]\ : STD_LOGIC;
  signal \byteSel_reg_n_0_[1]\ : STD_LOGIC;
  signal \bytesIN[9]_4\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \bytesIN_i[0][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[1][7]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[2][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[3][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[4][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[5][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][0]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][1]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][1]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][3]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][3]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][4]_i_2_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][4]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][5]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][6]_i_1_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][6]_i_4_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][7]_i_1__0_n_0\ : STD_LOGIC;
  signal \bytesIN_i[6][7]_i_3_n_0\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][4]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][5]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][6]\ : STD_LOGIC;
  signal \bytesIN_i_reg_n_0_[0][7]\ : STD_LOGIC;
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
  signal done0 : STD_LOGIC;
  signal nxByte_t : STD_LOGIC;
  signal startOUT : STD_LOGIC;
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_stt_reg[0]\ : label is "rststt:001,iSTATE:100,idle:010";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \LxCount[0]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \LxCount[1]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \LxCount[2]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \bytesIN_i[6][3]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bytesIN_i[6][3]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \bytesIN_i[6][4]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \bytesIN_i[6][4]_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \bytesIN_i[6][7]_i_2\ : label is "soft_lutpair16";
begin
  \LxCount_reg[1]_0\(1 downto 0) <= \^lxcount_reg[1]_0\(1 downto 0);
BB0: entity work.byteBuffer_s
     port map (
      Q(7) => \bytesIN_i_reg_n_0_[3][7]\,
      Q(6) => \bytesIN_i_reg_n_0_[3][6]\,
      Q(5) => \bytesIN_i_reg_n_0_[3][5]\,
      Q(4) => \bytesIN_i_reg_n_0_[3][4]\,
      Q(3) => \bytesIN_i_reg_n_0_[3][3]\,
      Q(2) => \bytesIN_i_reg_n_0_[3][2]\,
      Q(1) => \bytesIN_i_reg_n_0_[3][1]\,
      Q(0) => \bytesIN_i_reg_n_0_[3][0]\,
      TxReady => TxReady,
      byteCount(2 downto 0) => byteCount(2 downto 0),
      \byteCountIN_i_reg[0]_0\ => \byteFlag_w__0_n_0\,
      byteCountOUT(2 downto 0) => byteCountOUT(2 downto 0),
      \byteOUT_t_reg[7]_0\(7 downto 0) => byteOUT_t(7 downto 0),
      \bytesIN_i[9][7]_i_4_0\(7) => \bytesIN_i_reg_n_0_[4][7]\,
      \bytesIN_i[9][7]_i_4_0\(6) => \bytesIN_i_reg_n_0_[4][6]\,
      \bytesIN_i[9][7]_i_4_0\(5) => \bytesIN_i_reg_n_0_[4][5]\,
      \bytesIN_i[9][7]_i_4_0\(4) => \bytesIN_i_reg_n_0_[4][4]\,
      \bytesIN_i[9][7]_i_4_0\(3) => \bytesIN_i_reg_n_0_[4][3]\,
      \bytesIN_i[9][7]_i_4_0\(2) => \bytesIN_i_reg_n_0_[4][2]\,
      \bytesIN_i[9][7]_i_4_0\(1) => \bytesIN_i_reg_n_0_[4][1]\,
      \bytesIN_i[9][7]_i_4_0\(0) => \bytesIN_i_reg_n_0_[4][0]\,
      \bytesIN_i[9][7]_i_4_1\(7) => \bytesIN_i_reg_n_0_[5][7]\,
      \bytesIN_i[9][7]_i_4_1\(6) => \bytesIN_i_reg_n_0_[5][6]\,
      \bytesIN_i[9][7]_i_4_1\(5) => \bytesIN_i_reg_n_0_[5][5]\,
      \bytesIN_i[9][7]_i_4_1\(4) => \bytesIN_i_reg_n_0_[5][4]\,
      \bytesIN_i[9][7]_i_4_1\(3) => \bytesIN_i_reg_n_0_[5][3]\,
      \bytesIN_i[9][7]_i_4_1\(2) => \bytesIN_i_reg_n_0_[5][2]\,
      \bytesIN_i[9][7]_i_4_1\(1) => \bytesIN_i_reg_n_0_[5][1]\,
      \bytesIN_i[9][7]_i_4_1\(0) => \bytesIN_i_reg_n_0_[5][0]\,
      \bytesIN_i[9][7]_i_4_2\(7) => \bytesIN_i_reg_n_0_[6][7]\,
      \bytesIN_i[9][7]_i_4_2\(6) => \bytesIN_i_reg_n_0_[6][6]\,
      \bytesIN_i[9][7]_i_4_2\(5) => \bytesIN_i_reg_n_0_[6][5]\,
      \bytesIN_i[9][7]_i_4_2\(4) => \bytesIN_i_reg_n_0_[6][4]\,
      \bytesIN_i[9][7]_i_4_2\(3) => \bytesIN_i_reg_n_0_[6][3]\,
      \bytesIN_i[9][7]_i_4_2\(2) => \bytesIN_i_reg_n_0_[6][2]\,
      \bytesIN_i[9][7]_i_4_2\(1) => \bytesIN_i_reg_n_0_[6][1]\,
      \bytesIN_i[9][7]_i_4_2\(0) => \bytesIN_i_reg_n_0_[6][0]\,
      \bytesIN_i[9][7]_i_4_3\(7) => \bytesIN_i_reg_n_0_[0][7]\,
      \bytesIN_i[9][7]_i_4_3\(6) => \bytesIN_i_reg_n_0_[0][6]\,
      \bytesIN_i[9][7]_i_4_3\(5) => \bytesIN_i_reg_n_0_[0][5]\,
      \bytesIN_i[9][7]_i_4_3\(4) => \bytesIN_i_reg_n_0_[0][4]\,
      \bytesIN_i[9][7]_i_4_3\(3) => \bytesIN_i_reg_n_0_[0][3]\,
      \bytesIN_i[9][7]_i_4_3\(2) => \bytesIN_i_reg_n_0_[0][2]\,
      \bytesIN_i[9][7]_i_4_3\(1) => \bytesIN_i_reg_n_0_[0][1]\,
      \bytesIN_i[9][7]_i_4_3\(0) => \bytesIN_i_reg_n_0_[0][0]\,
      \bytesIN_i[9][7]_i_4_4\(7) => \bytesIN_i_reg_n_0_[1][7]\,
      \bytesIN_i[9][7]_i_4_4\(6) => \bytesIN_i_reg_n_0_[1][6]\,
      \bytesIN_i[9][7]_i_4_4\(5) => \bytesIN_i_reg_n_0_[1][5]\,
      \bytesIN_i[9][7]_i_4_4\(4) => \bytesIN_i_reg_n_0_[1][4]\,
      \bytesIN_i[9][7]_i_4_4\(3) => \bytesIN_i_reg_n_0_[1][3]\,
      \bytesIN_i[9][7]_i_4_4\(2) => \bytesIN_i_reg_n_0_[1][2]\,
      \bytesIN_i[9][7]_i_4_4\(1) => \bytesIN_i_reg_n_0_[1][1]\,
      \bytesIN_i[9][7]_i_4_4\(0) => \bytesIN_i_reg_n_0_[1][0]\,
      \bytesIN_i[9][7]_i_4_5\(7) => \bytesIN_i_reg_n_0_[2][7]\,
      \bytesIN_i[9][7]_i_4_5\(6) => \bytesIN_i_reg_n_0_[2][6]\,
      \bytesIN_i[9][7]_i_4_5\(5) => \bytesIN_i_reg_n_0_[2][5]\,
      \bytesIN_i[9][7]_i_4_5\(4) => \bytesIN_i_reg_n_0_[2][4]\,
      \bytesIN_i[9][7]_i_4_5\(3) => \bytesIN_i_reg_n_0_[2][3]\,
      \bytesIN_i[9][7]_i_4_5\(2) => \bytesIN_i_reg_n_0_[2][2]\,
      \bytesIN_i[9][7]_i_4_5\(1) => \bytesIN_i_reg_n_0_[2][1]\,
      \bytesIN_i[9][7]_i_4_5\(0) => \bytesIN_i_reg_n_0_[2][0]\,
      \bytesIN_i_reg[0][4]_0\ => \byteSel_reg_n_0_[0]\,
      \bytesIN_i_reg[0][4]_1\ => \byteSel_reg_n_0_[1]\,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      done0 => done0,
      nxByte_t => nxByte_t,
      oneByte_reg_0 => \LxCount_reg[2]_0\,
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
\LxCount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000077764446"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(0),
      I1 => \LxCount[0]_i_2_n_0\,
      I2 => byteFlag_w,
      I3 => byteFlag,
      I4 => \LxCount_reg[0]_0\,
      I5 => done0,
      O => \LxCount[0]_i_1_n_0\
    );
\LxCount[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => L(2),
      I1 => \^lxcount_reg[1]_0\(1),
      I2 => \^lxcount_reg[1]_0\(0),
      O => \LxCount[0]_i_2_n_0\
    );
\LxCount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000A6A2A6A6"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => \LxCount[1]_i_2_n_0\,
      I2 => \^lxcount_reg[1]_0\(0),
      I3 => L(2),
      I4 => \LxCount_reg[1]_1\,
      I5 => done0,
      O => \LxCount[1]_i_1_n_0\
    );
\LxCount[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => byteFlag,
      I1 => byteFlag_w,
      I2 => \^lxcount_reg[1]_0\(0),
      I3 => \^lxcount_reg[1]_0\(1),
      I4 => L(2),
      O => \LxCount[1]_i_2_n_0\
    );
\LxCount[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000066622222"
    )
        port map (
      I0 => L(2),
      I1 => \LxCount[2]_i_2_n_0\,
      I2 => byteFlag_w,
      I3 => byteFlag,
      I4 => \LxCount_reg[2]_0\,
      I5 => done0,
      O => \LxCount[2]_i_1_n_0\
    );
\LxCount[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(0),
      I1 => \^lxcount_reg[1]_0\(1),
      O => \LxCount[2]_i_2_n_0\
    );
\LxCount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \LxCount[0]_i_1_n_0\,
      Q => \^lxcount_reg[1]_0\(0),
      R => '0'
    );
\LxCount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \LxCount[1]_i_1_n_0\,
      Q => \^lxcount_reg[1]_0\(1),
      R => '0'
    );
\LxCount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => '1',
      D => \LxCount[2]_i_1_n_0\,
      Q => L(2),
      R => '0'
    );
SPI0: entity work.SPI_Tx
     port map (
      CS_OBUF => CS_OBUF,
      D(7 downto 0) => byteOUT_t(7 downto 0),
      MOSI_OBUF => MOSI_OBUF,
      TxReady => TxReady,
      byteCountOUT(2 downto 0) => byteCountOUT(2 downto 0),
      nxByte_t => nxByte_t,
      rst_IBUF => rst_IBUF,
      sclk_OBUF => sclk_OBUF,
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
byteFlag_w_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => L(2),
      I1 => \^lxcount_reg[1]_0\(0),
      I2 => \^lxcount_reg[1]_0\(1),
      I3 => done0,
      O => byteFlag_w_i_1_n_0
    );
\byteSel[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BA8ABAAA"
    )
        port map (
      I0 => \byteSel_reg_n_0_[0]\,
      I1 => L(2),
      I2 => \LxCount[2]_i_2_n_0\,
      I3 => byteFlag_w,
      I4 => byteFlag,
      I5 => done0,
      O => \byteSel[0]_i_1_n_0\
    );
\byteSel[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000BABA8AAA"
    )
        port map (
      I0 => \byteSel_reg_n_0_[1]\,
      I1 => L(2),
      I2 => \LxCount[2]_i_2_n_0\,
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
\bytesIN_i[0][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => \^lxcount_reg[1]_0\(0),
      I2 => L(2),
      O => \bytesIN_i[0][7]_i_1__0_n_0\
    );
\bytesIN_i[1][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(0),
      I1 => \^lxcount_reg[1]_0\(1),
      I2 => L(2),
      O => \bytesIN_i[1][7]_i_1_n_0\
    );
\bytesIN_i[2][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(0),
      I1 => L(2),
      I2 => \^lxcount_reg[1]_0\(1),
      O => \bytesIN_i[2][7]_i_1__0_n_0\
    );
\bytesIN_i[3][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => \^lxcount_reg[1]_0\(0),
      I2 => L(2),
      O => \bytesIN_i[3][7]_i_1__0_n_0\
    );
\bytesIN_i[4][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => L(2),
      I2 => \^lxcount_reg[1]_0\(0),
      O => \bytesIN_i[4][7]_i_1__0_n_0\
    );
\bytesIN_i[5][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => L(2),
      I1 => \^lxcount_reg[1]_0\(1),
      I2 => \^lxcount_reg[1]_0\(0),
      O => \bytesIN_i[5][7]_i_1__0_n_0\
    );
\bytesIN_i[6][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"33000055330F0F55"
    )
        port map (
      I0 => \bytesIN_i_reg[6][0]_0\,
      I1 => \bytesIN_i_reg[6][0]_1\,
      I2 => \bytesIN_i_reg[6][0]_2\,
      I3 => L(2),
      I4 => \^lxcount_reg[1]_0\(1),
      I5 => \^lxcount_reg[1]_0\(0),
      O => \bytesIN_i[6][0]_i_1_n_0\
    );
\bytesIN_i[6][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \bytesIN_i[6][1]_i_2_n_0\,
      I1 => \^lxcount_reg[1]_0\(1),
      I2 => L(2),
      I3 => \^lxcount_reg[1]_0\(0),
      I4 => srcSel,
      I5 => \OLEDBytes_t_reg[2]\(0),
      O => \bytesIN_i[6][1]_i_1_n_0\
    );
\bytesIN_i[6][1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080000AA08000000"
    )
        port map (
      I0 => srcSel,
      I1 => \OLEDBytes_t_reg[5]\(0),
      I2 => \^lxcount_reg[1]_0\(0),
      I3 => \^lxcount_reg[1]_0\(1),
      I4 => L(2),
      I5 => byteCount(0),
      O => \bytesIN_i[6][1]_i_2_n_0\
    );
\bytesIN_i[6][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF085008FF080008"
    )
        port map (
      I0 => srcSel,
      I1 => \OLEDBytes_t_reg[1]\(0),
      I2 => \bytesIN_i[6][4]_i_2_n_0\,
      I3 => \bytesIN_i[6][4]_i_3_n_0\,
      I4 => \bytesIN_i[6][3]_i_2_n_0\,
      I5 => uifByteCount(0),
      O => \bytesIN[9]_4\(2)
    );
\bytesIN_i[6][3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFAA"
    )
        port map (
      I0 => \bytesIN_i[6][7]_i_3_n_0\,
      I1 => L(2),
      I2 => \^lxcount_reg[1]_0\(1),
      I3 => \bytesIN_i[6][3]_i_2_n_0\,
      O => \bytesIN[9]_4\(3)
    );
\bytesIN_i[6][3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0A0A0F3333333"
    )
        port map (
      I0 => byteCount(0),
      I1 => \bytesIN_i[6][3]_i_3_n_0\,
      I2 => srcSel,
      I3 => \OLEDBytes_t_reg[1]\(0),
      I4 => \LxCount[2]_i_2_n_0\,
      I5 => \bytesIN_i[6][4]_i_2_n_0\,
      O => \bytesIN_i[6][3]_i_2_n_0\
    );
\bytesIN_i[6][3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => \^lxcount_reg[1]_0\(0),
      I2 => \OLEDBytes_t_reg[5]\(0),
      I3 => srcSel,
      O => \bytesIN_i[6][3]_i_3_n_0\
    );
\bytesIN_i[6][4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000C808FFFFC808"
    )
        port map (
      I0 => \OLEDBytes_t_reg[2]\(1),
      I1 => srcSel,
      I2 => \bytesIN_i[6][4]_i_2_n_0\,
      I3 => \OLEDBytes_t_reg[1]\(0),
      I4 => \bytesIN_i[6][4]_i_3_n_0\,
      I5 => \bytesIN_i[6][6]_i_4_n_0\,
      O => \bytesIN[9]_4\(4)
    );
\bytesIN_i[6][4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"15"
    )
        port map (
      I0 => L(2),
      I1 => \^lxcount_reg[1]_0\(1),
      I2 => \^lxcount_reg[1]_0\(0),
      O => \bytesIN_i[6][4]_i_2_n_0\
    );
\bytesIN_i[6][4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => L(2),
      I1 => \^lxcount_reg[1]_0\(1),
      O => \bytesIN_i[6][4]_i_3_n_0\
    );
\bytesIN_i[6][5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"080880800000FF00"
    )
        port map (
      I0 => srcSel,
      I1 => \OLEDBytes_t_reg[5]\(0),
      I2 => \^lxcount_reg[1]_0\(0),
      I3 => \bytesIN_i_reg[6][5]_0\,
      I4 => \^lxcount_reg[1]_0\(1),
      I5 => L(2),
      O => \bytesIN_i[6][5]_i_1_n_0\
    );
\bytesIN_i[6][6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00271100FF27FFFF"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(0),
      I1 => \bytesIN_i_reg[6][6]_0\,
      I2 => \bytesIN_i_reg[6][0]_2\,
      I3 => L(2),
      I4 => \^lxcount_reg[1]_0\(1),
      I5 => \bytesIN_i[6][6]_i_4_n_0\,
      O => \bytesIN_i[6][6]_i_1_n_0\
    );
\bytesIN_i[6][6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FD1DFDDDFFFFFFFF"
    )
        port map (
      I0 => Q(0),
      I1 => L(2),
      I2 => \^lxcount_reg[1]_0\(1),
      I3 => \^lxcount_reg[1]_0\(0),
      I4 => \OLEDBytes_t_reg[5]\(0),
      I5 => srcSel,
      O => \bytesIN_i[6][6]_i_4_n_0\
    );
\bytesIN_i[6][7]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \^lxcount_reg[1]_0\(1),
      I1 => \^lxcount_reg[1]_0\(0),
      I2 => L(2),
      O => \bytesIN_i[6][7]_i_1__0_n_0\
    );
\bytesIN_i[6][7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFEEABAA"
    )
        port map (
      I0 => \bytesIN_i[6][7]_i_3_n_0\,
      I1 => L(2),
      I2 => \^lxcount_reg[1]_0\(1),
      I3 => \bytesIN_i_reg[6][5]_0\,
      I4 => \bytesIN_i_reg[0][7]_0\,
      O => \bytesIN[9]_4\(7)
    );
\bytesIN_i[6][7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0088000000C00000"
    )
        port map (
      I0 => \OLEDBytes_t_reg[2]\(0),
      I1 => srcSel,
      I2 => \OLEDBytes_t_reg[1]\(0),
      I3 => L(2),
      I4 => \^lxcount_reg[1]_0\(1),
      I5 => \^lxcount_reg[1]_0\(0),
      O => \bytesIN_i[6][7]_i_3_n_0\
    );
\bytesIN_i_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][0]\,
      R => done0
    );
\bytesIN_i_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][1]\,
      R => done0
    );
\bytesIN_i_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[0][2]\,
      R => done0
    );
\bytesIN_i_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[0][3]\,
      R => done0
    );
\bytesIN_i_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[0][4]\,
      R => done0
    );
\bytesIN_i_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][5]\,
      R => done0
    );
\bytesIN_i_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[0][6]\,
      R => done0
    );
\bytesIN_i_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[0][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[0][7]\,
      R => done0
    );
\bytesIN_i_reg[1][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][0]\,
      R => done0
    );
\bytesIN_i_reg[1][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][1]\,
      R => done0
    );
\bytesIN_i_reg[1][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[1][2]\,
      R => done0
    );
\bytesIN_i_reg[1][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[1][3]\,
      R => done0
    );
\bytesIN_i_reg[1][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[1][4]\,
      R => done0
    );
\bytesIN_i_reg[1][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][5]\,
      R => done0
    );
\bytesIN_i_reg[1][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[1][6]\,
      R => done0
    );
\bytesIN_i_reg[1][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[1][7]_i_1_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[1][7]\,
      R => done0
    );
\bytesIN_i_reg[2][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][0]\,
      R => done0
    );
\bytesIN_i_reg[2][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][1]\,
      R => done0
    );
\bytesIN_i_reg[2][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[2][2]\,
      R => done0
    );
\bytesIN_i_reg[2][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[2][3]\,
      R => done0
    );
\bytesIN_i_reg[2][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[2][4]\,
      R => done0
    );
\bytesIN_i_reg[2][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][5]\,
      R => done0
    );
\bytesIN_i_reg[2][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[2][6]\,
      R => done0
    );
\bytesIN_i_reg[2][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[2][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[2][7]\,
      R => done0
    );
\bytesIN_i_reg[3][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][0]\,
      R => done0
    );
\bytesIN_i_reg[3][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][1]\,
      R => done0
    );
\bytesIN_i_reg[3][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[3][2]\,
      R => done0
    );
\bytesIN_i_reg[3][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[3][3]\,
      R => done0
    );
\bytesIN_i_reg[3][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[3][4]\,
      R => done0
    );
\bytesIN_i_reg[3][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][5]\,
      R => done0
    );
\bytesIN_i_reg[3][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[3][6]\,
      R => done0
    );
\bytesIN_i_reg[3][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[3][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[3][7]\,
      R => done0
    );
\bytesIN_i_reg[4][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][0]\,
      R => done0
    );
\bytesIN_i_reg[4][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][1]\,
      R => done0
    );
\bytesIN_i_reg[4][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[4][2]\,
      R => done0
    );
\bytesIN_i_reg[4][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[4][3]\,
      R => done0
    );
\bytesIN_i_reg[4][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[4][4]\,
      R => done0
    );
\bytesIN_i_reg[4][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][5]\,
      R => done0
    );
\bytesIN_i_reg[4][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[4][6]\,
      R => done0
    );
\bytesIN_i_reg[4][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[4][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[4][7]\,
      R => done0
    );
\bytesIN_i_reg[5][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][0]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][0]\,
      R => done0
    );
\bytesIN_i_reg[5][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][1]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][1]\,
      R => done0
    );
\bytesIN_i_reg[5][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[5][2]\,
      R => done0
    );
\bytesIN_i_reg[5][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[5][3]\,
      R => done0
    );
\bytesIN_i_reg[5][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[5][4]\,
      R => done0
    );
\bytesIN_i_reg[5][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][5]\,
      R => done0
    );
\bytesIN_i_reg[5][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[5][6]\,
      R => done0
    );
\bytesIN_i_reg[5][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[5][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[5][7]\,
      R => done0
    );
\bytesIN_i_reg[6][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
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
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
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
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(2),
      Q => \bytesIN_i_reg_n_0_[6][2]\,
      R => done0
    );
\bytesIN_i_reg[6][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(3),
      Q => \bytesIN_i_reg_n_0_[6][3]\,
      R => done0
    );
\bytesIN_i_reg[6][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(4),
      Q => \bytesIN_i_reg_n_0_[6][4]\,
      R => done0
    );
\bytesIN_i_reg[6][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][5]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[6][5]\,
      R => done0
    );
\bytesIN_i_reg[6][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN_i[6][6]_i_1_n_0\,
      Q => \bytesIN_i_reg_n_0_[6][6]\,
      R => done0
    );
\bytesIN_i_reg[6][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_IBUF_BUFG,
      CE => \bytesIN_i[6][7]_i_1__0_n_0\,
      D => \bytesIN[9]_4\(7),
      Q => \bytesIN_i_reg_n_0_[6][7]\,
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
  signal L : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal MOSI_OBUF : STD_LOGIC;
  signal \OLEDBytes_t_reg[0]\ : STD_LOGIC_VECTOR ( 4 to 4 );
  signal \OLEDBytes_t_reg[1]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \OLEDBytes_t_reg[2]\ : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \OLEDBytes_t_reg[5]\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal PRst_OBUF : STD_LOGIC;
  signal UIF0_n_2 : STD_LOGIC;
  signal Vbat_OBUF : STD_LOGIC;
  signal Vddc_OBUF : STD_LOGIC;
  signal byteCount : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal byteFlag : STD_LOGIC;
  signal byteFlag_w : STD_LOGIC;
  signal clk_IBUF : STD_LOGIC;
  signal clk_IBUF_BUFG : STD_LOGIC;
  signal on0_n_12 : STD_LOGIC;
  signal on0_n_13 : STD_LOGIC;
  signal on0_n_14 : STD_LOGIC;
  signal on0_n_15 : STD_LOGIC;
  signal on0_n_16 : STD_LOGIC;
  signal on0_n_17 : STD_LOGIC;
  signal on0_n_19 : STD_LOGIC;
  signal on0_n_20 : STD_LOGIC;
  signal on0_n_21 : STD_LOGIC;
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
      CS_OBUF => CS_OBUF,
      \LxCount_reg[0]_0\ => on0_n_14,
      \LxCount_reg[1]_0\(1 downto 0) => L(1 downto 0),
      \LxCount_reg[1]_1\ => on0_n_13,
      \LxCount_reg[2]_0\ => on0_n_12,
      MOSI_OBUF => MOSI_OBUF,
      \OLEDBytes_t_reg[1]\(0) => \OLEDBytes_t_reg[1]\(0),
      \OLEDBytes_t_reg[2]\(1) => \OLEDBytes_t_reg[2]\(4),
      \OLEDBytes_t_reg[2]\(0) => \OLEDBytes_t_reg[2]\(1),
      \OLEDBytes_t_reg[5]\(0) => \OLEDBytes_t_reg[5]\(0),
      Q(0) => \OLEDBytes_t_reg[0]\(4),
      byteCount(2 downto 0) => byteCount(2 downto 0),
      byteFlag => byteFlag,
      byteFlag_w => byteFlag_w,
      \bytesIN_i_reg[0][7]_0\ => on0_n_15,
      \bytesIN_i_reg[6][0]_0\ => UIF0_n_2,
      \bytesIN_i_reg[6][0]_1\ => on0_n_16,
      \bytesIN_i_reg[6][0]_2\ => on0_n_19,
      \bytesIN_i_reg[6][5]_0\ => on0_n_17,
      \bytesIN_i_reg[6][6]_0\ => on0_n_20,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF,
      sclk_OBUF => sclk_OBUF,
      srcSel => srcSel,
      uifByteCount(0) => uifByteCount(0)
    );
PRst_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => PRst_OBUF,
      O => PRst
    );
UIF0: entity work.userIF_s
     port map (
      byteCount(0) => byteCount(2),
      \byteCount_t_reg[0]_0\ => UIF0_n_2,
      byteFlag_w => byteFlag_w,
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF,
      srcSel => srcSel,
      sw0_IBUF => sw0_IBUF,
      uifByteCount(0) => uifByteCount(0)
    );
Vbat_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => Vbat_OBUF,
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
on0: entity work.onCtrl_s
     port map (
      \OLEDBytes_t_reg[0][5]_0\ => on0_n_17,
      \OLEDBytes_t_reg[1]\(0) => \OLEDBytes_t_reg[1]\(0),
      \OLEDBytes_t_reg[2]\(1) => \OLEDBytes_t_reg[2]\(4),
      \OLEDBytes_t_reg[2]\(0) => \OLEDBytes_t_reg[2]\(1),
      \OLEDBytes_t_reg[2][4]_0\ => on0_n_15,
      \OLEDBytes_t_reg[5]\(0) => \OLEDBytes_t_reg[5]\(0),
      OLEDRdy_t_reg_0 => on0_n_21,
      PRst_OBUF => PRst_OBUF,
      Q(0) => \OLEDBytes_t_reg[0]\(4),
      Vbat_OBUF => Vbat_OBUF,
      Vddc_OBUF => Vddc_OBUF,
      byteCount(2 downto 0) => byteCount(2 downto 0),
      \byteCount_t_reg[0]_0\ => on0_n_14,
      byteFlag => byteFlag,
      \bytesIN_i_reg[0][7]\(1 downto 0) => L(1 downto 0),
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rdy_OBUF => rdy_OBUF,
      rst_IBUF => rst_IBUF,
      srcSel => srcSel,
      srcSel_reg => on0_n_12,
      srcSel_reg_0 => on0_n_13,
      srcSel_reg_1 => on0_n_16,
      srcSel_reg_2 => on0_n_19,
      srcSel_reg_3 => on0_n_20,
      sw_IBUF => sw_IBUF,
      uifByteCount(0) => uifByteCount(0)
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
      clk_IBUF_BUFG => clk_IBUF_BUFG,
      rst_IBUF => rst_IBUF,
      sclk_OBUF => sclk_OBUF
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
      D => on0_n_21,
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
