`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 20:48:39
// Design Name: 
// Module Name: Mux_5
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


module Mux_5(
    input SEL,
    input [4:0] in1,
    input [4:0] in2,
    output [4:0] out
    );
    assign out = (SEL)? in2 : in1;
endmodule
