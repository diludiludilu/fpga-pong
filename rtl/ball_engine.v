`timescale 1ns/1ps

module ball_engine (
    input wire clk100, reset, frame_tick, game_active,
    output reg signed [10:0] ball_x, ball_y
);
    localparam signed [10:0] START_X = 11'sd316;
    localparam signed [10:0] START_Y = 11'sd236;
    localparam signed [10:0] VELOCITY_X = 11'sd4;
    localparam signed [10:0] VELOCITY_Y = 11'sd3;

    always @(posedge clk100) begin
        if (reset) begin
            ball_x <= START_X;
            ball_y <= START_Y;
        end else if (frame_tick && game_active) begin
            ball_x <= ball_x + VELOCITY_X;
            ball_y <= ball_y + VELOCITY_Y;
        end
    end
endmodule
