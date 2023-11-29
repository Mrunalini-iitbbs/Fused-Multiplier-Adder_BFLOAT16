`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2023 20:45:33
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb(

    );
    
    reg [15:0]A,B;
    wire [15:0]sum;
    wire ov2;
    
    bfloat16_Adder DUT(A,B,sum,ov2);
    
    initial
    begin
    $monitor("time=%d\tA=%b\tB=%b\tsum=%b\tov2=%b",$time,A,B,sum,ov2);
    A=16'hC1E0;B=16'h4140; #10;
    $finish;
    end
endmodule
