##==================================================================
## 时钟 & 复位
##==================================================================
create_clock -period 20.000 -name sys_clk [get_ports Ext_Clk]
set_property -dict {PACKAGE_PIN R4 IOSTANDARD LVCMOS33} [get_ports Ext_Clk]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports Ext_Rst_n]

##==================================================================
## ADC 通道 A (AD9226, 12bit, 参考信号输入)
##==================================================================
set_property -dict {PACKAGE_PIN Y8  IOSTANDARD LVCMOS33} [get_ports Adc_Clk_A]
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVCMOS33} [get_ports Otr_A]
set_property -dict {PACKAGE_PIN Y7  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[0]}]
set_property -dict {PACKAGE_PIN AB8 IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[1]}]
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[2]}]
set_property -dict {PACKAGE_PIN V7  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[3]}]
set_property -dict {PACKAGE_PIN AB6 IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[4]}]
set_property -dict {PACKAGE_PIN U7  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[5]}]
set_property -dict {PACKAGE_PIN AB7 IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[6]}]
set_property -dict {PACKAGE_PIN Y9  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[7]}]
set_property -dict {PACKAGE_PIN V8  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[8]}]
set_property -dict {PACKAGE_PIN V9  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[9]}]
set_property -dict {PACKAGE_PIN W9  IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[10]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {Adc_In_A[11]}]

##==================================================================
## ILA Debug Hub (使用系统 100MHz 主时钟)
##==================================================================
set_property C_CLK_INPUT_FREQ_HZ 100000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER  false   [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN    1       [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_100mhz]

##==================================================================
## Test: 内部 NCO 方波输出（迟滞比较器）
##==================================================================
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports Test]
