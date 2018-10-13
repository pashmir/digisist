#!/bin/sh -f
xv_path="/opt/Xilinx/Vivado/2014.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto bc6aa63e36f049788cfd20269c957c5d -m32 --debug typical --relax -L xil_defaultlib -L secureip --snapshot PF_testbench1_behav xil_defaultlib.PF_testbench1 -log elaborate.log
