`timescale 1ns / 1ns

module ser2par (
    input clk, 
    input rst_n, 
    input din,
    output [7:0] dout, 
    output vldout);

    reg [7:0] data_out;
    assign dout = data_out;
    reg valid_data;
    assign vldout = valid_data;
    integer count = 0;

    always @(posedge clk) begin
        if (!rst_n) begin
          data_out <= 0;
          valid_data <= 1'b0;
          count = 0;
        end
        else begin
            count +=1;
            if (count == 8) begin
                count = 0;
                data_out <= {data_out[6:0], din};
                valid_data <= 1'b1;
            end
            else if(valid_data == 1) begin // Reseting dout after a valid output
                valid_data <= 0;
                data_out <= {7'b0, din};
            end
            else begin
               data_out <= {data_out[6:0], din};
            end
        end
    end
endmodule