`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 16:04:13
// Design Name: 
// Module Name: PC
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


module PC(CLK, Reset, INPUT, OUTPUT);
    input CLK;
    input [31:0] INPUT;
    output reg [31:0] OUTPUT;
    input Reset;
    /** Initialize output */
    initial begin
        OUTPUT = 0;
    end
    
    always @ (posedge CLK)
    begin
        if(!Reset) 
            OUTPUT = 32'b00000000000000000000000000000000;          // Reset
        else
            OUTPUT = INPUT;
    end
    
    
endmodule
