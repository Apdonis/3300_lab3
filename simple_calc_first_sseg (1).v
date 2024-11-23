`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2024 04:41:04 PM
// Design Name: 
// Module Name: simple_calc_first_sseg
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


module simple_calc_first_sseg(
    input [3:0] x,y,
    input [1:0] op_sel,
    input [2:0] sseg_dig,
    output cout,overf,
    output [6:0] sseg,
    output [7:0] an,
    output DP
    );
    wire [7:0] reslt;
    wire [3:0] num;
    wire [11:0] bcd;
    wire [3:0] muxin0;
    wire [3:0] muxin1;
    wire [3:0] muxin2;
    
    simple_calc sc (.x(x),
                    .y(y),
                    .op_sel(op_sel),
                    .rslt(reslt),
                    .cout(cout),
                    .overf(overf)
                    );
    
    bin2bcd b2b (.bin(reslt),
                 .bcd(bcd)
                 );
    
    mux_4x1_nbit muxn (.w0(bcd[3:0]),
                  .w1(bcd[7:4]),
                  .w2(bcd[11:8]),
                  .w3(),
                  .s(sseg_dig),
                  .f(num)
                  );                                                 
    
   
    first_sseg_driver_driver ssegdriver (.active({1'b1,sseg_dig[1:0]}),
                                         .num(num),
                                         .dp_ctrl(1'b1),
                                         .sseg(sseg),
                                         .an(an),
                                         .DP(DP)
                                         );
endmodule
