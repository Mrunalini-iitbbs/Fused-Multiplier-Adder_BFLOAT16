`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2023 22:25:44
// Design Name: 
// Module Name: bfloat16_Final_Module
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


module bfloat16_Final_Module(
    input clk_100MHz,
    input reset,
    input dm_write,
    output [0:6]seg,
    output [3:0]digit,
    output ov    
    
);

wire [15:0]result;



bfloat16_Topmodule Top(result,ov);
seg_7_display display(clk_100MHz,reset,dm_write,result,seg,digit);
endmodule
