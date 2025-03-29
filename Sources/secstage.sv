`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 10:59:07 AM
// Design Name: 
// Module Name: secstage
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


module secstage(
input logic glitched_clk,
input logic rst,
input logic [4:0]  sum,
output logic [4:0] finout
    );
    //logic [4:0] temp;
          //  logic [4:0] outemp;
             // Sequential logic for one-cycle delay
            always_ff @(posedge glitched_clk) begin
                if (!rst) begin
                    finout <= 4'b0000;  // Reset output to 0
                end else begin
                    finout<= sum;  // Update output one cycle later
                end
            end
    
    
endmodule
