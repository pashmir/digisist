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
ExecStep $xv_path/bin/xsim lab1_tb_behav -key {Behavioral:sim_1:Functional:lab1_tb} -tclbatch lab1_tb.tcl -log simulate.log
