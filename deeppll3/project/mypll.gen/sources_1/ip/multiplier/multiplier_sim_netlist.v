// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun May 17 15:33:24 2026
// Host        : LAPTOP-V5P4DNLK running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/qipif/Desktop/FPGAProject/01_Preference/08_mypll/project/mypll.gen/sources_1/ip/multiplier/multiplier_sim_netlist.v
// Design      : multiplier
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "multiplier,mult_gen_v12_0_24,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_24,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module multiplier
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
  multiplier_mult_gen_v12_0_24 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 5728)
`pragma protect data_block
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
4ecwMb7GTCzS8rh4kw3fPR32uYFGVqq6UtE9cg==
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9152)
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
