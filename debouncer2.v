module debouncer2(
	input clk,
	input sw_out,
	output reg sw_outDB2
);

	reg [3:0]lock_reg;
	wire locked;
    wire change;
	
	assign locked = |lock_reg;
	assign change = (sw_out != sw_outDB2);
	
	always@(posedge clk)begin
			if(change && ~locked)begin
				sw_outDB2 <= sw_out;
				lock_reg <= 4'b1111;
				end
			else if(locked)
				lock_reg <= {lock_reg[2:0], 1'b0};
	end
endmodule	
			
		