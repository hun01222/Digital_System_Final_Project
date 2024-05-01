module half_adder_module(a, b, sum, carry);
	input a, b;
	output sum, carry;
  reg sum, carry;
	
	always@(*)
	begin
		{carry, sum} = a + b;
	end

endmodule