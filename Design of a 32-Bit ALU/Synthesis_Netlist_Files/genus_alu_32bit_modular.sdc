# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.17-s066_1 on Tue Apr 01 17:40:18 EDT 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design alu_32bit_modular

create_clock -name "clk" -period 1000.0 -waveform {0.0 500.0} 
set_load -pin_load 4.0 [get_ports {F[31]}]
set_load -pin_load 4.0 [get_ports {F[30]}]
set_load -pin_load 4.0 [get_ports {F[29]}]
set_load -pin_load 4.0 [get_ports {F[28]}]
set_load -pin_load 4.0 [get_ports {F[27]}]
set_load -pin_load 4.0 [get_ports {F[26]}]
set_load -pin_load 4.0 [get_ports {F[25]}]
set_load -pin_load 4.0 [get_ports {F[24]}]
set_load -pin_load 4.0 [get_ports {F[23]}]
set_load -pin_load 4.0 [get_ports {F[22]}]
set_load -pin_load 4.0 [get_ports {F[21]}]
set_load -pin_load 4.0 [get_ports {F[20]}]
set_load -pin_load 4.0 [get_ports {F[19]}]
set_load -pin_load 4.0 [get_ports {F[18]}]
set_load -pin_load 4.0 [get_ports {F[17]}]
set_load -pin_load 4.0 [get_ports {F[16]}]
set_load -pin_load 4.0 [get_ports {F[15]}]
set_load -pin_load 4.0 [get_ports {F[14]}]
set_load -pin_load 4.0 [get_ports {F[13]}]
set_load -pin_load 4.0 [get_ports {F[12]}]
set_load -pin_load 4.0 [get_ports {F[11]}]
set_load -pin_load 4.0 [get_ports {F[10]}]
set_load -pin_load 4.0 [get_ports {F[9]}]
set_load -pin_load 4.0 [get_ports {F[8]}]
set_load -pin_load 4.0 [get_ports {F[7]}]
set_load -pin_load 4.0 [get_ports {F[6]}]
set_load -pin_load 4.0 [get_ports {F[5]}]
set_load -pin_load 4.0 [get_ports {F[4]}]
set_load -pin_load 4.0 [get_ports {F[3]}]
set_load -pin_load 4.0 [get_ports {F[2]}]
set_load -pin_load 4.0 [get_ports {F[1]}]
set_load -pin_load 4.0 [get_ports {F[0]}]
set_load -pin_load 4.0 [get_ports Cout]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {sel[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports DinR]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports DinL]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports Cin]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[16]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[17]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[18]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[19]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[20]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[21]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[22]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[23]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[24]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[25]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[26]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[27]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[28]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[29]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[30]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {B[31]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[16]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[17]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[18]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[19]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[20]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[21]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[22]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[23]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[24]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[25]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[26]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[27]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[28]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[29]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[30]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.01 [get_ports {A[31]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports Cout]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[16]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[17]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[18]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[19]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[20]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[21]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[22]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[23]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[24]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[25]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[26]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[27]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[28]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[29]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[30]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.03 [get_ports {F[31]}]
set_max_fanout 5.000 [get_ports {A[31]}]
set_max_fanout 5.000 [get_ports {A[30]}]
set_max_fanout 5.000 [get_ports {A[29]}]
set_max_fanout 5.000 [get_ports {A[28]}]
set_max_fanout 5.000 [get_ports {A[27]}]
set_max_fanout 5.000 [get_ports {A[26]}]
set_max_fanout 5.000 [get_ports {A[25]}]
set_max_fanout 5.000 [get_ports {A[24]}]
set_max_fanout 5.000 [get_ports {A[23]}]
set_max_fanout 5.000 [get_ports {A[22]}]
set_max_fanout 5.000 [get_ports {A[21]}]
set_max_fanout 5.000 [get_ports {A[20]}]
set_max_fanout 5.000 [get_ports {A[19]}]
set_max_fanout 5.000 [get_ports {A[18]}]
set_max_fanout 5.000 [get_ports {A[17]}]
set_max_fanout 5.000 [get_ports {A[16]}]
set_max_fanout 5.000 [get_ports {A[15]}]
set_max_fanout 5.000 [get_ports {A[14]}]
set_max_fanout 5.000 [get_ports {A[13]}]
set_max_fanout 5.000 [get_ports {A[12]}]
set_max_fanout 5.000 [get_ports {A[11]}]
set_max_fanout 5.000 [get_ports {A[10]}]
set_max_fanout 5.000 [get_ports {A[9]}]
set_max_fanout 5.000 [get_ports {A[8]}]
set_max_fanout 5.000 [get_ports {A[7]}]
set_max_fanout 5.000 [get_ports {A[6]}]
set_max_fanout 5.000 [get_ports {A[5]}]
set_max_fanout 5.000 [get_ports {A[4]}]
set_max_fanout 5.000 [get_ports {A[3]}]
set_max_fanout 5.000 [get_ports {A[2]}]
set_max_fanout 5.000 [get_ports {A[1]}]
set_max_fanout 5.000 [get_ports {A[0]}]
set_max_fanout 5.000 [get_ports {B[31]}]
set_max_fanout 5.000 [get_ports {B[30]}]
set_max_fanout 5.000 [get_ports {B[29]}]
set_max_fanout 5.000 [get_ports {B[28]}]
set_max_fanout 5.000 [get_ports {B[27]}]
set_max_fanout 5.000 [get_ports {B[26]}]
set_max_fanout 5.000 [get_ports {B[25]}]
set_max_fanout 5.000 [get_ports {B[24]}]
set_max_fanout 5.000 [get_ports {B[23]}]
set_max_fanout 5.000 [get_ports {B[22]}]
set_max_fanout 5.000 [get_ports {B[21]}]
set_max_fanout 5.000 [get_ports {B[20]}]
set_max_fanout 5.000 [get_ports {B[19]}]
set_max_fanout 5.000 [get_ports {B[18]}]
set_max_fanout 5.000 [get_ports {B[17]}]
set_max_fanout 5.000 [get_ports {B[16]}]
set_max_fanout 5.000 [get_ports {B[15]}]
set_max_fanout 5.000 [get_ports {B[14]}]
set_max_fanout 5.000 [get_ports {B[13]}]
set_max_fanout 5.000 [get_ports {B[12]}]
set_max_fanout 5.000 [get_ports {B[11]}]
set_max_fanout 5.000 [get_ports {B[10]}]
set_max_fanout 5.000 [get_ports {B[9]}]
set_max_fanout 5.000 [get_ports {B[8]}]
set_max_fanout 5.000 [get_ports {B[7]}]
set_max_fanout 5.000 [get_ports {B[6]}]
set_max_fanout 5.000 [get_ports {B[5]}]
set_max_fanout 5.000 [get_ports {B[4]}]
set_max_fanout 5.000 [get_ports {B[3]}]
set_max_fanout 5.000 [get_ports {B[2]}]
set_max_fanout 5.000 [get_ports {B[1]}]
set_max_fanout 5.000 [get_ports {B[0]}]
set_max_fanout 5.000 [get_ports Cin]
set_max_fanout 5.000 [get_ports DinL]
set_max_fanout 5.000 [get_ports DinR]
set_max_fanout 5.000 [get_ports {sel[3]}]
set_max_fanout 5.000 [get_ports {sel[2]}]
set_max_fanout 5.000 [get_ports {sel[1]}]
set_max_fanout 5.000 [get_ports {sel[0]}]
set_drive 2.0 [get_ports {A[31]}]
set_drive 2.0 [get_ports {A[30]}]
set_drive 2.0 [get_ports {A[29]}]
set_drive 2.0 [get_ports {A[28]}]
set_drive 2.0 [get_ports {A[27]}]
set_drive 2.0 [get_ports {A[26]}]
set_drive 2.0 [get_ports {A[25]}]
set_drive 2.0 [get_ports {A[24]}]
set_drive 2.0 [get_ports {A[23]}]
set_drive 2.0 [get_ports {A[22]}]
set_drive 2.0 [get_ports {A[21]}]
set_drive 2.0 [get_ports {A[20]}]
set_drive 2.0 [get_ports {A[19]}]
set_drive 2.0 [get_ports {A[18]}]
set_drive 2.0 [get_ports {A[17]}]
set_drive 2.0 [get_ports {A[16]}]
set_drive 2.0 [get_ports {A[15]}]
set_drive 2.0 [get_ports {A[14]}]
set_drive 2.0 [get_ports {A[13]}]
set_drive 2.0 [get_ports {A[12]}]
set_drive 2.0 [get_ports {A[11]}]
set_drive 2.0 [get_ports {A[10]}]
set_drive 2.0 [get_ports {A[9]}]
set_drive 2.0 [get_ports {A[8]}]
set_drive 2.0 [get_ports {A[7]}]
set_drive 2.0 [get_ports {A[6]}]
set_drive 2.0 [get_ports {A[5]}]
set_drive 2.0 [get_ports {A[4]}]
set_drive 2.0 [get_ports {A[3]}]
set_drive 2.0 [get_ports {A[2]}]
set_drive 2.0 [get_ports {A[1]}]
set_drive 2.0 [get_ports {A[0]}]
set_drive 2.0 [get_ports {B[31]}]
set_drive 2.0 [get_ports {B[30]}]
set_drive 2.0 [get_ports {B[29]}]
set_drive 2.0 [get_ports {B[28]}]
set_drive 2.0 [get_ports {B[27]}]
set_drive 2.0 [get_ports {B[26]}]
set_drive 2.0 [get_ports {B[25]}]
set_drive 2.0 [get_ports {B[24]}]
set_drive 2.0 [get_ports {B[23]}]
set_drive 2.0 [get_ports {B[22]}]
set_drive 2.0 [get_ports {B[21]}]
set_drive 2.0 [get_ports {B[20]}]
set_drive 2.0 [get_ports {B[19]}]
set_drive 2.0 [get_ports {B[18]}]
set_drive 2.0 [get_ports {B[17]}]
set_drive 2.0 [get_ports {B[16]}]
set_drive 2.0 [get_ports {B[15]}]
set_drive 2.0 [get_ports {B[14]}]
set_drive 2.0 [get_ports {B[13]}]
set_drive 2.0 [get_ports {B[12]}]
set_drive 2.0 [get_ports {B[11]}]
set_drive 2.0 [get_ports {B[10]}]
set_drive 2.0 [get_ports {B[9]}]
set_drive 2.0 [get_ports {B[8]}]
set_drive 2.0 [get_ports {B[7]}]
set_drive 2.0 [get_ports {B[6]}]
set_drive 2.0 [get_ports {B[5]}]
set_drive 2.0 [get_ports {B[4]}]
set_drive 2.0 [get_ports {B[3]}]
set_drive 2.0 [get_ports {B[2]}]
set_drive 2.0 [get_ports {B[1]}]
set_drive 2.0 [get_ports {B[0]}]
set_drive 2.0 [get_ports Cin]
set_drive 2.0 [get_ports DinL]
set_drive 2.0 [get_ports DinR]
set_drive 2.0 [get_ports {sel[3]}]
set_drive 2.0 [get_ports {sel[2]}]
set_drive 2.0 [get_ports {sel[1]}]
set_drive 2.0 [get_ports {sel[0]}]
set_wire_load_mode "enclosed"
