`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/29 15:52:55
// Design Name: 
// Module Name: clock_control
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


module clock_control(
    input clk_in,
    input clk_enable,
    output clk_out
    );
    
    
    // original clock
   assign clk_out = clk_in & clk_enable;
    
endmodule
