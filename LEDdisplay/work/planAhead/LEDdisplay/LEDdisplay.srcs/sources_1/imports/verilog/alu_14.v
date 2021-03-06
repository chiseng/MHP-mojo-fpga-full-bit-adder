/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_14 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [16-1:0] M_add_out;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [6-1:0] M_add_alufn;
  adder_24 add (
    .a(a),
    .b(b),
    .alufn(M_add_alufn),
    .out(M_add_out),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  wire [16-1:0] M_boole_out;
  reg [6-1:0] M_boole_alufn;
  boolean_25 boole (
    .a(a),
    .b(b),
    .alufn(M_boole_alufn),
    .out(M_boole_out)
  );
  wire [16-1:0] M_comp_cmp;
  reg [6-1:0] M_comp_alufn;
  compare16_26 comp (
    .a(a),
    .b(b),
    .alufn(M_comp_alufn),
    .cmp(M_comp_cmp)
  );
  wire [16-1:0] M_shift_c;
  reg [6-1:0] M_shift_alufn;
  shifter_27 shift (
    .a(a),
    .b(b),
    .alufn(M_shift_alufn),
    .c(M_shift_c)
  );
  wire [16-1:0] M_mult_out;
  reg [6-1:0] M_mult_alufn;
  multiply_28 mult (
    .a(a),
    .b(b),
    .alufn(M_mult_alufn),
    .out(M_mult_out)
  );
  
  always @* begin
    out = 1'h0;
    M_add_alufn = alufn[0+5-:6];
    M_mult_alufn = alufn[0+5-:6];
    M_boole_alufn = alufn[0+5-:6];
    M_comp_alufn = alufn[0+5-:6];
    M_shift_alufn = alufn[0+5-:6];
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    
    case (alufn[4+1-:2])
      2'h0: begin
        if ((alufn[0+0-:1] == 1'h0 || alufn[0+0-:1] == 1'h1) && alufn[1+0-:1] == 1'h0) begin
          out = M_add_out;
          z = M_add_z;
          v = M_add_v;
          n = M_add_n;
        end else begin
          if (alufn[1+0-:1] == 1'h1 && (alufn[0+0-:1] == 1'h0 || alufn[0+0-:1] == 1'h1)) begin
            out = M_mult_out;
          end
        end
      end
      2'h1: begin
        out = M_boole_out;
      end
      2'h2: begin
        out = M_shift_c;
      end
      2'h3: begin
        out = M_comp_cmp;
      end
    endcase
  end
endmodule
