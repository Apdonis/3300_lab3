`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 04:56:01 PM
// Design Name: 
// Module Name: first_sseg_driver_test
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


module first_sseg_driver_test(
    input [2:0] active_digit,
    output [6:0] sseg,
    output [7:0] ad,
    output dp
    );
    wire [3:0] num;
    assign num = {1'b0,active_digit[2:0]};
    first_sseg_driver_driver fsd (.active(active_digit),
                                  .num(num),
                                  .dp_ctrl(1'b1),
                                  .sseg(sseg),
                                  .an(ad),
                                  .DP(dp)
                                  );
endmodule
