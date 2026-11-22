`timescale 1ns/1ps

module tb_ball_engine;
    reg clk100 = 0;
    always #5 clk100 = !clk100;

    reg reset = 1, frame_tick = 0, game_active = 0;
    wire signed [10:0] ball_x, ball_y;

    ball_engine dut (
        .clk100(clk100), .reset(reset), .frame_tick(frame_tick),
        .game_active(game_active), .ball_x(ball_x), .ball_y(ball_y)
    );

    task check_position;
        input signed [10:0] x, y;
        begin
            @(posedge clk100);
            @(negedge clk100);
            if (ball_x !== x || ball_y !== y)
                $fatal(1, "Expected (%0d, %0d), got (%0d, %0d)", x, y, ball_x, ball_y);
        end
    endtask

    initial begin
        check_position(316, 236);
        reset = 0;
        game_active = 1;
        check_position(316, 236);
        frame_tick = 1;
        check_position(320, 239);
        frame_tick = 0;
        check_position(320, 239);
        game_active = 0;
        frame_tick = 1;
        check_position(320, 239);
        game_active = 1;
        check_position(324, 242);
        reset = 1;
        check_position(316, 236);
        $display("PASS: centre reset, frame-gated movement, pause, and resume");
        $finish;
    end
endmodule
