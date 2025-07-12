# VLSI-Digital-Design-Projects

This repository showcases a collection of digital VLSI design projects completed as part of the **EECS4612: Digital VLSI** course at York University. The projects span schematic design, layout creation, functional and post-layout simulation, and full ASIC design flows using industry-standard EDA tools such as **Cadence Virtuoso**, **Genus**, and **Innovus**.

---

## Project Structure

Each project folder contains its associated schematic/layout screenshots, simulations, reports, and images.

### Projects Included

#### `NAND-Gate-Design`
- Design and implementation of a two-input NAND gate.
- Includes: schematic, layout (DRC/LVS clean), symbol, testbench schematic, and simulation.
- Tools: Cadence Virtuoso.

#### `Complex-Logic-Gate-F = inverse of (C + A·B)`
- Schematic and layout of a compound CMOS gate.
- Post-layout simulations across 3 views:
  1. Schematic (ideal)
  2. Extracted (no parasitics)
  3. RC Extracted (with parasitics)
- Includes performance metrics like propagation delay, power dissipation, and max frequency.

#### `ASIC-Design-Flow-Project`
These projects demonstrate the complete RTL-to-GDSII design flow using Cadence Genus and Innovus tools. They include synthesis, place and route (PnR), and physical design implementation.

1. **16×24-Bit Multiplier (Project 3)**
   - Tools: Cadence Xcelium (simulation), Genus (synthesis), Innovus (PnR)
   - Features:
     - Multi-stage pipelining
     - Full RTL-to-GDSII flow
     - Timing, power, and area reports
     - Final GDSII layout and import into Virtuoso

2. **32-Bit ALU (Term Project)**
   - Tools: Genus, Innovus, and Virtuoso
   - Features:
     - Bit-slice structured design (1-bit ALU × 32)
     - Two implementations: modular (bit-slice) and behavioral
     - Functional simulation and verification
     - Layout of core and full chip with pad frame
     - DRC, LVS, and post-layout timing analysis
     - Exported final GDS files

---

## Tools & Technologies

- **Cadence Virtuoso** (Schematic, Layout, ADE-L Simulation)
- **Cadence Genus** (RTL Synthesis)
- **Cadence Innovus** (Place & Route)
- **CMOS Design Principles**: Manual transistor-level design using λ-based design rules.

---

## Learning Outcomes

- Design and simulate digital logic gates at the transistor level.
- Perform DRC/LVS checks and interpret post-layout simulation results.
- Understand and apply concepts of parasitic extraction and its impact on circuit performance.
- Experience a complete ASIC design flow from Verilog RTL to layout.

---

## Folder Contents

Each project folder typically contains:

- 📄 `*_Report.pdf`: Project report summarizing design steps and simulation results.
- 🖼 `.png` images: Screenshots of schematic, layout, symbol, and simulation waveforms.
- 📐 `.pdf` design briefs and project descriptions.
- 🧪 Configuration views and ADE-L test setups (if exported).

---

## References

- EECS4612: Digital VLSI Design, Lassonde School of Engineering, York University
- CMOS Digital Integrated Circuits by Kang & Leblebici
- Cadence Design System Documentation

---

## Contact

For any questions, feel free to reach out:

**Rami Omer**  
Email: [rami.ba.omer@gmail.com](mailto:rami.ba.omer@gmail.com)  
GitHub: [@ramiomer94](https://github.com/ramiomer94)

---

> *"Good chips are designed twice: once in your mind, once in the layout."*
