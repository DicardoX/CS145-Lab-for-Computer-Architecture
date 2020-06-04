`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/30 12:00:43
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input CLK,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    output [31:0] readData
    );
    
    reg [31:0] readData;
	reg [31:0] memFile[0:63];
	
	initial begin
        $readmemb("./mem_data.txt", memFile);               // Read file
        readData = 0;
    end
    
	always @ (address)
	begin
	    if(memRead)
	        readData = memFile[address];
	end
	 
	always @ (negedge CLK) // Take the down edge of CLK as write signal
	begin
	    if (memWrite ==1)
	        memFile[address] = writeData;
	end
    
endmodule
