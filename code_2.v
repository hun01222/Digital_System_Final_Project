module d_latch_module(
  input d, clk,
  output q, q_bar
);

  reg q, q_bar;
  wire r, s;

  always @(*) begin
    assign s <= !(d && clk);
    assign r <= !(s && clk);
    assign q <= !(q_bar && s);
    assign q_bar <= !(q && r);
  end

endmodule

module d_flip_flop_module(
  input d, clk,
  output q, q_bar
);

  wire q_master, q_master_bar;

  d_latch_module master(.d(d), .clk(!clk), .q(q_master), .q_bar(q_master_bar));
  d_latch_module slave(.d(q_master), .clk(clk), .q(q), .q_bar(q_bar));

endmodule

module jk_flip_flop_module(
  input j, k, rst, clk,
  output q, q_bar
);

  wire d;

  assign d = ((j&&q_bar)||(!k&&q));

  d_flip_flop_module d_flip_flop(.d(d), .clk(clk), .q(q), .q_bar(q_bar));

endmodule

module alert_module(
  input a, b, rst, clk,
  output q, q_bar
);

  wire j, k;
  
  assign j = !(rst) && a && b;
  assign k = !(!(rst) && a && b);

  jk_flip_flop_module jk_flip_flop(.j(j), .k(k), .rst(rst), .clk(clk), .q(q), .q_bar(q_bar));

endmodule