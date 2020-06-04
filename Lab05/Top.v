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
    //wire [31:0] READMEM;
    
    /**  Program counter */
    PC programCounter(
        .CLK(CLK),
        .Reset(Reset),
        .INPUT(PC_IN),
        .OUTOUT(PC_OUT)
    );
    /** Instruction memory */
    instMemory instMem(
        .readAddress(PC_OUT),
        .Instruction(INST)
    );
    /** Control signal */
    Ctr control(
        .opCode(INST[31:26]),
        .regDst(REG_DST),
        .jump(JUMP),
        .branch(BRANCH),
        .memRead(MEM_READ),
        .memToReg(MEM_TO_REG),
        .aluOp(ALU_OP),
        .memWrite(MEM_WRITE),
        .aluSrc(ALU_SRC),
        .regWrite(REG_WRITE)
    );
    /** Register */
    Reg register(
        .CLK(CLK),
        .Reset(Reset),
        .readReg1(INST[25:21]),
        .readReg2(INST[20:16]),
        .writeReg(MUXRES1),
        .writeData(MUXRES4),
        .regWrite(REG_WRITE),
        .readData1(READDATA1),
        .readData2(READDATA2)
    );
    /** Signext */
    signext signExt(
        .inst(INST[15:0]),
        .data(SIGNEXTENDED)
    );
    /** ALU Control */
    ALUCtr aluCtr(
        .aluCtrOut(ALUCTR),
        .ALUOp(ALU_OP),
        .Funct(INST[5:0])
    );    
    /** ALU */
    ALU alu(
        .in1(READDATA1),
        .in2(READDATA2),
        .aluCtr(ALUCTR),
        .zero(ZERO),
        .aluRes(ALURES)
    );
    /** Data memory */
    dataMemory dataMem(
        .CLK(CLK),
        .address(ALURES),
        .writeData(READDATA2),
        .memWrite(MEM_WRITE),
        .memRead(MEM_READ),
        .readData(READDATA)
    ); 
    /** Adder 1 */
    Adder adder1(
        .in1(PC_OUT),
        .in2(32'b00000000000000000000000000000001),
        .out(ADDRES1)
    );
    /** Adder 2 */
    Adder adder2(
        .in1(ADDRES1),
        .in2(EXTENDSHIFTED),
        .out(ADDRES2)
    );
    /** Left shift 1 */
    leftShift_2 shift1(
        .in(INST),
        .out(INSTSHIFTED)
    );
    /** Left shift 2 */
    leftShift_2 shift2(
        .in(SIGNEXTENDED),
        .out(EXTENDSHIFTED)
    );
    /** Mux 1 */
    Mux_5 mux1(
        .SEL(REG_DST),
        .in1(INST[20:16]),
        .in2(INST[15:11]),
        .out(MUXRES1)
    );
    /** Mux 2 */
    Mux_32 mux2(
        .SEL(ALU_SRC),
        .in1(READDATA2),
        .in2(SIGNEXTENDED),
        .out(MUXRES2)
    );
    /** Mux 3 */
    Mux_32 mux3(
        .SEL(AND_GATE_RES),
        .in1(ADDRES1),
        .in2(ADDRES2),
        .out(MUXRES3)
    );
    /** Mux 4 */
    Mux_32 mux4(
        .SEL(JUMP),
        .in1(MUXRES3),
        .in2({ADDRES1[31:28], 2'b00, INSTSHIFTED[25:0]}),
        .out(PC_IN)
    );
    /** Mux 5 */
    Mux_32 mux5(
        .SEL(MEM_TO_REG),
        .in1(ALURES),
        .in2(READDATA),
        .out(MUXRES4)
    );
    /** And gate */
    andGate gate(
        .in1(BRANCH),
        .in2(ZERO),
        .out(AND_GATE_RES)
    );
    
endmodule
