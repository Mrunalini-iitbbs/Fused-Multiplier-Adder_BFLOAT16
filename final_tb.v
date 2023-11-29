`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2023 16:23:30
// Design Name: 
// Module Name: final_tb
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


module final_tb;
    reg [15:0]A,B,C;
    wire [15:0]result;
    wire ov;
    
    bfloat_16_Top_testing D1(A,B,C,result,ov);
    
    initial
    begin
    $monitor("time=%d\tA=%h\tB=%h\tC=%h\tresult=%h\tov=%b",$time,A,B,C,result,ov);
    A=16'h4160;B=16'h41C0;C=16'h41E0; #10;
    $finish;
    end

endmodule
