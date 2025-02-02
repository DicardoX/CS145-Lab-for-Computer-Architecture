`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/3 10:35:55
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input CLK,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    output [31:0] readData
    );
    
    reg [7:0] memFile[0:31];
    reg [31:0] readData;
    
    initial begin
        memFile[0] = 8'h1;
        memFile[1] = 8'h0;
        memFile[2] = 8'h0;
        memFile[3] = 8'h0;
        memFile[4] = 8'h2;
        memFile[5] = 8'h0;
        memFile[6] = 8'h0;
        memFile[7] = 8'h0;
        memFile[8] = 8'h3;
        memFile[9] = 8'h0;
        memFile[10] = 8'h0;
        memFile[11] = 8'h0;
        memFile[12] = 8'h4;
        memFile[13] = 8'h0;
        memFile[14] = 8'h0;
        memFile[15] = 8'h0;
    end
    
    always @ (address or memRead)
    begin
        if (memRead)
            readData = {memFile[address+3], memFile[address+2], memFile[address+1], memFile[address]};
        else
            readData = 0;
    end        
    
    always @ (negedge CLK)
    begin
        if (memWrite)
        begin
            memFile[address] <= writeData[7:0];
            memFile[address+1] <= writeData[15:8];
            memFile[address+2] <= writeData[23:16];
            memFile[address+3] <= writeData[31:24];
        end
    end
        
endmodule
