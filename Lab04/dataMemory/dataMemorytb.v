`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/30 12:52:12
// Design Name: 
// Module Name: dataMemory_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dataMemory_tb(

    );
    
    // Inputs
	reg CLK;
	reg [31:0] address;
	reg [31:0] writeData;
	reg memWrite;
	reg memRead;
	
	// Set CLK
	always #100 CLK = ~CLK;

	// Outputs
	wire [31:0] readData;

	// Instantiate the Unit Under Test (UUT)
	dataMemory uut (
		.CLK(CLK), 
		.address(address), 
		.writeData(writeData), 
		.memWrite(memWrite), 
		.memRead(memRead), 
		.readData(readData)
	);
	
	initial begin
        // Initialization
        CLK = 0;
        address = 0;
        writeData = 0;
        memWrite = 0;
        memRead = 0;
        //readData = 0;
    
        #185; 
        memWrite = 1'b1;
        address = 32'b00000000000000000000000000000111;
        writeData = 32'b11100000000000000000000000000000;
    
        #100; 
        memWrite = 1'b1;
        address = 32'b00000000000000000000000000000110;
        writeData = 32'hffffffff;
    
        #185; 
        memRead = 1'b1;
        memWrite = 1'b0;
    
        #80; 
        memWrite = 1'b1;
        address = 8;
        writeData = 32'haaaaaaaa;
    
        #80; 
        memWrite = 1'b0;
        memRead = 1'b1;
    
    end
    
endmodule
