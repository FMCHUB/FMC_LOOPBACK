set_property CFGBVS VCCO [current_design];
set_property CONFIG_VOLTAGE 3.3 [current_design];

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design];
set_property CONFIG_MODE SPIx4 [current_design];

set_property PACKAGE_PIN R4                                      [get_ports SYSCLK]; #IO_L13P_T2_MRCC_34 Sch=sysclk
set_property IOSTANDARD LVCMOS33                                 [get_ports SYSCLK];
create_clock -period 10.000 -name sysclk -waveform {0.000 5.000} [get_ports SYSCLK];

set_property -dict { PACKAGE_PIN AA13  IOSTANDARD LVCMOS33 } [get_ports { SET_VADJ[0] }]; # Bank 13 2V5
set_property -dict { PACKAGE_PIN AB17  IOSTANDARD LVCMOS33 } [get_ports { SET_VADJ[1] }]; # Bank 13 2V5
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { VADJ_EN }];     # Bank 13 2V5

## FMC
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports { CLK0_M2C_N }]; #IO_L12N_T1_MRCC_15 Sch=fmc_clk0_m2c_n
set_property -dict { PACKAGE_PIN J19   IOSTANDARD LVCMOS33 } [get_ports { CLK0_M2C_P }]; #IO_L12P_T1_MRCC_15 Sch=fmc_clk0_m2c_p
set_property -dict { PACKAGE_PIN C19   IOSTANDARD LVCMOS33 } [get_ports { CLK1_M2C_N }]; #IO_L13N_T2_MRCC_16 Sch=fmc_clk1_m2c_n
set_property -dict { PACKAGE_PIN C18   IOSTANDARD LVCMOS33 } [get_ports { CLK1_M2C_P }]; #IO_L13P_T2_MRCC_16 Sch=fmc_clk1_m2c_p
set_property -dict { PACKAGE_PIN K19   IOSTANDARD LVCMOS33 } [get_ports { LA_00_N }]; #IO_L13N_T2_MRCC_15 Sch=fmc_la00_cc_n
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { LA_00_P }]; #IO_L13P_T2_MRCC_15 Sch=fmc_la00_cc_p
set_property -dict { PACKAGE_PIN J21   IOSTANDARD LVCMOS33 } [get_ports { LA_01_N }]; #IO_L11N_T1_SRCC_15 Sch=fmc_la01_cc_n
set_property -dict { PACKAGE_PIN J20   IOSTANDARD LVCMOS33 } [get_ports { LA_01_P }]; #IO_L11P_T1_SRCC_15 Sch=fmc_la01_cc_p
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { LA_02_N }]; #IO_L16N_T2_A27_15 Sch=fmc_la_n[02]
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { LA_02_P }]; #IO_L16P_T2_A28_15 Sch=fmc_la_p[02]
set_property -dict { PACKAGE_PIN N19   IOSTANDARD LVCMOS33 } [get_ports { LA_03_N }]; #IO_L17N_T2_A25_15 Sch=fmc_la_n[03]
set_property -dict { PACKAGE_PIN N18   IOSTANDARD LVCMOS33 } [get_ports { LA_03_P }]; #IO_L17P_T2_A26_15 Sch=fmc_la_p[03]
set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { LA_04_N }]; #IO_L18N_T2_A23_15 Sch=fmc_la_n[04]
set_property -dict { PACKAGE_PIN N20   IOSTANDARD LVCMOS33 } [get_ports { LA_04_P }]; #IO_L18P_T2_A24_15 Sch=fmc_la_p[04]
set_property -dict { PACKAGE_PIN L21   IOSTANDARD LVCMOS33 } [get_ports { LA_05_N }]; #IO_L10N_T1_AD11N_15 Sch=fmc_la_n[05]
set_property -dict { PACKAGE_PIN M21   IOSTANDARD LVCMOS33 } [get_ports { LA_05_P }]; #IO_L10P_T1_AD11P_15 Sch=fmc_la_p[05]
set_property -dict { PACKAGE_PIN M22   IOSTANDARD LVCMOS33 } [get_ports { LA_06_N }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=fmc_la_n[06]
set_property -dict { PACKAGE_PIN N22   IOSTANDARD LVCMOS33 } [get_ports { LA_06_P }]; #IO_L15P_T2_DQS_15 Sch=fmc_la_p[06]
set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { LA_07_N }]; #IO_L20N_T3_A19_15 Sch=fmc_la_n[07]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { LA_07_P }]; #IO_L20P_T3_A20_15 Sch=fmc_la_p[07]
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LA_08_N }]; #IO_L24N_T3_RS0_15 Sch=fmc_la_n[08]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { LA_08_P }]; #IO_L24P_T3_RS1_15 Sch=fmc_la_p[08]
set_property -dict { PACKAGE_PIN G20   IOSTANDARD LVCMOS33 } [get_ports { LA_09_N }]; #IO_L8N_T1_AD10N_15 Sch=fmc_la_n[09]
set_property -dict { PACKAGE_PIN H20   IOSTANDARD LVCMOS33 } [get_ports { LA_09_P }]; #IO_L8P_T1_AD10P_15 Sch=fmc_la_p[09]
set_property -dict { PACKAGE_PIN K22   IOSTANDARD LVCMOS33 } [get_ports { LA_10_N }]; #IO_L9N_T1_DQS_AD3N_15 Sch=fmc_la_n[10]
set_property -dict { PACKAGE_PIN K21   IOSTANDARD LVCMOS33 } [get_ports { LA_10_P }]; #IO_L9P_T1_DQS_AD3P_15 Sch=fmc_la_p[10]
set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { LA_11_N }]; #IO_L22N_T3_A16_15 Sch=fmc_la_n[11]
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { LA_11_P }]; #IO_L22P_T3_A17_15 Sch=fmc_la_p[11]
set_property -dict { PACKAGE_PIN L20   IOSTANDARD LVCMOS33 } [get_ports { LA_12_N }]; #IO_L14N_T2_SRCC_15 Sch=fmc_la_n[12]
set_property -dict { PACKAGE_PIN L19   IOSTANDARD LVCMOS33 } [get_ports { LA_12_P }]; #IO_L14P_T2_SRCC_15 Sch=fmc_la_p[12]
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { LA_13_N }]; #IO_L21N_T3_DQS_A18_15 Sch=fmc_la_n[13]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { LA_13_P }]; #IO_L21P_T3_DQS_15 Sch=fmc_la_p[13]
set_property -dict { PACKAGE_PIN H22   IOSTANDARD LVCMOS33 } [get_ports { LA_14_N }]; #IO_L7N_T1_AD2N_15 Sch=fmc_la_n[14]
set_property -dict { PACKAGE_PIN J22   IOSTANDARD LVCMOS33 } [get_ports { LA_14_P }]; #IO_L7P_T1_AD2P_15 Sch=fmc_la_p[14]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { LA_15_N }]; #IO_L23N_T3_FWE_B_15 Sch=fmc_la_n[15]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { LA_15_P }]; #IO_L23P_T3_FOE_B_15 Sch=fmc_la_p[15]
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { LA_16_N }]; #IO_L4N_T0_15 Sch=fmc_la_n[16]
set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { LA_16_P }]; #IO_L4P_T0_15 Sch=fmc_la_p[16]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { LA_17_N }]; #IO_L11N_T1_SRCC_16 Sch=fmc_la17_cc_n
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { LA_17_P }]; #IO_L11P_T1_SRCC_16 Sch=fmc_la17_cc_p
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { LA_18_N }]; #IO_L12N_T1_MRCC_16 Sch=fmc_la18_cc_n
set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { LA_18_P }]; #IO_L12P_T1_MRCC_16 Sch=fmc_la18_cc_p
set_property -dict { PACKAGE_PIN A19   IOSTANDARD LVCMOS33 } [get_ports { LA_19_N }]; #IO_L17N_T2_16 Sch=fmc_la_n[19]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { LA_19_P }]; #IO_L17P_T2_16 Sch=fmc_la_p[19]
set_property -dict { PACKAGE_PIN F20   IOSTANDARD LVCMOS33 } [get_ports { LA_20_N }]; #IO_L18N_T2_16 Sch=fmc_la_n[20]
set_property -dict { PACKAGE_PIN F19   IOSTANDARD LVCMOS33 } [get_ports { LA_20_P }]; #IO_L18P_T2_16 Sch=fmc_la_p[20]
set_property -dict { PACKAGE_PIN D19   IOSTANDARD LVCMOS33 } [get_ports { LA_21_N }]; #IO_L14N_T2_SRCC_16 Sch=fmc_la_n[21]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { LA_21_P }]; #IO_L14P_T2_SRCC_16 Sch=fmc_la_p[21]
set_property -dict { PACKAGE_PIN D21   IOSTANDARD LVCMOS33 } [get_ports { LA_22_N }]; #IO_L23N_T3_16 Sch=fmc_la_n[22]
set_property -dict { PACKAGE_PIN E21   IOSTANDARD LVCMOS33 } [get_ports { LA_22_P }]; #IO_L23P_T3_16 Sch=fmc_la_p[22]
set_property -dict { PACKAGE_PIN A21   IOSTANDARD LVCMOS33 } [get_ports { LA_23_N }]; #IO_L21N_T3_DQS_16 Sch=fmc_la_n[23]
set_property -dict { PACKAGE_PIN B21   IOSTANDARD LVCMOS33 } [get_ports { LA_23_P }]; #IO_L21P_T3_DQS_16 Sch=fmc_la_p[23]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { LA_24_N }]; #IO_L7N_T1_16 Sch=fmc_la_n[24]
set_property -dict { PACKAGE_PIN B15   IOSTANDARD LVCMOS33 } [get_ports { LA_24_P }]; #IO_L7P_T1_16 Sch=fmc_la_p[24]
set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { LA_25_N }]; #IO_L2N_T0_16 Sch=fmc_la_n[25]
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { LA_25_P }]; #IO_L2P_T0_16 Sch=fmc_la_p[25]
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { LA_26_N }]; #IO_L15N_T2_DQS_16 Sch=fmc_la_n[26]
set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { LA_26_P }]; #IO_L15P_T2_DQS_16 Sch=fmc_la_p[26]
set_property -dict { PACKAGE_PIN A20   IOSTANDARD LVCMOS33 } [get_ports { LA_27_N }]; #IO_L16N_T2_16 Sch=fmc_la_n[27]
set_property -dict { PACKAGE_PIN B20   IOSTANDARD LVCMOS33 } [get_ports { LA_27_P }]; #IO_L16P_T2_16 Sch=fmc_la_p[27]
set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { LA_28_N }]; #IO_L8N_T1_16 Sch=fmc_la_n[28]
set_property -dict { PACKAGE_PIN C13   IOSTANDARD LVCMOS33 } [get_ports { LA_28_P }]; #IO_L8P_T1_16 Sch=fmc_la_p[28]
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { LA_29_N }]; #IO_L3N_T0_DQS_16 Sch=fmc_la_n[29]
set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { LA_29_P }]; #IO_L3P_T0_DQS_16 Sch=fmc_la_p[29]
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { LA_30_N }]; #IO_L10N_T1_16 Sch=fmc_la_n[30]
set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { LA_30_P }]; #IO_L10P_T1_16 Sch=fmc_la_p[30]
set_property -dict { PACKAGE_PIN E14   IOSTANDARD LVCMOS33 } [get_ports { LA_31_N }]; #IO_L4N_T0_16 Sch=fmc_la_n[31]
set_property -dict { PACKAGE_PIN E13   IOSTANDARD LVCMOS33 } [get_ports { LA_31_P }]; #IO_L4P_T0_16 Sch=fmc_la_p[31]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { LA_32_N }]; #IO_L9N_T1_DQS_16 Sch=fmc_la_n[32]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { LA_32_P }]; #IO_L9P_T1_DQS_16 Sch=fmc_la_p[32]
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { LA_33_N }]; #IO_L1N_T0_16 Sch=fmc_la_n[33]
set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { LA_33_P }]; #IO_L1P_T0_16 Sch=fmc_la_p[33]

## LEDs
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L15P_T2_DQS_13 Sch=led[0]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L15N_T2_DQS_13 Sch=led[1]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L17P_T2_13 Sch=led[2]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L17N_T2_13 Sch=led[3]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L14N_T2_SRCC_13 Sch=led[4]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; #IO_L16N_T2_13 Sch=led[5]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; #IO_L16P_T2_13 Sch=led[6]
set_property -dict { PACKAGE_PIN Y13   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; #IO_L5P_T0_13 Sch=led[7]

## SWITCHES
set_property -dict { PACKAGE_PIN E22   IOSTANDARD LVCMOS33 } [get_ports { SW0 }]; #IO_L15P_T2_DQS_13 Sch=led[0]

## BUTTONS
set_property -dict { PACKAGE_PIN B22 IOSTANDARD LVCMOS33 } [get_ports { BTNC }]; #IO_L20N_T3_16 Sch=btnc, Bank supply=VADJ