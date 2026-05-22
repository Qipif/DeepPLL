vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_15
vlib modelsim_lib/msim/mult_gen_v12_0_24
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_utils_v3_0_15 modelsim_lib/msim/xbip_utils_v3_0_15
vmap mult_gen_v12_0_24 modelsim_lib/msim/mult_gen_v12_0_24
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_utils_v3_0_15  -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24  -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../mypll.gen/sources_1/ip/multiplier/sim/multiplier.vhd" \


