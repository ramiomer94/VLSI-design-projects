# Two-Input NAND Gate – VLSI Design Project

This project contains the complete design and simulation of a **2-input CMOS NAND gate** using Cadence Virtuoso tools. It was completed as part of the **EECS 4612 – Digital VLSI Design** course.

---

## Directory Structure

- NAND-Project_Rami_Report.pdf         # Final report with layout, simulations, and timing metrics
- Project1_4612.pdf                    # Original assignment specification
- README.md                            # Project documentation (this file)
- TWO-INPUT-NAND-GATE-LAYOUT.png       # Layout view of the NAND gate
- TWO-INPUT-NAND-GATE-Schematic.png    # Schematic view with W/L sizing
- TWO-INPUT-NAND-GATE-Symbol.png       # Symbol representation of the gate
- TWO-INPUT-NAND-GATE-TESTBENCH-SCHEMATIC.png  # Testbench for transient simulations

---

## Project Overview

- **Goal**: Design a two-input NAND gate using standard CMOS logic that meets timing specifications (rise/fall time < 0.5 ns).
- **Tools**: Cadence Virtuoso Schematic Editor, Layout Editor, and ADE Simulation Environment.

---

## Features

- **Schematic Design**: CMOS NAND gate using minimum length devices and custom transistor sizing for balance.
- **Layout Design**: Manually created layout, DRC/LVS clean.
- **Symbol View**: Created to support hierarchical testing.
- **Testbench**: Includes input stimulus and output load (150 fF cap) for realistic delay measurement.
- **Simulation Results**:
  - Rise time ≈ 458 ps
  - Fall time ≈ 454 ps
  - Output waveform matches NAND truth table.

---

## Simulation & Results

- **DRC/LVS**: Passed
- **Transient Analysis**: Performed using testbench schematic with pulse sources.
- **Waveform Observations**:
  - `A = 1`, `B = 1` → `F = 0`
  - All other combinations → `F = 1`

---

## Documentation

- [`NAND-Project_Rami_Report.pdf`](./NAND-Project_Rami_Report.pdf) – Detailed project writeup
- [`Project1_4612.pdf`](./Project1_4612.pdf) – Assignment prompt and timing specs

---

## Author

**Rami Omer**  
Course: EECS 4612 – Digital VLSI Design  

---
