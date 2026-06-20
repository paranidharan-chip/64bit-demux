**Contributing to 64-bit Demultiplexer Project**  
Thank you for your interest in contributing!  
**How to Contribute**  
**Reporting Bugs**  
Before reporting, check existing issues to avoid duplicates.  
Include in your bug report:  
- Clear description of the bug  
- Steps to reproduce  
- Expected behavior  
- Actual behavior  
- Your environment (OS, simulator version)  
- Error messages or waveforms  
Example:  
Title: DEMUX1X8 produces incorrect output with sel=5  
   
 Steps to reproduce:  
 1. Set data_in=1, sel=6'b000101  
 2. Expected: out[5]=1, all others=0  
 3. Actual: out[2]=1, out[3]=1  
   
 Environment: Icarus Verilog 12.0, Ubuntu 22.04  
   
**Suggesting Enhancements**  
1. Open an issue with "enhancement" label  
2. Describe the motivation  
3. Provide examples  
4. List alternative solutions  
**Code Contributions**  
***Before Starting***  
1. Fork the repository  
2. Clone your fork: git clone [https://github.com/paranidharan-chip/demux-64bit.git](https://github.com/your-username/demux-64bit.git "https://github.com/your-username/demux-64bit.git")  
3. Create a branch: git checkout -b feature/your-feature-name  
***Code Style***  
Verilog Code Style:  
// Use 2-space indentation  
 module demux1X2 (  
   input data_in,  
   input sel,  
   output [1:0] out  
 );  
   
 // Use meaningful signal names  
 reg [63:0] intermediate_signal;  
   
 // Add comments for complex logic  
 always @(*) begin  
   // Initialize outputs  
   out = 64'b0;  
     
   // Route input to selected output  
   if(data_in)  
     out[sel] = 1'b1;  
 end  
   
 endmodule  
   
Naming Conventions:  
- Modules: PascalCase (DEMUX1X64)  
- Signals: snake_case (data_in, select_lines)  
- Constants: UPPER_CASE (OUTPUT_WIDTH = 64)  
***Testing Requirements***  
All contributions must:  
- Pass all existing testbenches  
- Include testbenches for new features  
- Achieve 100% test pass rate  
Run tests:  
iverilog -o demux rtl/demux.v tb/demux_tb.v  
 vvp demux  
   
***Commit Messages***  
Use clear, descriptive messages:  
Good:  
- "Add DEMUX1X128 module with comprehensive testbench"  
- "Fix select bit routing in DEMUX1X32"  
- "Update documentation for timing specifications"  
Avoid:  
- "Fix bug"  
- "Update"  
- "WIP"  
***Submission Process***  
1. Ensure all tests pass  
2. Update documentation  
3. Push to your fork  
4. Open a Pull Request with description  
5. Await review  
***Pull Request Checklist***  
- Code follows style guidelines  
- Testbenches added and passing  
- Documentation updated  
- No breaking changes  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANUlEQVR4nO3OMQ2AUBBAsUfyNTCi9VwgEA3sWGAjJK2CbjNzVGcAAPzFtapV7V9PAAB47X4AEW4ELQDBN+AAAAAASUVORK5CYII=)  
**Development Setup**  
**Prerequisites**  
# Ubuntu/Debian  
 sudo apt-get install iverilog gtkwave git  
   
 # macOS  
 brew install iverilog gtkwave git  
   
**Quick Start**  
# Clone repository  
 git clone [https://github.com/paranidharan](https://github.com/paranidharan "https://github.com/paranidharan")-chip/demux-64bit.git  
 cd demux-64bit  
   
 # Verify setup  
 iverilog -o test demux.v demux_tb.v  
 vvp test  
   
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANklEQVR4nO3OYQ1AABSAwc8mi5wvkwZyCKCAACr4Z7a7BLfMzFYdAQDwF+da3dX+9QQAgNeuB6feBdUJcyS2AAAAAElFTkSuQmCC)  
**Code of Conduct**  
- Be respectful and constructive  
- Include people of all backgrounds  
- Focus on what is best for the community  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANUlEQVR4nO3OMQ2AABAAsSPBCUZfE2IYmVDBhAU2QtIq6DIzW7UHAMBfnGt1V8fXEwAAXrse/xcF7U7sx4wAAAAASUVORK5CYII=)  
**Questions?**  
Open an issue or email mr.paranidharan@gmail.com  
![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAnEAAAACCAYAAAA3pIp+AAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAANElEQVR4nO3OUQmAABBAsSdYxKbXxlpGEAOIFfwTYUuwZWa2ag8AgL841uquzq8nAAC8dj05VAYO3phhoQAAAABJRU5ErkJggg==)  
Thank you for contributing!  
