# vhdl-component-lib
A collection of commonly used logic comopents written in VHDL-93
###Overview
This is a library of HDL components that I create along side my lab partner for a digital logic design course.
Most components were tested in [ISim](http://www.xilinx.com/tools/isim.htm) with the include testbench files in the
[/tb](https://github.com/hankedan000/vhdl-component-lib/tree/master/tb) directory. All components have been field
tested on a [Digilent Nexys4](http://www.digilentinc.com/Products/Detail.cfm?Prod=NEXYS4) developement board 
featuring a Xilinx Artix-7 chip.
###Usage
Inside a Xilinx ISE 14.7 project
* Go to Project>New VHDL Library...
* Click one of the browse buttons under "New VHDL Library Name"
* Open the directory containing the file [djh5533_reb5427_Components.vhd](https://github.com/hankedan000/vhdl-component-lib/blob/master/djh5533_reb5427_Components.vhd)
* Click "OK"

Then include these lines at the top of any HDL files you want to use the library in
``` vhdl
library djh5533_reb5427_Library;
use djh5533_reb5427_Library.djh5533_reb5427_Components.ALL;
```
