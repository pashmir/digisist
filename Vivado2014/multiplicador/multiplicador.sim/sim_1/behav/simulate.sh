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
ExecStep $xv_path/bin/xsim PF_testbench1_behav -key {Behavioral:sim_1:Functional:PF_testbench1} -tclbatch PF_testbench1.tcl -log simulate.log
