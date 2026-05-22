// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun May 17 15:33:22 2026
// Host        : LAPTOP-V5P4DNLK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ multiplier_sim_netlist.v
// Design      : multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier,mult_gen_v12_0_24,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_24,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_mode = "slave a_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_mode = "slave b_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [11:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_mode = "master p_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [23:0]P;

  wire [11:0]A;
  wire [11:0]B;
  wire CLK;
  wire [23:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [47:0]NLW_U0_PCASC_EXT_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "12" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "12" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "23" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_24 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .PCASC_EXT(NLW_U0_PCASC_EXT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
I910e7jbNfN24pXwaCSMxqVj2Ezdrkc8axWPNPWLuy5wJ6bYPjUJrhdK8hBm+XPeTfSb0PTJnr/x
Krh166hfPPBlnnedvQG+2p32cWWYI3Jj65CR+tqidiJhdw+jpdAT0O+tDHpXQu8A715yy0ruF+zv
LSutZic4CGaPqXPBU+8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tOTzBjh2SQO+2QgYvLGd62ippBEfpJwpHWAs9rrdHUwvGwbeByaqaz/HRw7rWSQh2FikidsOXzr9
VD97c5jdR48paYWB1lmdqeF488Y2jMQc2CwReC98nLpXFukShKI4sr8QK6t5sXjT/4HYezgr4Xix
zIwRKQ1ReXHO6ZNomuErKJjpFX/dn+5LT6Db5SVulrxL68ljashRqDeA7GMw4huo8xcNtxNV7xfb
oM1HgdoJhhqlb568nKX6+jaWGr9fZIRKoMH0vO/miKYJLOeWxNZ2Pgg700CXwOC83/aikmVGhgh1
jM3HpBk8aDp5Y21A0Fpp3kUhyZs4OUFcsj/y1g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EdEhYfxGLALWwz2A8RKGvmueJD2fHEVu9+KVbTSsUS32VnYoGnc14W6BjgM+aVdYFrvvOwQeTUpz
FZfb+sLXywNHm+adAV+xzqk1XvcJNt3VN2sycpXJY+68+tjH7IHZQ+8yRbqaYWnZVqJ90vR6XR0X
740D0LE2a3P59lGmu8Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qt/YSLKDmd7omBa2uY94RAUTN1YLtqMWhKZeF+FJccA6f+2IUvNFUb8VA+KvnOSWUfsIQ7ouGGSq
YzcNlVicCVvt/gv4b6dmyYXQ4pL8mISaNILUIDeJNsWNTft/hNt9Bp0lHqYr11R1miAo9TtM2l3b
UyQMH1aTUeEet6GtapPYFdaHR2DKzB9jvbi88vlPO9oz+QLneWzbOIs1SzJ49DV8fgNn4vi2PFqG
ENgTkZlveIrHMdk6vzm9wQQXQaXCNfLgWB+Y40/wwfO1ZstKHKuradIIvAQhEEKN0IGu3/bTl90D
UZLzQQibBYsl2VYsSLXf0dIMGIckVgiTbJRSGg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u1LIH9BQ8X3la7q6da9Mzh6T4U6V+HvvkBBm4C+CQe7BF/eBwPNxSzxvZE/x0TG1c8bvOXRTxnmu
a+0ZGsqq5IqVTbQhfDEg9Y+gJz1IM8WMwqLVsmHSeUbpbnwngKoUbNQOQv1WRyNGnv4F/jI81nYX
HuXFyE2NVHTTMzCin34fKPiwVDQ+UzNTcayDrnU1CY+Udoh45KlE1l6+28uLuAnW4ACdWWr8ESLq
DR4dRp1oHvaNlXUK7vcnJ2+Ov/qLQc+1QeJeSM9svqPNs448IswOzIlk1ulhQh87kpwdHV2gdfSS
ekFaViYIKna0lus0TnUUqCwF9aOemBIgOBGm5w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ThGX7m1wupKmfjpeSuERSB+T7gquJSX6tq2xggUCrpUGHebhya8nWjMujArHTtZh6oUVb0QX8VDf
NRFTTfQ29w/ozh6fTrTQ/PrboWzdLkaABpPNVyeMStlulCCsemZUduRW3R2l8qEq44TVZcrL3NLq
NQtvyT88wqSWUs/Ly+3bbOMwCFcUyreYECd3L7sFTekvmjgOzseWEkUqi5rYpFaoe2fIKBy3/i1I
IEhb5HNd3/4wBVm4JzwGU7MCwr7IHJ+wDpOVyuwb3lRK0uCKTbMLrXrLR6ETYzaSjx46bNWzWnZS
2jU9OaYlTxamZSRRC0tPHBB4HPVPLAdW2y8kLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H2BVuF6JPvdByoK1aCz7p5WLhtbYDEDat4vaF1+IGCqBNuCgU7ZEckdQrjRNgyLbBCuGUhV2/Z87
7zmLyvPKp31qiGE62Z1rxDDY/8uPTNJmHChiPtJdrxtM+doqnoh6vftv5e+5o/fBrPH19+yBL2Nh
Z5fckSgZhFQ68P5dQuOkyIC5tp3R/HOnMjpG2xTMeS1yDGuFnYHA32VMFhXbyJbD4Mp5jVlQzwLs
6CrhAWWd7oBlxQ1e6DiDkbPQI12utFzvD/zshqm0HKUZY7YNRVE4UKGU+0MUAEr2tYE/KkaHSWmA
hTE0pwWLvrn0T5ldb6JKisPFcCRFq1RseLqKnQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
KkmCCcPhzWVUpuyH7mDH/kWvZLU9F0bZj+FB6hEDWav7aepDlW40mXmjmlsPTq6UcrVxN2LRWKt6
aT20LRSTKTlRlh29oiVlGDyITvP4mqCOoNs5Jiye2gmf1rtBW2DXoysXfomK0SypsNpy8fNr18hG
57a6lvuAP8Rh6q4wDGslM3Xbu71JJk1C9lVARGmzGP/mJtvA3iedWC4Tg+7BrLO09FZ7ldiVfJlT
0wy6cQym8l60VY5SIWLLj1XoUbZONTLU3WT1lFs/tFqN1JtonQ6ZZg2qYEghgeAPL9/Gl6cdPPu3
wM+ETD/nD5LRfYZVM7Lb0ejBBAeKcAOOf+zbgXO7T24PqmwUerrefHxeVSb3oha6vCHiAnoRYuVp
Dxfq2ra9dO9LNsuPs03zR7rLLuvCmwUWqSB0+2Z9pTbpt7A4T5Fd0OLa4rDFr3LbFDf16sdDy0pK
tatqXYi/+Ytep9KZh2jjoxEetd1MLAo+Wd8Diu78IMAH3TBsO6hlYVqa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HlVefHqF6PMcC1QL4S6isRBBHrYDmuMKO68bwPID8DHMq9J2gPyVJo7oVhVhhh/uz4wr3XtJJrKV
kdSwhQxSbtiGD1Kme1G1EM2+tBEkDFjVnc5txT6Yz39JXmjVlokngCLa0jPfnQEDMSQLLctVLqHB
Y71YHEhdjR03f/ErlbzbJzk4954gXndSJ8W1+1CE6C/Q7JLvBQOes3Wdhx23NEFrPR+xF1JYErJB
MujUqjm2zC8WprwOfluOLYlb3C28uYfcybHvDfG9S+h5HezEzSBVtUh+EUlY65Ug4b4MZDbpMdHt
514c4v/RlO+5c67z0QhV9n8iVnzPoHkifYzPPA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GElKnNwHuDvUsC6n3ryq1yJlBpsGEgpqhJaMewBzWoI0ABOCOmkYXeVvVaght1MSSYlMMh/2kUno
8CMZ0oTtGoAOaDOj+2b/ipMpLfar6QSptPGGS1BDIyibKaIF995HpywP+JaSmoIUypZPu4EGqqUl
irumZXlXoi0CgR7fBMJk6fsFsv/H48YZEAvFSUqWN5RWtWqhFOCVJwjRB9qYv4Cz4znFjCSXHePO
3WhFhxbYdkg//WZm/i7Na8UEwV7skIyx4snZFQN3StEshEhlus9bZj0WaMhL/q3Qi5M5e0kvS+a2
TBIb31t89nzvzCVXX2TsVZQIOU1xjM22qEBd+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NvC4x0gmKiuZSBSnTCrYtP8VEcCHfYyFLPcOc7hcUGPwtoKZrCGumU4YJspQ4iyC4Ibe0vTPscVD
/EaTDg0G/qI5OV8V47s1r/8smLOrXQSKWcxqeT5UVy9c6GKlRKrC6ZskdRUI9wGVAliaeOeKbxqH
XR/4p0oMdtKBZdUEbyq2aZwf72LyBc6m5qbtV0bvdoCpJkLSCsRngzpyOKuDTUsZ//SwGnpt48W1
+Yrwea91WokwKvPn196R8ZLc0VmvRaNX+g8o4/P211VZMgur2tNI6ndi2tdu0/pQYQEHOxzwHvKg
qf9EnC05euLrpDCFshQjmyblT8x0L9rUTmfNSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5744)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
I910e7jbNfN24pXwaCSMxqVj2Ezdrkc8axWPNPWLuy5wJ6bYPjUJrhdK8hBm+XPeTfSb0PTJnr/x
Krh166hfPPBlnnedvQG+2p32cWWYI3Jj65CR+tqidiJhdw+jpdAT0O+tDHpXQu8A715yy0ruF+zv
LSutZic4CGaPqXPBU+8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tOTzBjh2SQO+2QgYvLGd62ippBEfpJwpHWAs9rrdHUwvGwbeByaqaz/HRw7rWSQh2FikidsOXzr9
VD97c5jdR48paYWB1lmdqeF488Y2jMQc2CwReC98nLpXFukShKI4sr8QK6t5sXjT/4HYezgr4Xix
zIwRKQ1ReXHO6ZNomuErKJjpFX/dn+5LT6Db5SVulrxL68ljashRqDeA7GMw4huo8xcNtxNV7xfb
oM1HgdoJhhqlb568nKX6+jaWGr9fZIRKoMH0vO/miKYJLOeWxNZ2Pgg700CXwOC83/aikmVGhgh1
jM3HpBk8aDp5Y21A0Fpp3kUhyZs4OUFcsj/y1g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EdEhYfxGLALWwz2A8RKGvmueJD2fHEVu9+KVbTSsUS32VnYoGnc14W6BjgM+aVdYFrvvOwQeTUpz
FZfb+sLXywNHm+adAV+xzqk1XvcJNt3VN2sycpXJY+68+tjH7IHZQ+8yRbqaYWnZVqJ90vR6XR0X
740D0LE2a3P59lGmu8Y=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qt/YSLKDmd7omBa2uY94RAUTN1YLtqMWhKZeF+FJccA6f+2IUvNFUb8VA+KvnOSWUfsIQ7ouGGSq
YzcNlVicCVvt/gv4b6dmyYXQ4pL8mISaNILUIDeJNsWNTft/hNt9Bp0lHqYr11R1miAo9TtM2l3b
UyQMH1aTUeEet6GtapPYFdaHR2DKzB9jvbi88vlPO9oz+QLneWzbOIs1SzJ49DV8fgNn4vi2PFqG
ENgTkZlveIrHMdk6vzm9wQQXQaXCNfLgWB+Y40/wwfO1ZstKHKuradIIvAQhEEKN0IGu3/bTl90D
UZLzQQibBYsl2VYsSLXf0dIMGIckVgiTbJRSGg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
u1LIH9BQ8X3la7q6da9Mzh6T4U6V+HvvkBBm4C+CQe7BF/eBwPNxSzxvZE/x0TG1c8bvOXRTxnmu
a+0ZGsqq5IqVTbQhfDEg9Y+gJz1IM8WMwqLVsmHSeUbpbnwngKoUbNQOQv1WRyNGnv4F/jI81nYX
HuXFyE2NVHTTMzCin34fKPiwVDQ+UzNTcayDrnU1CY+Udoh45KlE1l6+28uLuAnW4ACdWWr8ESLq
DR4dRp1oHvaNlXUK7vcnJ2+Ov/qLQc+1QeJeSM9svqPNs448IswOzIlk1ulhQh87kpwdHV2gdfSS
ekFaViYIKna0lus0TnUUqCwF9aOemBIgOBGm5w==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ThGX7m1wupKmfjpeSuERSB+T7gquJSX6tq2xggUCrpUGHebhya8nWjMujArHTtZh6oUVb0QX8VDf
NRFTTfQ29w/ozh6fTrTQ/PrboWzdLkaABpPNVyeMStlulCCsemZUduRW3R2l8qEq44TVZcrL3NLq
NQtvyT88wqSWUs/Ly+3bbOMwCFcUyreYECd3L7sFTekvmjgOzseWEkUqi5rYpFaoe2fIKBy3/i1I
IEhb5HNd3/4wBVm4JzwGU7MCwr7IHJ+wDpOVyuwb3lRK0uCKTbMLrXrLR6ETYzaSjx46bNWzWnZS
2jU9OaYlTxamZSRRC0tPHBB4HPVPLAdW2y8kLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H2BVuF6JPvdByoK1aCz7p5WLhtbYDEDat4vaF1+IGCqBNuCgU7ZEckdQrjRNgyLbBCuGUhV2/Z87
7zmLyvPKp31qiGE62Z1rxDDY/8uPTNJmHChiPtJdrxtM+doqnoh6vftv5e+5o/fBrPH19+yBL2Nh
Z5fckSgZhFQ68P5dQuOkyIC5tp3R/HOnMjpG2xTMeS1yDGuFnYHA32VMFhXbyJbD4Mp5jVlQzwLs
6CrhAWWd7oBlxQ1e6DiDkbPQI12utFzvD/zshqm0HKUZY7YNRVE4UKGU+0MUAEr2tYE/KkaHSWmA
hTE0pwWLvrn0T5ldb6JKisPFcCRFq1RseLqKnQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
KkmCCcPhzWVUpuyH7mDH/kWvZLU9F0bZj+FB6hEDWav7aepDlW40mXmjmlsPTq6UcrVxN2LRWKt6
aT20LRSTKTlRlh29oiVlGDyITvP4mqCOoNs5Jiye2gmf1rtBW2DXoysXfomK0SypsNpy8fNr18hG
57a6lvuAP8Rh6q4wDGslM3Xbu71JJk1C9lVARGmzGP/mJtvA3iedWC4Tg+7BrLO09FZ7ldiVfJlT
0wy6cQym8l60VY5SIWLLj1XoUbZONTLU3WT1lFs/tFqN1JtonQ6ZZg2qYEghgeAPL9/Gl6cdPPu3
wM+ETD/nD5LRfYZVM7Lb0ejBBAeKcAOOf+zbgXO7T24PqmwUerrefHxeVSb3oha6vCHiAnoRYuVp
Dxfq2ra9dO9LNsuPs03zR7rLLuvCmwUWqSB0+2Z9pTbpt7A4T5Fd0OLa4rDFr3LbFDf16sdDy0pK
tatqXYi/+Ytep9KZh2jjoxEetd1MLAo+Wd8Diu78IMAH3TBsO6hlYVqa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HlVefHqF6PMcC1QL4S6isRBBHrYDmuMKO68bwPID8DHMq9J2gPyVJo7oVhVhhh/uz4wr3XtJJrKV
kdSwhQxSbtiGD1Kme1G1EM2+tBEkDFjVnc5txT6Yz39JXmjVlokngCLa0jPfnQEDMSQLLctVLqHB
Y71YHEhdjR03f/ErlbzbJzk4954gXndSJ8W1+1CE6C/Q7JLvBQOes3Wdhx23NEFrPR+xF1JYErJB
MujUqjm2zC8WprwOfluOLYlb3C28uYfcybHvDfG9S+h5HezEzSBVtUh+EUlY65Ug4b4MZDbpMdHt
514c4v/RlO+5c67z0QhV9n8iVnzPoHkifYzPPA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GElKnNwHuDvUsC6n3ryq1yJlBpsGEgpqhJaMewBzWoI0ABOCOmkYXeVvVaght1MSSYlMMh/2kUno
8CMZ0oTtGoAOaDOj+2b/ipMpLfar6QSptPGGS1BDIyibKaIF995HpywP+JaSmoIUypZPu4EGqqUl
irumZXlXoi0CgR7fBMJk6fsFsv/H48YZEAvFSUqWN5RWtWqhFOCVJwjRB9qYv4Cz4znFjCSXHePO
3WhFhxbYdkg//WZm/i7Na8UEwV7skIyx4snZFQN3StEshEhlus9bZj0WaMhL/q3Qi5M5e0kvS+a2
TBIb31t89nzvzCVXX2TsVZQIOU1xjM22qEBd+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NvC4x0gmKiuZSBSnTCrYtP8VEcCHfYyFLPcOc7hcUGPwtoKZrCGumU4YJspQ4iyC4Ibe0vTPscVD
/EaTDg0G/qI5OV8V47s1r/8smLOrXQSKWcxqeT5UVy9c6GKlRKrC6ZskdRUI9wGVAliaeOeKbxqH
XR/4p0oMdtKBZdUEbyq2aZwf72LyBc6m5qbtV0bvdoCpJkLSCsRngzpyOKuDTUsZ//SwGnpt48W1
+Yrwea91WokwKvPn196R8ZLc0VmvRaNX+g8o4/P211VZMgur2tNI6ndi2tdu0/pQYQEHOxzwHvKg
qf9EnC05euLrpDCFshQjmyblT8x0L9rUTmfNSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9168)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
