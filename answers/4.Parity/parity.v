`timescale 1ns / 1ns

module parity(
    input clk,
    input rst_n,
    input [31:0] din,
    output [31:0] dout,
    output [3:0] parity
);
//Assumption taken, even parity

reg [31:0] dout_reg;
assign dout = dout_reg;
reg [3:0] parity_reg;
assign parity = parity_reg;

wire [7:0] Q0 = din[7:0];
wire [7:0] Q1 = din[15:8];
wire [7:0] Q2 = din[23:16];
wire [7:0] Q3 = din[31:24];
integer onesQ0;
integer onesQ1;
integer onesQ2;
integer onesQ3;
integer i;


always @(posedge clk) begin
  if (!rst_n) begin
    dout_reg <= 0;
    parity_reg <= 0;
  end
  else begin
    dout_reg <= din;
    onesQ0 = 0;
    onesQ1 = 0;
    onesQ2 = 0;
    onesQ3 = 0;
    for (i=0; i<8; i++) begin
        onesQ0 = onesQ0 + Q0[i];
        onesQ1 = onesQ1 + Q1[i];
        onesQ2 = onesQ2 + Q2[i];
        onesQ3 = onesQ3 + Q3[i];
    end
    parity_reg[0] = onesQ0%2;
    parity_reg[1] = onesQ1%2;
    parity_reg[2] = onesQ2%2;
    parity_reg[3] = onesQ3%2;
  end
end

endmodule