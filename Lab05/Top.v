`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/04 09:57:41
// Design Name: 
// Module Name: Top
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


module Top(
    input CLK,
    input Reset
    );
    /** Control signal */
    wire REG_DST,
        JUMP,
        BRANCH,
        MEM_READ,
        MEM_TO_REG,
        MEM_WRITE;
    wire [1:0] ALU_OP;
    wire ALU_SRC,
         REG_WRITE;
    /**  ALU Control */
    wire [3:0] ALUCTR;      
    /**  PC Control */
    wire [31:0] PC_IN;
    wire [31:0] PC_OUT;
    /** Instruction */
    wire [31:0] INST;
    /** Register selection for register write */
    wire [4:0] WRITEREG;
    /**  Instruction shift (from 26 bitsto 32 bits) */
    wire [31:0] INSTSHIFTED;
    /**  Jump destination: PC + 4 + signExt(instruction[25...0] << 2)*/
    wire [31:0] EXTENDSHIFTED;
    /** Sign extend */
    wire [31:0] SIGNEXTENDED;
    /** PC + 4 */
    wire [31:0] ADDRES1;
    /** Branch destination: PC + 4 + signExt(instruction[15...0] << 2) */
    wire [31:0] ADDRES2;
    /** And gate */
    wire AND_GATE_RES;
    /** Mux result */
    wire [4:0] MUXRES1;
    wire [31:0] MUXRES2;
    wire [31:0] MUXRES3;
    wire [31:0] MUXRES4;
    /** Read data from registers */
    wire [31:0] READDATA1;
    wire [31:0] READDATA2;
    /** Read data from memory */
    wire [31:0] READDATA;
    /** Zero */
    wire ZERO;
    /** ALU result */
    wire [31:0] ALURES;
    
    wire [31:0] READMEM;
    
    
    
endmodule
