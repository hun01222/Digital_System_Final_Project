module binary_adder_subtracter_module
#(parameter width = 4)
(
  input [width-1:0] a, [width-1:0] b, s,
  output [width-1:0] sum, v
);

  wire [width-1:0] cout;

  always@(*)
  begin
    full_adder_module FA1(.a(a[0]), .b(b[0] ^ s), .cin(s), .sum(sum[0]), .cout(cout[0]));
    full_adder_module FA2(.a(a[1]), .b(b[1] ^ s), .cin(cout[0]), .sum(sum[1]), .cout(cout[1]));
    full_adder_module FA3(.a(a[2]), .b(b[2] ^ s), .cin(cout[1]), .sum(sum[2]), .cout(cout[2]));
    full_adder_module FA4(.a(a[3]), .b(b[3] ^ s), .cin(cout[2]), .sum(sum[3]), .cout(cout[3]));
    assign v = cout[3] ^ cout[2];
  end

endmodule