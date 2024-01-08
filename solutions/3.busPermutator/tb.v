module testbench;
reg [3:0] din;
reg [4:0] select;
wire [3:0] dout;


always begin
    #10;
    select = $random;
    #10;
    din = $random;
end

initial begin
    $dumpvars(0,testbench);
    din = 0;
    #800 $finish;
end

busPermutator dut (.din(din), .select(select), .dout(dout));
endmodule
