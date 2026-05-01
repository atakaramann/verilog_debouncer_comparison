module top_module (
    input  wire clk,
    input  wire sw_out,
    output wire sw_outDB1,
    output wire sw_outDB2
);

    debouncer1 db1(
        .clk(clk),
        .sw_out(sw_out),
        .db1_out(sw_outDB1)
    );

    debouncer2 db2(
        .clk(clk),
        .sw_out(sw_out),
        .sw_outDB2(sw_outDB2)
    );

endmodule