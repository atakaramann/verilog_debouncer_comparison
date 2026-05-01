module debouncer1 (
    input  wire clk,
    input  wire sw_out,
    output reg  db1_out
);

    reg [3:0] shift_reg;
    reg [3:0] next_shift;

    always @(posedge clk) begin
        next_shift = {shift_reg[2:0], sw_out};
        shift_reg  <= next_shift;

        if (next_shift == 4'b1111)
            db1_out <= 1'b1;
        else if (next_shift == 4'b0000)
            db1_out <= 1'b0;
        else
            db1_out <= db1_out;
    end

endmodule	