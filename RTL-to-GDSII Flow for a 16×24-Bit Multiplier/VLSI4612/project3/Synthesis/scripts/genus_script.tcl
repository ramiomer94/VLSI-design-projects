########################################################################
# Path to GPDK45nm standard cell library
########################################################################

# --- PDK Path ---
# Path to your standard cell library (from the GPDK)
set GPDK45_DIR /CMC/kits/cadence/GPDK045/gsclib045_all_v4.4/gsclib045  ;#CHANGE THIS TO THE CORRECT PATH IF IT IS DIFFERENT

# --- Set Search Paths ---
# Look for library files in the PDK timing directory
set_db init_lib_search_path "$GPDK45_DIR/timing"

########################################################################
# Project-Specific Settings - Modify these for your design
########################################################################

# --- Design Files ---
# If your design has several HDL files, you have to put them all here.
# Example:  set rtlFiles [list ../../RTL/src/top.v ../../src/module1.v ../../src/module.v]

set rtlFiles [list ../RTL/src/mult_unsigned.v]  ;# List of your Verilog source files
set topModule mult_unsigned                     ;# Name of your top-level module (here counter.v)

# --- Synthesis Run Settings ---
set runName genus_$topModule                 ;# Base name for output files




########################################################################
# Synthesis Script - Generally, you don't need to change below this line
########################################################################


# --- Clock and Timing Constraints ---
set clockFrequency 150.0                     ;# Clock frequency in MHz
set clockName clk                            ;# Name of your clock signal (in the Verilog code)
set inputSetupTime 10                        ;# Input setup time (ps)
set outputDelayTime 30                       ;# Output delay time (ps)


# Look for HDL files in the current directory
set_db init_hdl_search_path {../RTL/src/}


# --- Load the Standard Cell Library ---
set_db library {slow_vdd1v0_basicCells.lib}

# --- Set Debug Level ---
set_db information_level 6  ;# Controls the verbosity of messages

# --- Calculate Clock Period ---
set clockPeriod [expr {1000000.0 / $clockFrequency}] ;# Clock period in ps

# --- Read and Elaborate Design ---
read_hdl -v2001 $rtlFiles
elaborate $topModule

# --- Set Drive Strength and Load ---
set_drive 2.0 [all_inputs]
set_load 4.0 [all_outputs]
set_max_fanout 5 [all_inputs]

# --- Define Clock ---
define_clock -period $clockPeriod -name $clockName [get_ports $clockName]

# --- Set Input and Output Delays ---
external_delay -input $inputSetupTime -clock $clockName [all_inputs]
external_delay -output $outputDelayTime -clock $clockName [all_outputs]

# --- Check Design for Issues ---
check_design -unresolved
report timing -lint

# --- Synthesis Optimization Effort ---
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

# --- Perform Synthesis ---
syn_generic
syn_map
syn_opt

# --- Rename Instances for Consistency ---
# Replaces characters like '[', ']', '.' in instance names with '_'
update_names -inst -restricted "\[ \] ." -replace_str "_" -log change_names_verilog

# --- Write Output Files ---
# Gate-level Verilog netlist
write_hdl -mapped > ./netlist/${runName}.v
# Synopsys Design Constraints (SDC) file
write_sdc > ./netlist/${runName}.sdc
# Standard Delay Format (SDF) file for timing annotation
write_sdf -delimiter / -edges check_edge -no_escape -setuphold split -recrem split > ./netlist/${runName}.sdf

# --- Generate Reports ---
report timing > ./reports/${runName}_timing.rep
report gates >  ./reports/${runName}_area.rep
report power >  ./reports/${runName}_power.rep

# --- Show GUI (Optional) ---
gui_show

# --- Exit (Optional) ---
# Uncomment the following line if you want the tool to exit automatically
# exit
