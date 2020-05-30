`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/30 16:55:44
// Design Name: 
// Module Name: signext_tb
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


module signext_tb(

    );
    
    // Inputs
	reg [15:0] inst;

	// Outputs
	wire [31:0] data;

	// Instantiate the Unit Under Test (UUT)
	signext uut (
		.inst(inst), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		inst = 0;
		
		#100 inst = 32767;
		
		#100 inst = 386;
		
		#100 inst = -32768;
		
		#100 inst = -1023;

	end
    
endmodule
