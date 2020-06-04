`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 16:11:36
// Design Name: 
// Module Name: instMemory
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


module instMemory(
    input [31:0] readAddress,
    output [31:0] Instruction
    );
    reg [31:0] memFile[0:255];
    initial begin
        $readmemb("./mem_inst.txt", memFile);               // Read file
    end
    assign Instruction = memFile[readAddress];
endmodule
