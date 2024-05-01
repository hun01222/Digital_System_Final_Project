module full_adder_module (a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
  reg sum, cout;
	wire sum1, cout1, cout2;
	
	always@(*)
	begin
		half_adder_module HA1(.a(a), .b(b), .sum(sum1), .carry(cout1));
		half_adder_module HA2(.a(sum1), .b(cin), .sum(sum), .carry(cout2));
    assign cout = cout1 + cout2;
	end

endmodule