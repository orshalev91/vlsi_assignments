module testbench;

reg clk;
reg rst_n;
reg [7:0] angle;
wire [7:0] sinus;

sinusrom dut (.clk(clk), .rst_n(rst_n), .angle(angle), .sinus(sinus));

always begin
    clk = 0;
    #10;
    clk = 1;
    #5;
    angle = $random;
    #5;
end

initial begin
  $dumpvars(0,testbench);
  rst_n = 0;
  #100;
  rst_n = 1;
  #200 $finish;
end
endmodule