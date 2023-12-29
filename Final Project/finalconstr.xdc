set_property PACKAGE_PIN V7 [get_ports ssDP]
set_property PACKAGE_PIN W7 [get_ports {ssDisp[6]}]
set_property PACKAGE_PIN W6 [get_ports {ssDisp[5]}]
set_property PACKAGE_PIN U8 [get_ports {ssDisp[4]}]
set_property PACKAGE_PIN V8 [get_ports {ssDisp[3]}]
set_property PACKAGE_PIN U5 [get_ports {ssDisp[2]}]
set_property PACKAGE_PIN V5 [get_ports {ssDisp[1]}]
set_property PACKAGE_PIN U7 [get_ports {ssDisp[0]}]
set_property PACKAGE_PIN W4 [get_ports {ssSel[3]}]
set_property PACKAGE_PIN V4 [get_ports {ssSel[2]}]
set_property PACKAGE_PIN U4 [get_ports {ssSel[1]}]
set_property PACKAGE_PIN U2 [get_ports {ssSel[0]}]
set_property PACKAGE_PIN U17 [get_ports btnBottom]
set_property PACKAGE_PIN U18 [get_ports btnCenter]
set_property PACKAGE_PIN W19 [get_ports btnLeft]
set_property PACKAGE_PIN T17 [get_ports btnRight]
set_property PACKAGE_PIN T18 [get_ports btnTop]
set_property PACKAGE_PIN W5 [get_ports clk]
set_property PACKAGE_PIN R2 [get_ports {sw[0]}]
set_property PACKAGE_PIN T1 [get_ports {sw[1]}]
set_property PACKAGE_PIN U1 [get_ports {sw[2]}]
set_property PACKAGE_PIN W2 [get_ports {sw[3]}]
set_property PACKAGE_PIN R3 [get_ports {sw[4]}]
set_property PACKAGE_PIN T2 [get_ports {sw[5]}]
set_property PACKAGE_PIN T3 [get_ports {sw[6]}]
set_property PACKAGE_PIN V2 [get_ports {sw[7]}]
set_property PACKAGE_PIN W13 [get_ports {sw[8]}]
set_property PACKAGE_PIN W14 [get_ports {sw[9]}]

set_property IOSTANDARD LVCMOS18 [get_ports ssDP]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssDisp[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ssSel[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports btnBottom]
set_property IOSTANDARD LVCMOS18 [get_ports btnCenter]
set_property IOSTANDARD LVCMOS18 [get_ports btnLeft]
set_property IOSTANDARD LVCMOS18 [get_ports btnRight]
set_property IOSTANDARD LVCMOS18 [get_ports btnTop]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {sw[9]}]

create_clock -period 10.000 -name clk0 -waveform {0.000 5.000} [get_ports clk]
