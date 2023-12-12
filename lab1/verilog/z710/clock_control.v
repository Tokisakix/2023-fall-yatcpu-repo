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
    input enable_clk,
    output clk_out
    );
    
    // if clock is divided
    localparam clk_div = 2; // clock is diveded by half of divisor
    reg [3:0] cnt = 4'd0;
    reg out = 1'b0;
    always @(posedge clk_in) begin 
        cnt <= cnt + 4'd1;
        if (cnt >= (clk_div - 1)) begin
            out <= ~out;
            cnt <= 0;
        end
    end
    assign clk_out = out & enable_clk;
    
    
    // original clock
//    assign clk_out = clk_in & enable_clk;
    
endmodule
