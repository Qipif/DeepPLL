transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_utils_v3_0_15
vlib activehdl/mult_gen_v12_0_24
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_15 activehdl/xbip_utils_v3_0_15
vmap mult_gen_v12_0_24 activehdl/mult_gen_v12_0_24
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_15 -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24 -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../mypll.gen/sources_1/ip/multiplier/sim/multiplier.vhd" \


