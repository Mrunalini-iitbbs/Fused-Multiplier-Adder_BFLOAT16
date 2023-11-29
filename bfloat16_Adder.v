`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2023 15:10:34
// Design Name: 
// Module Name: bfloat16_Adder
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


module bfloat16_Adder(
input [15:0] A,B,
output reg [15:0]sum,
output reg ov2
    );
    
    reg [6:0]s1,s2,s;
    reg [7:0]e;
    reg cy,ce,sign;
    
    // s1 and s2
    always@(*)
    begin
        if(A[14:7]>B[14:7])
            begin
            s2=(B[6:0]>>(A[14:7]-B[14:7]));
            s1=A[6:0];
            e=A[14:7];
            end
        else if(A[14:7]<B[14:7])
            begin
            s1=(A[6:0]>>(B[14:7]-A[14:7]));
            s1=B[6:0];
            e=B[14:7];
            end
        else
            begin
            s1=A[6:0];
            s2=B[6:0];
            e=A[14:7];
            end
    end
    
    // Addition of significands block
    always@(*)
    begin
        if(A[15]==B[15])
            begin
            {cy,s}=s1+s2;
            sign=A[15];
            end
            
        else
            begin
            if(s1>s2)
            begin
            s=s1-s2;
            sign=A[15];
            end
            else
            begin
            s=s2-s1;
            sign=B[15];
            end
            end
    end
    
    // Exponent block
    always@(*)
    begin
    if(cy==1)
       {ce,e}=e+1;
    else
        {ce,e}=e;
    end
    
    // Overflow case
    always@(*)
    begin
    if(ce==1)
        ov2=1;
    else
        ov2=0;
    end
    
   // Final answer
   always@(*)
   begin
   if(cy==1)
   sum={sign,e,1'b1,s[6:1]};
   else
   sum={sign,e,s};
   end
    
endmodule
