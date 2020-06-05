`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/3 10:39:55
// Design Name: 
// Module Name: Top_tb
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


module Top_tb(

    );
/** Input */
reg CLK;
reg Reset;
/** Set CLK */
always #15 CLK = ~CLK;
/**  Instantiate the Unit Under Test (UUT) */    
Top uut(
    .CLK(CLK),
    .Reset(Reset)
);

wire [2:0] regFile1;   
assign regFile1 = uut.regs.regFile[1][2:0];
wire [2:0] regFile2;
assign regFile2 = uut.regs.regFile[2][2:0];
wire [2:0] regFile3;
assign regFile3 = uut.regs.regFile[3][2:0];
wire [2:0] regFile4;
assign regFile4 = uut.regs.regFile[4][2:0];
wire [2:0] regFile5;
assign regFile5 = uut.regs.regFile[5][2:0];
wire [2:0] regFile6;
assign regFile6 = uut.regs.regFile[6][2:0];
wire [2:0] regFile7;
assign regFile7 = uut.regs.regFile[7][2:0];
wire [2:0] regFile8;
assign regFile8 = uut.regs.regFile[8][2:0];

initial begin
    $readmemh("mem_data", uut.dataMem.memFile);
    $readmemb("mem_inst", uut.instMem.instrFile);
    
    CLK <= 0;
    Reset <= 1;
    #25
    Reset <= 0;
    #1000;
    
    //for(k=0; k<32; k=k+1)
        //regFile[k] = uut.regs.regFile[k][2:0];

    
end
    
endmodule
