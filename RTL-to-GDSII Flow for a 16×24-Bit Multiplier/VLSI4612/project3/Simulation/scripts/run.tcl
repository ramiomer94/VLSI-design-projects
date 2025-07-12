# scripts/run.tcl

# Where to store waveforms
set SIM_RESULTS_DIR ./results

# Make sure the directory exists
if {![file isdirectory $SIM_RESULTS_DIR]} {
    file mkdir $SIM_RESULTS_DIR
}

# Open waveform database
database -open $SIM_RESULTS_DIR/waves -default

# Probe signals recursively from the top-level instance
probe -create -all -depth all

# Run the simulation for 100 ns
run 500 ns

# Close the waveform database (explicitly specify the database name)
database -close $SIM_RESULTS_DIR/waves

# Exit the simulation
exit

