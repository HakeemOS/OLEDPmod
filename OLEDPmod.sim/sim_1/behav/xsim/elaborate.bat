@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue May 28 01:24:42 -0400 2024
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 3f89ebdd59194e6a907141978da3c8c3 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L myLib -L secureip --snapshot SPITx_tb_behav xil_defaultlib.SPITx_tb -log elaborate.log"
call xelab  -wto 3f89ebdd59194e6a907141978da3c8c3 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L myLib -L secureip --snapshot SPITx_tb_behav xil_defaultlib.SPITx_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
