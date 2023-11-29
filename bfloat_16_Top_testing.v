`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2023 16:26:03
// Design Name: 
// Module Name: bfloat_16_Top_testing
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


module bfloat_16_Top_testing(
input [15:0]A,B,C,
output reg [15:0]result,
output reg ov
    );
    wire [15:0]prod,sum;
    wire ov1,ov2;
    
    bfloat16_Multiplier MUL(A,B,prod,ov1);
    bfloat16_Adder ADD(prod,C,sum,ov2);
    
    always@(*)
    begin
    result=sum;
    ov=ov1||ov2;
    end
endmodule
