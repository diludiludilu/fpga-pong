# FPGA constraints

Place the board-specific Vivado .xdc file in this folder.

Before creating or using the XDC:
1. Read the exact FPGA board variant printed on the physical Nexys A7.
2. Select the matching FPGA part.
3. Start from the official Digilent master XDC for that exact board variant.
4. Uncomment only the pins used by this project.
5. Verify pin names, I/O standards, and the 100 MHz clock constraint.
6. Have another member review the pin mapping before programming the board.

Do not guess pin locations or reuse an XDC file for a different board variant.
