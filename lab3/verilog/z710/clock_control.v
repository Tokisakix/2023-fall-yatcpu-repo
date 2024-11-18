`timescale 1ns / 1ps
// fpga4student.com: FPGA projects, VHDL projects, Verilog projects
// Verilog project: Verilog code for clock divider on FPGA
// Top level Verilog code for clock divider on FPGA
module clock_control(
    input clock_in,
    input enable_clk,
    output reg clock_out
);
    reg[3:0] counter = 4'd0;
    parameter DIVISOR = 4'd5;
    // The frequency of the output clk_out
    //  = The frequency of the input clk_in divided by DIVISOR
    // For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
    // You will modify the DIVISOR parameter value to 28'd50.000.000
    // Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
    always @(posedge clock_in)
    begin
        counter <= counter + 4'd1;
        if(counter>=(DIVISOR-1)) begin
            counter <= 4'd0;
        end
        clock_out <= ((counter<DIVISOR/2)?1'b1:1'b0) && enable_clk;
    end
endmodule
