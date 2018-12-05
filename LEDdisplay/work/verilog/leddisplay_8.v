/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module leddisplay_8 (
    input clk,
    input rst,
    input [223:0] cols,
    input [31:0] rows,
    output reg [255:0] out
  );
  
  
  
  localparam FLIP = 5'h10;
  
  wire [3-1:0] M_counter_r_value;
  counter_15 counter_r (
    .clk(clk),
    .rst(rst),
    .value(M_counter_r_value)
  );
  
  integer i;
  
  integer j;
  
  always @* begin
    out[32+15-:16] = {cols[0+13+0-:1], cols[14+13+0-:1], cols[28+13+0-:1], cols[42+13+0-:1], cols[56+13+0-:1], cols[70+13+0-:1], cols[84+13+0-:1], cols[98+13+0-:1], cols[112+13+0-:1], cols[126+13+0-:1], cols[140+13+0-:1], cols[154+13+0-:1], cols[168+13+0-:1], cols[182+13+0-:1], cols[196+13+0-:1], cols[210+13+0-:1]};
    out[48+15-:16] = {cols[0+12+0-:1], cols[14+12+0-:1], cols[28+12+0-:1], cols[42+12+0-:1], cols[56+12+0-:1], cols[70+12+0-:1], cols[84+12+0-:1], cols[98+12+0-:1], cols[112+12+0-:1], cols[126+12+0-:1], cols[140+12+0-:1], cols[154+12+0-:1], cols[168+12+0-:1], cols[182+12+0-:1], cols[196+12+0-:1], cols[210+12+0-:1]};
    out[64+15-:16] = {cols[0+11+0-:1], cols[14+11+0-:1], cols[28+11+0-:1], cols[42+11+0-:1], cols[56+11+0-:1], cols[70+11+0-:1], cols[84+11+0-:1], cols[98+11+0-:1], cols[112+11+0-:1], cols[126+11+0-:1], cols[140+11+0-:1], cols[154+11+0-:1], cols[168+11+0-:1], cols[182+11+0-:1], cols[196+11+0-:1], cols[210+11+0-:1]};
    out[80+15-:16] = {cols[0+10+0-:1], cols[14+10+0-:1], cols[28+10+0-:1], cols[42+10+0-:1], cols[56+10+0-:1], cols[70+10+0-:1], cols[84+10+0-:1], cols[98+10+0-:1], cols[112+10+0-:1], cols[126+10+0-:1], cols[140+10+0-:1], cols[154+10+0-:1], cols[168+10+0-:1], cols[182+10+0-:1], cols[196+10+0-:1], cols[210+10+0-:1]};
    out[96+15-:16] = {cols[0+9+0-:1], cols[14+9+0-:1], cols[28+9+0-:1], cols[42+9+0-:1], cols[56+9+0-:1], cols[70+9+0-:1], cols[84+9+0-:1], cols[98+9+0-:1], cols[112+9+0-:1], cols[126+9+0-:1], cols[140+9+0-:1], cols[154+9+0-:1], cols[168+9+0-:1], cols[182+9+0-:1], cols[196+9+0-:1], cols[210+9+0-:1]};
    out[112+15-:16] = {cols[0+8+0-:1], cols[14+8+0-:1], cols[28+8+0-:1], cols[42+8+0-:1], cols[56+8+0-:1], cols[70+8+0-:1], cols[84+8+0-:1], cols[98+8+0-:1], cols[112+8+0-:1], cols[126+8+0-:1], cols[140+8+0-:1], cols[154+8+0-:1], cols[168+8+0-:1], cols[182+8+0-:1], cols[196+8+0-:1], cols[210+8+0-:1]};
    out[128+15-:16] = {cols[0+7+0-:1], cols[14+7+0-:1], cols[28+7+0-:1], cols[42+7+0-:1], cols[56+7+0-:1], cols[70+7+0-:1], cols[84+7+0-:1], cols[98+7+0-:1], cols[112+7+0-:1], cols[126+7+0-:1], cols[140+7+0-:1], cols[154+7+0-:1], cols[168+7+0-:1], cols[182+7+0-:1], cols[196+7+0-:1], cols[210+7+0-:1]};
    out[144+15-:16] = {cols[0+6+0-:1], cols[14+6+0-:1], cols[28+6+0-:1], cols[42+6+0-:1], cols[56+6+0-:1], cols[70+6+0-:1], cols[84+6+0-:1], cols[98+6+0-:1], cols[112+6+0-:1], cols[126+6+0-:1], cols[140+6+0-:1], cols[154+6+0-:1], cols[168+6+0-:1], cols[182+6+0-:1], cols[196+6+0-:1], cols[210+6+0-:1]};
    out[160+15-:16] = {cols[0+5+0-:1], cols[14+5+0-:1], cols[28+5+0-:1], cols[42+5+0-:1], cols[56+5+0-:1], cols[70+5+0-:1], cols[84+5+0-:1], cols[98+5+0-:1], cols[112+5+0-:1], cols[126+5+0-:1], cols[140+5+0-:1], cols[154+5+0-:1], cols[168+5+0-:1], cols[182+5+0-:1], cols[196+5+0-:1], cols[210+5+0-:1]};
    out[176+15-:16] = {cols[0+4+0-:1], cols[14+4+0-:1], cols[28+4+0-:1], cols[42+4+0-:1], cols[56+4+0-:1], cols[70+4+0-:1], cols[84+4+0-:1], cols[98+4+0-:1], cols[112+4+0-:1], cols[126+4+0-:1], cols[140+4+0-:1], cols[154+4+0-:1], cols[168+4+0-:1], cols[182+4+0-:1], cols[196+4+0-:1], cols[210+4+0-:1]};
    out[192+15-:16] = {cols[0+3+0-:1], cols[14+3+0-:1], cols[28+3+0-:1], cols[42+3+0-:1], cols[56+3+0-:1], cols[70+3+0-:1], cols[84+3+0-:1], cols[98+3+0-:1], cols[112+3+0-:1], cols[126+3+0-:1], cols[140+3+0-:1], cols[154+3+0-:1], cols[168+3+0-:1], cols[182+3+0-:1], cols[196+3+0-:1], cols[210+3+0-:1]};
    out[208+15-:16] = {cols[0+2+0-:1], cols[14+2+0-:1], cols[28+2+0-:1], cols[42+2+0-:1], cols[56+2+0-:1], cols[70+2+0-:1], cols[84+2+0-:1], cols[98+2+0-:1], cols[112+2+0-:1], cols[126+2+0-:1], cols[140+2+0-:1], cols[154+2+0-:1], cols[168+2+0-:1], cols[182+2+0-:1], cols[196+2+0-:1], cols[210+2+0-:1]};
    out[224+15-:16] = {cols[0+1+0-:1], cols[14+1+0-:1], cols[28+1+0-:1], cols[42+1+0-:1], cols[56+1+0-:1], cols[70+1+0-:1], cols[84+1+0-:1], cols[98+1+0-:1], cols[112+1+0-:1], cols[126+1+0-:1], cols[140+1+0-:1], cols[154+1+0-:1], cols[168+1+0-:1], cols[182+1+0-:1], cols[196+1+0-:1], cols[210+1+0-:1]};
    out[240+15-:16] = {cols[0+0+0-:1], cols[14+0+0-:1], cols[28+0+0-:1], cols[42+0+0-:1], cols[56+0+0-:1], cols[70+0+0-:1], cols[84+0+0-:1], cols[98+0+0-:1], cols[112+0+0-:1], cols[126+0+0-:1], cols[140+0+0-:1], cols[154+0+0-:1], cols[168+0+0-:1], cols[182+0+0-:1], cols[196+0+0-:1], cols[210+0+0-:1]};
    out[0+15-:16] = rows[0+15-:16];
    out[16+15-:16] = rows[16+15-:16];
  end
endmodule
