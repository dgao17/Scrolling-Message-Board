# Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
    set_property IOSTANDARD LVCMOS33 [get_ports clk]
    
#set_property PACKAGE_PIN W5 [get_ports clk2]
#    set_property IOSTANDARD LVCMOS33 [get_ports clk2]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnU_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnD_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnL_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnR_IBUF]

#Seven-segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

set_property PACKAGE_PIN U2 [get_ports {an[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]

#Buttons
#Sch name = BTNU
set_property PACKAGE_PIN T18 [get_ports btnU]
    set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#Sch name = BTNL
set_property PACKAGE_PIN W19 [get_ports btnL]
    set_property IOSTANDARD LVCMOS33 [get_ports btnL]
#Sch name = BTNR
set_property PACKAGE_PIN T17 [get_ports btnR]
    set_property IOSTANDARD LVCMOS33 [get_ports btnR]
#Sch name = BTND
set_property PACKAGE_PIN U17 [get_ports btnD]
    set_property IOSTANDARD LVCMOS33 [get_ports btnD]    
#Sch name = BTNC
set_property PACKAGE_PIN U18 [get_ports btnC]
set_property IOSTANDARD LVCMOS33 [get_ports btnC]

#USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2_CLK]
    #set_property IOSTANDARD LVCMOS33 [get_ports PS2_CLK]
    #set_property PULLUP true [get_ports PS2_CLK]
#set_property PACKAGE_PIN B17 [get_ports PS2_DATA]
    #set_property IOSTANDARD LVCMOS33 [get_ports PS2_DATA]
    #set_property PULLUP true [get_ports PS2_DATA]

