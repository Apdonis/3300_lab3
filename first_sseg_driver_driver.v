`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 03:49:21 PM
// Design Name: 
// Module Name: first_sseg_driver_driver
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


module first_sseg_driver_driver(
    input [2:0] active,
    input [3:0] num,
    input dp_ctrl,
    output [6:0] sseg,
    output [7:0] an,
    output DP
    );
    wire [7:0] anode;
    decoder_generic dg (.w(active),
                        .en(1'b1),
                        .y(anode)
                        );
    assign an = ~anode;
    hex2sseg h2sseg (.hex(num),
                       .sseg(sseg)
                       );
                       
    assign DP = dp_ctrl;
endmodule
