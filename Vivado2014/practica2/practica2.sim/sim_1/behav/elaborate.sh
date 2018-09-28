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
ExecStep $xv_path/bin/xelab -wto 798a3b36444f48bf87264cf86ec24a3f -m32 --debug typical --relax -L xil_defaultlib -L secureip --snapshot contador_tb_behav xil_defaultlib.contador_tb -log elaborate.log
