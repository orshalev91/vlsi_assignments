`include "ser2par.v"

module testbench;

    reg clk;
    reg rst_n;
    reg din;
    wire [7:0] dout;
    wire vldout;

ser2par dut (.clk(clk), .rst_n(rst_n), .din(din), .dout(dout), .vldout(vldout));

always begin
    clk = 0;
    #10;
    clk = 1;
    #5;
    din = $random;
    #5;
end

initial begin
  $dumpvars(0,testbench);
  rst_n = 0;
  #100;
  rst_n = 1;
  #800 $finish;
end
endmodule