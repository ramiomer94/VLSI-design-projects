###############################################################################
# Makefile - Multi-Step VHDL Flow with Cadence Xcelium
###############################################################################

# --- Project Directories and Files ---
FILELIST        = filelist.f        # Lists all .vhd files to compile
SIM_DIR         = ./
RESULTS_DIR     = $(SIM_DIR)/results
TCL_SCRIPT      = ./scripts/run.tcl
CDSLIB          = cds.lib

# --- Xcelium Common Options ---
# Adjust VHDL standard, access, and other flags as needed.
XRUN_FLAGS      = -64bit \
                  -v93 \
                  -relax \
                  -access +rwc \
                  $(if $(filter yes,$(DEBUG)),-linedebug,)


# --- Top-level Testbench Entity Name ---
# Match the entity name in tb_counter.v
TOP_LEVEL       = mult_unsigned_tb

# --- Waveform Viewing ---
# "yes" -> open SimVision during simulation
# "no"  -> batch mode only
VIEW_WAVEFORMS  ?= yes

# --- Default Targets ---
.PHONY: all compile elaborate simulate clean

all: compile elaborate simulate

###############################################################################
# 1) Compile
#    Compile all VHDL sources into the default work library.
###############################################################################
compile:
	@echo "================================================================="
	@echo " Compiling VHDL/Verilog sources into default work library"
	@echo "================================================================="
	@mkdir -p $(RESULTS_DIR)

	xrun $(XRUN_FLAGS) \
	     -compile \
	     -f $(FILELIST) \
	     -logfile $(RESULTS_DIR)/compile.log

###############################################################################
# 2) Elaborate
#    Create a simulation snapshot of "work.<TOP_LEVEL>".
###############################################################################
elaborate:
	@echo "================================================================="
	@echo " Elaborating top-level testbench: work.$(TOP_LEVEL)"
	@echo "================================================================="
	@mkdir -p $(RESULTS_DIR)

	xrun $(XRUN_FLAGS) \
	     -elaborate \
	     -top $(TOP_LEVEL) \
	     -cdslib $(CDSLIB) \
	     -logfile $(RESULTS_DIR)/elaborate.log

###############################################################################
# 3) Simulate
#    Run the snapshot from the previous step. Open SimVision if requested.
###############################################################################
simulate:
	@echo "================================================================="
	@echo " Simulating snapshot: work.$(TOP_LEVEL)"
	@echo "================================================================="
	@mkdir -p $(RESULTS_DIR)

	xrun $(XRUN_FLAGS) \
	     -R \
	     -cdslib $(CDSLIB) \
	     -logfile $(RESULTS_DIR)/simulate.log \
	     -input $(TCL_SCRIPT) \
	     $(if $(filter yes,$(VIEW_WAVEFORMS)),-gui,)

###############################################################################
# 4) Clean
#    Remove generated libraries, logs, waveforms, etc.
###############################################################################
clean:
	@echo "Cleaning up..."
	rm -rf xrun.d xrun.history xcelium.d *.shm *.log *.wlf *.trn *.wdb
	rm -rf $(RESULTS_DIR)/*

###############################################################################
# Notes:
# 1. Ensure the filelist (filelist.f) contains the list of VHDL/Verilog files, one per line.
#    Example:
#      DFF.vhd
#      tb_DFF.vhd
# 2. Adjust the TCL_SCRIPT to point to your Tcl file for simulation scripting.
# 3. Ensure the TOP_LEVEL matches your testbench entity name.
###############################################################################

