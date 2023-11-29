`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2023 20:10:57
// Design Name: 
// Module Name: bfloat16_Multiplier
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


module bfloat16_Multiplier(
input [15:0] A,B,
output reg [15:0]prod,
output reg ov1
    );
    
    wire [6:0]s1,s2;
    wire [7:0]e1,e2;
    wire [13:0]s;
    wire sign;
    wire [7:0]e;
    
    
    assign s1=A[6:0];
    assign s2=B[6:0];
    
    assign e1=A[14:7];
    assign e2=B[14:7];
    
    assign e=e1+e2-127;
    assign s=s1*s2;
    assign sign=A[15]^B[15];
    
    always@(*)
    begin
    if(e1+e2>382 || e1+e2<127)
        ov1=1'b1;
    else
        ov1=1'b0;
    end
    
    always@(*)
    begin
        if(ov1==1) 
            prod=16'b0;
        else
            prod={sign,e,s[13:7]};
    end
    
    
endmodule
