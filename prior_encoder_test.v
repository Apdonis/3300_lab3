`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 02:34:23 PM
// Design Name: 
// Module Name: prior_encoder_test
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


module prior_encoder_test(
    input [15:0] data,
    output [6:0] sevseg,
    output [7:0] an,
    output dp
    );
    wire [7:0] prior;
    priority_encoder_generic peg (.w(data),
                                    .z(),
                                    .y(prior));
    hex2sseg h2sev (.hex(prior),
                    .sseg(sevseg));    
                    
    assign an[7:0] = 8'b11111110;           
    assign dp = 1'b1;
endmodule
