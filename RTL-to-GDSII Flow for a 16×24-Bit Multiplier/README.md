# RTL-to-GDSII Flow for a 16×24-Bit Multiplier

This project demonstrates the complete ASIC design flow for a pipelined unsigned 16×24-bit multiplier—from Verilog RTL simulation to final GDSII layout using industry-standard Cadence tools.

---

## Overview

This project was completed for the Digital VLSI course (EECS4612) at York University. It highlights the full ASIC design workflow for a custom-designed 16×24-bit unsigned multiplier. The key steps included:

- Functional simulation using **Cadence Xcelium**
- Logic synthesis using **Cadence Genus**
- Place and route using **Cadence Innovus**
- Post-layout analysis using **Cadence Virtuoso**

---

## Tools Used

- **Cadence Xcelium** (RTL Simulation)
- **Cadence Genus** (Logic Synthesis)
- **Cadence Innovus** (PnR, GDSII Export)
- **Cadence Virtuoso** (Layout Verification)
- **Verilog** (HDL design and testbench)

---

## Contents

### Reports
- `RTL-to-GDSII Flow for a 16×24-Bit Multiplier_Report.pdf`: Comprehensive documentation of the simulation, synthesis, PnR process, and layout validation.
- `EECS4612-3.pdf`: Project guidelines and requirements from the course instructor.
- `Asic_Design_Flow.pdf`: Flowchart and design methodology used throughout the project.

### Verilog
- `mult_unsigned.v`: Verilog implementation of a pipelined 16×24-bit unsigned multiplier.
- `mult_unsigned_tb.v`: Testbench used to verify the functional correctness of the multiplier.

### Waveforms
- `Screenshot showing pipelined behavior and output correctness of the multiplier during simulation.

---

## Key Features

- **Pipelined Architecture**: The multiplier features a 1-stage pipeline for inputs and a 3-stage pipeline for outputs, enabling high-performance operation.
- **Positive Slack**: Synthesis reports confirm the design meets timing with over 1 ns of slack.
- **Area and Power Efficient**: Detailed reports included for area breakdown and power consumption.
- **DRC/Connectivity Clean**: Passed all DRC and connectivity checks in Innovus.
- **Post-Layout Verification**: Layout imported and verified in Virtuoso.

---

## How to Run (Simulation)

1. Navigate to the `Verilog/` directory.
2. Compile and run the simulation using your simulator (e.g., ModelSim or Xcelium):
   ```bash
   xrun -f filelist.f
   where filelist.f contains: mult_unsigned.v & mult_unsigned_tb.v
