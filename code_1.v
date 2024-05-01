module half_adder_module (a, b, sum, carry);
	input a, b;
	output sum, carry;
	wire sum, carry;
	
	always@(a or b)
	begin
		{carry, sum} = a + b;
	end

endmodule

module full_adder_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	wire sum, cout, sum1, cout1, cout2;
	
	always@(a or b or cin)
	begin
		half_adder_module HA1(a, b, sum1, cout1);
		half_adder_module HA2(sum1, cin, sum, cout2);
    assign cout = cout1 + cout2;
	end

endmodule

module binary_adder_subtracter_module
  #(parameter width = 4)
(
  input [width-1:0] a, [width-1:0] b, s,
  output [width-1:0] sum, v
);

  wire [width-1:0] cout;

  always@(*)
  begin
    full_adder_module FA1(a[0], b[0] ^ s, s, sum[0], cout[0]);
    full_adder_module FA2(a[1], b[1] ^ s, cout[0], sum[1], cout[1]);
    full_adder_module FA3(a[2], b[2] ^ s, cout[1], sum[2], cout[2]);
    full_adder_module FA4(a[3], b[3] ^ s, cout[2], sum[3], cout[3]);
    assign v = cout[3] ^ cout[2];
  end

endmodule