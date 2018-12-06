/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module generator_bottom_2 (
    input clk,
    input rst,
    input [0:0] button_l,
    input [0:0] button_r,
    input [31:0] rows,
    output reg [31:0] rowsout
  );
  
  
  
  wire [16-1:0] M_alu_out;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_12 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .out(M_alu_out),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  localparam XOR = 6'h16;
  
  localparam SHL = 6'h20;
  
  localparam SHR = 6'h21;
  
  wire [1-1:0] M_button_left_out;
  reg [1-1:0] M_button_left_in;
  button_conditioner_13 button_left (
    .clk(clk),
    .in(M_button_left_in),
    .out(M_button_left_out)
  );
  wire [1-1:0] M_button_right_out;
  reg [1-1:0] M_button_right_in;
  button_conditioner_13 button_right (
    .clk(clk),
    .in(M_button_right_in),
    .out(M_button_right_out)
  );
  reg [15:0] M_shiftstore_d, M_shiftstore_q = 1'h0;
  wire [1-1:0] M_left_edge_out;
  reg [1-1:0] M_left_edge_in;
  edge_detector_15 left_edge (
    .clk(clk),
    .in(M_left_edge_in),
    .out(M_left_edge_out)
  );
  wire [1-1:0] M_right_edge_out;
  reg [1-1:0] M_right_edge_in;
  edge_detector_15 right_edge (
    .clk(clk),
    .in(M_right_edge_in),
    .out(M_right_edge_out)
  );
  wire [32-1:0] M_regs_out;
  reg [1-1:0] M_regs_en;
  reg [32-1:0] M_regs_data;
  registerSetup_17 regs (
    .clk(clk),
    .rst(rst),
    .en(M_regs_en),
    .data(M_regs_data),
    .out(M_regs_out)
  );
  
  localparam IDLE_new_fsm = 2'd0;
  localparam LEFT_new_fsm = 2'd1;
  localparam RIGHT_new_fsm = 2'd2;
  localparam SAVED_STATE_new_fsm = 2'd3;
  
  reg [1:0] M_new_fsm_d, M_new_fsm_q = IDLE_new_fsm;
  
  reg left;
  
  reg right;
  
  always @* begin
    M_new_fsm_d = M_new_fsm_q;
    
    M_button_left_in = button_l;
    M_button_right_in = button_r;
    M_left_edge_in = M_button_left_out;
    M_right_edge_in = M_button_right_out;
    left = M_left_edge_out;
    right = M_right_edge_out;
    rowsout[0+15-:16] = 16'h0000;
    rowsout[16+15-:16] = 16'h0000;
    M_alu_a = 1'h0;
    M_alu_b = 1'h0;
    M_alu_alufn = 1'h0;
    rowsout = {M_shiftstore_q, M_shiftstore_q};
    M_regs_en = 1'h0;
    M_regs_data = rows;
    
    case (M_new_fsm_q)
      IDLE_new_fsm: begin
        rowsout = rows;
        M_regs_en = 1'h1;
        M_regs_data = rows;
        M_new_fsm_d = SAVED_STATE_new_fsm;
      end
      LEFT_new_fsm: begin
        if (M_regs_out[0+15+0-:1] != 1'h1) begin
          M_alu_a = M_regs_out[0+15-:16];
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h20;
          M_regs_en = 1'h1;
          M_regs_data = {M_alu_out, M_alu_out};
        end
        rowsout = M_regs_out;
        M_new_fsm_d = SAVED_STATE_new_fsm;
      end
      RIGHT_new_fsm: begin
        if (M_regs_out[0+0+0-:1] != 1'h1) begin
          M_regs_en = 1'h1;
          M_alu_a = M_regs_out[0+15-:16];
          M_alu_b = 1'h1;
          M_alu_alufn = 6'h21;
          M_regs_data = {M_alu_out, M_alu_out};
        end
        rowsout = M_regs_out;
        M_new_fsm_d = SAVED_STATE_new_fsm;
      end
      SAVED_STATE_new_fsm: begin
        M_alu_a = left;
        M_alu_b = right;
        M_alu_alufn = 6'h16;
        M_regs_en = 1'h0;
        if (left != 1'h1 && M_alu_out != 1'h1) begin
          rowsout = M_regs_out;
          M_new_fsm_d = SAVED_STATE_new_fsm;
        end else begin
          if (left == 1'h1 && M_alu_out == 1'h1) begin
            M_new_fsm_d = LEFT_new_fsm;
          end
        end
        if (right != 1'h1 && M_alu_out != 1'h1) begin
          M_regs_en = 1'h0;
          rowsout = M_regs_out;
          M_new_fsm_d = SAVED_STATE_new_fsm;
        end
        if (right == 1'h1 && M_alu_out == 1'h1) begin
          M_new_fsm_d = RIGHT_new_fsm;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    M_shiftstore_q <= M_shiftstore_d;
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_new_fsm_q <= 1'h0;
    end else begin
      M_new_fsm_q <= M_new_fsm_d;
    end
  end
  
endmodule
