## Clock input
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Reset button
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## North-South LEDs
set_property PACKAGE_PIN V17 [get_ports {NS_LED[0]}]  ## Green
set_property PACKAGE_PIN V16 [get_ports {NS_LED[1]}]  ## Yellow
set_property PACKAGE_PIN W16 [get_ports {NS_LED[2]}]  ## Red
set_property IOSTANDARD LVCMOS33 [get_ports {NS_LED[*]}]

## East-West LEDs
set_property PACKAGE_PIN W15 [get_ports {EW_LED[0]}]  ## Green
set_property PACKAGE_PIN U15 [get_ports {EW_LED[1]}]  ## Yellow
set_property PACKAGE_PIN U16 [get_ports {EW_LED[2]}]  ## Red
set_property IOSTANDARD LVCMOS33 [get_ports {EW_LED[*]}]

## Seven-segment display (common cathode assumed)
set_property PACKAGE_PIN T10 [get_ports {seg[0]}] ## a
set_property PACKAGE_PIN R10 [get_ports {seg[1]}] ## b
set_property PACKAGE_PIN P10 [get_ports {seg[2]}] ## c
set_property PACKAGE_PIN N10 [get_ports {seg[3]}] ## d
set_property PACKAGE_PIN M10 [get_ports {seg[4]}] ## e
set_property PACKAGE_PIN L10 [get_ports {seg[5]}] ## f
set_property PACKAGE_PIN K10 [get_ports {seg[6]}] ## g
set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]
