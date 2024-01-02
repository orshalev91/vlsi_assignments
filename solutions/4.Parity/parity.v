`timescale 1ns / 1ns

module parity(
    input clk,
    input rst_n,
    input [31:0] din,
    output reg [31:0] dout,
    output [3:0] parity
);
//Assumption taken, even parity


wire [7:0] Q0 = din[7:0];
wire [7:0] Q1 = din[15:8];
wire [7:0] Q2 = din[23:16];
wire [7:0] Q3 = din[31:24];
reg[2:0] onesQ0;
reg[2:0] onesQ1;
reg[2:0] onesQ2;
reg[2:0] onesQ3;

assign parity[0] = onesQ0[0];
assign parity[1] = onesQ1[0];
assign parity[2] = onesQ2[0];
assign parity[3] = onesQ3[0];


always @(posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    dout <= 0;
    onesQ0 = 3'b0;
    onesQ1 = 3'b0;
    onesQ2 = 3'b0;
    onesQ3 = 3'b0;
  end
  else begin
    dout <= din;
    onesQ0 <= Q0[7] + Q0[6] + Q0[5] + Q0[4] + Q0[3] + Q0[2] + Q0[1] + Q0[0];
    onesQ1 <= Q1[7] + Q1[6] + Q1[5] + Q1[4] + Q1[3] + Q1[2] + Q1[1] + Q1[0];
    onesQ2 <= Q2[7] + Q2[6] + Q2[5] + Q2[4] + Q2[3] + Q2[2] + Q2[1] + Q2[0];
    onesQ3 <= Q3[7] + Q3[6] + Q3[5] + Q3[4] + Q3[3] + Q3[2] + Q3[1] + Q3[0];

  end
end

endmodule
