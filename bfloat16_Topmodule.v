`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2023 21:05:44
// Design Name: 
// Module Name: bfloat16_Topmodule
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


module bfloat16_Topmodule(
output reg [15:0]result,
output reg ov
    );
    
    reg [15:0]mem[0:2];
    reg [15:0]A,B,C;
    
    initial
    begin
    $readmemh("input.mem",mem);
    end
    
    always@(*)
    begin
    A=mem[0];
    B=mem[1];
    C=mem[2];
    end
    
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
