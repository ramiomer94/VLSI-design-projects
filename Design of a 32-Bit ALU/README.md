# Design of a 32-Bit ALU

This project presents the complete VLSI design and verification of a 32-bit Arithmetic Logic Unit (ALU), developed as part of the EECS 4612 Digital VLSI Systems course. The design is structured and implemented using Cadence tools, following a modular RTL-to-GDSII flow. It supports a wide range of arithmetic and logical operations and demonstrates the use of reusable 1-bit ALU cells in a scalable architecture.

---

## Project Overview

The goal of this project was to design a modular and scalable 32-bit ALU using a bit-slice architecture. It was built by hierarchically instantiating 32 instances of a custom 1-bit ALU, each capable of performing arithmetic and logic functions. The complete design underwent:

- RTL-level modeling and simulation  
- Functional verification using testbenches  
- Physical design including layout, placement, and routing  
- Physical verification including DRC and LVS  
- Post-layout simulation using extracted parasitics  

---

## Tools Used

- **Cadence Virtuoso** – Schematic, Symbol, Layout design  
- **Cadence Spectre** – Functional and post-layout simulation  
- **Cadence Genus** – RTL synthesis and timing analysis  
- **Cadence Innovus** – Place and route, GDSII generation  
- **Custom testbenches** – For exhaustive operation testing  

---

## Features Implemented

- **Arithmetic Operations**: Addition, Subtraction, Increment, Decrement  
- **Logic Operations**: AND, OR, XOR, NOT  
- **Shift Operations**: Logical left, logical right  
- **Modular Design**: 1-bit ALU slice reused 32 times  
- **Comparator Output**: Zero flag, carry out, overflow detection  
- **Behavioral vs Structural Comparison**: Verified correctness between RTL and gate-level  

---

## Pad Frame Integration

To enable chip packaging and testing, a **pad frame** was created and connected to the core ALU layout. The pad frame includes:

- Input and output pads for data buses, control signals, and clock  
- Electrostatic discharge (ESD) protection for all I/O pads  
- Core-to-pad routing for all 32 ALU output bits and control lines  
- Power and ground pads properly distributed to support current requirements  

The **core layout was abutted to the pad frame** using Cadence Virtuoso, and connections were verified using layout vs. schematic (LVS) checks. Final GDSII included both the ALU core and pad frame, making it ready for tape-out.

---

## Results Summary

- Functional Verification Passed: Behavioral vs Structural results match  
- Schematic DRC and LVS Passed  
- Layout completed and exported as GDSII  
- Post-layout simulations show correct logic behavior and timing  
- Pad frame successfully integrated with the ALU core layout  

For detailed simulation results and waveforms, refer to `Design of a 32-Bit ALU_Appendix.pdf`.

---

## Author

Developed by **Rami Omer** as part of the EECS 4612 Term Project under guidance from York University’s Electrical Engineering Department.

---

## Reference Documents

- `Design of a 32-Bit ALU_Report.pdf`  
- `Design of a 32-Bit ALU_Appendix.pdf`  
- EECS 4612 course lecture materials and lab guidelines  

---
