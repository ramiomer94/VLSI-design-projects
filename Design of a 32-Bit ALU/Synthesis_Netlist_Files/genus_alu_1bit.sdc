# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.17-s066_1 on Tue Apr 01 16:59:05 EDT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design alu_1bit

create_clock -name "clk" -period 1000.0 -waveform {0.0 500.0} 
set_load -pin_load 4.0 [get_ports Fi]
set_load -pin_load 4.0 [get_ports Couti]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports Cini]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports A_next]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports A_prev]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports Bi]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports Ai]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports Couti]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports Fi]
set_max_fanout 5.000 [get_ports Ai]
set_max_fanout 5.000 [get_ports Bi]
set_max_fanout 5.000 [get_ports A_prev]
set_max_fanout 5.000 [get_ports A_next]
set_max_fanout 5.000 [get_ports Cini]
set_max_fanout 5.000 [get_ports {sel[3]}]
set_max_fanout 5.000 [get_ports {sel[2]}]
set_max_fanout 5.000 [get_ports {sel[1]}]
set_max_fanout 5.000 [get_ports {sel[0]}]
set_drive 2.0 [get_ports Ai]
set_drive 2.0 [get_ports Bi]
set_drive 2.0 [get_ports A_prev]
set_drive 2.0 [get_ports A_next]
set_drive 2.0 [get_ports Cini]
set_drive 2.0 [get_ports {sel[3]}]
set_drive 2.0 [get_ports {sel[2]}]
set_drive 2.0 [get_ports {sel[1]}]
set_drive 2.0 [get_ports {sel[0]}]
set_wire_load_mode "enclosed"
