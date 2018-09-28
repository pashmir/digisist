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
ExecStep $xv_path/bin/xsim contador_tb_behav -key {Behavioral:sim_1:Functional:contador_tb} -tclbatch contador_tb.tcl -log simulate.log
