module double_frame_buffer (
	input logic CLK,
	input logic pixel_clk,
	input logic RESET,
	input logic wren,
	input logic switch_buffer,
	input logic FrameComplete,
	input logic [7:0] frame_buffer_data,
	input logic [15:0] read_addr, write_addr,
	output logic [11:0] palette_color
);
	
	logic [7:0] frame_buffer_0_data, frame_buffer_1_data, palette_address;
	
	logic frame_selector = 0; // Frame buffer selector: the buffer vga reads from
//	logic [11:0] palette_color;  


	// Frame buffer instantiation
	ocm_frame_buffer frame_buffer_0 (
		.clock(CLK),
		.data(frame_buffer_data),
		.rdaddress(read_addr),
		.wraddress(write_addr),
		.wren(wren && frame_selector == 1),
		.q(frame_buffer_0_data)
	);

	ocm_frame_buffer frame_buffer_1 (
		.clock(CLK),
		.data(frame_buffer_data),
		.rdaddress(read_addr),
		.wraddress(write_addr),
		.wren(wren && frame_selector == 0),
		.q(frame_buffer_1_data)
	);

	// Rendering logic
	always_ff @(posedge pixel_clk) begin
		if (RESET) begin
			frame_selector <= 0;
		end else begin
			// Swap frame buffers at end of frame
			if (switch_buffer && FrameComplete) begin
				frame_selector <= ~frame_selector;
			end
		end
	end
	
	always_ff @(posedge CLK) begin
		if (frame_selector == 0) begin
			palette_address <= frame_buffer_0_data;
		end else begin
			palette_address <= frame_buffer_1_data;
		end
	end
	
	palette_rom palette_rom(.addr(palette_address), .data(palette_color));
//		
//	always_ff @(posedge pixel_clk) begin
//		color <= palette_color;
//	end

	
endmodule
