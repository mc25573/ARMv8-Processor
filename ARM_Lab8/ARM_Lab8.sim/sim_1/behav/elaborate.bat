@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 3ef875d768b340e88dcbe933e61e78e1 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot adder_test_behav xil_defaultlib.adder_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
