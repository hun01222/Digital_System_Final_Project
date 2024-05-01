`timescale 1ns/1ns

module tb_1
  #(parameter width = 4);

  reg [width-1:0] A, B;
  reg S;

  wire [width-1:0] SUM;
  wire V;

  binary_adder_subtracter_module binary_adder_subtracter(.a(A), .b(B), .s(S), .sum(SUM), .v(V));

  initial begin
    A = 4'b0001; B = 4'b0011; S = 0; // 1 + 3
    #10 A = 4'b0100; B = 4'b0010; S = 1; // 4 - 2
    #10 A = 4'b0010; B = 4'b0100; S = 1; // 2 - 4
    #10 A = 4'b0100; B = 4'b0110; S = 0; // 4 + 6, overflow about addition
    #10 A = 4'b1100; B = 4'b1010; S = 0; // (-4) + (-2), overflow about subtraction
  end

endmodule