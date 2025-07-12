# Complex Logic Gate - F = inverse of (C + A·B)

This project implements the CMOS layout, schematic, symbol, testbench, and post-layout simulation of a complex logic gate that realizes the logic function:  
**F = inverse of (C + A·B)**

Designed and verified using Cadence Virtuoso and ADE L for EECS4612 - Digital VLSI, Winter 2025.

---

## Project Overview

- **Logic Function**:  
  CMOS implementation of the logic gate:  
  `F = C + (A · B)` (inverted output)

- **Technology**:  
  Cadence Virtuoso, AMS 0.18µm CMOS process  
  Transistor sizing: L = Lmin, Wp = 200nm, Wn = 150nm

- **Simulation Cases**:
  1. **Schematic (ideal)** – no parasitics  
  2. **Extracted (without RC)** – includes layout geometry only  
  3. **RC Extracted** – includes parasitic resistance and capacitance

---

## File Descriptions

| File Name                                         | Description |
|--------------------------------------------------|-------------|
| `Complex-Logic-Gate-Layout.png`                  | Physical layout of the CMOS gate. DRC and LVS clean. |
| `Complex-Logic-Gate-Schematic.png`               | Gate-level schematic with transistors. |
| `Complex-Logic-Gate-Symbol.png`                  | Symbol representation for schematic hierarchy. |
| `Complex-Logic-Gate-Testbench-Schematic.png`     | Testbench used for post-layout simulations. Includes all 3 configurations. |
| `ComplextLogicGate-PostLayoutSimulation_Report.pdf` | Final report summarizing schematic, layout, DRC/LVS, and simulation results. |
| `EECS4612_Project2.pdf`                          | Official project guideline provided by the course. |

---

## Key Results

- Verified functionality across 3 configurations using transient simulation.
- Performance metrics obtained:
  - Rise/Fall Times
  - Propagation Delay
  - Power Dissipation
  - Peak Current
  - Maximum Operating Frequency
- Parasitic effects analyzed and documented in the report.

---

## Verification Status

- Schematic: Verified  
- Layout: DRC & LVS clean  
- Symbol: Hierarchical instantiation tested  
- Simulation: Transient analysis complete for all views

---

## Author

**Rami Omer**  
EECS4612 - Winter 2025  
Lassonde School of Engineering, York University
