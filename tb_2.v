`timescale 1ns/1ns

module tb_2;

  reg A, B, RST, CLK;

  reg Q, Q_BAR;

  alert_module alert(.a(A), .b(B), .rst(RST), .clk(CLK), .q(Q), .q_bar(Q_BAR));

  initial begin
    CLK = 1'b0;
  end

  initial begin
    forever begin
      #5 CLK = !CLK;
    end
  end

  initial begin
    RST = 1'b0, A = 1'b0, B = 1'b0;
    #10 RST = 1'b0, A = 1'b0, B = 1'b1;
    #10 RST = 1'b0, A = 1'b1, B = 1'b0;
    #10 RST = 1'b0, A = 1'b1, B = 1'b1;
    #10 RST = 1'b1, A = 1'b0, B = 1'b0;
    #10 RST = 1'b1, A = 1'b0, B = 1'b1;
    #10 RST = 1'b1, A = 1'b1, B = 1'b0;
    #10 RST = 1'b1, A = 1'b1, B = 1'b1;
  end

endmodule