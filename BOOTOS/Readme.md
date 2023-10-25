# Custom Bootloader Project

## Requirements
- [QEMU](https://www.qemu.org/) for x86 architecture
- [NASM](https://www.nasm.us/) (Netwide Assembler)
- A VNC viewer (if not already installed)
- "Ralph Brown's Interrupt List" and [OSDev Wiki](https://wiki.osdev.org) for reference

## Description
This project aims to create a custom bootloader written in x86 assembly language. The bootloader will load a kernel, display a boot menu, and allow the user to choose an option to boot into different modes. The code provided in `boot.asm` initializes the bootloader, displays a menu, and provides a basic framework for interaction.

## Memory Location Referencing
Memory location referencing is as follows:
- Segment: CS, DS, SS...
  - SS is on base register being unspecified, while DS uses base registers.
- Base: BP/BX (16 bits), or any General Purpose Register (GPR) of 32/64 bits.

The formula for referencing a memory location is: `segment:{base + index * scale + displacement}`

## Usage
1. Ensure QEMU, NASM, and a VNC viewer are installed.
2. Assemble the `boot.asm` file using NASM: `nasm -f bin boot.asm -o boot.bin`
3. Run the bootloader with QEMU: `qemu-system-x86_64 -hda boot.bin`

## Further Development
- Customize the bootloader with additional functionality.
- Load and execute different kernel images based on user input.
- Refer to "Ralph Brown's Interrupt List" and the OSDev Wiki for reference and more advanced techniques.
- Expand the README as needed to document your project.

## Resources
- [QEMU](https://www.qemu.org/)
- [NASM](https://www.nasm.us/)
- [Ralph Brown's Interrupt List](https://www.ctyme.com/rbrown.htm)
- [OSDev Wiki](https://wiki.osdev.org)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
