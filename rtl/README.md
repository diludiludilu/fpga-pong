# RTL source files

Place synthesizable Verilog design modules in this folder.

Suggested modules:
- pong_top.v - top-level integration (Member 1)
- vga_timing.v - VGA counters, pixel enable, sync, frame tick (Member 2)
- pong_renderer.v - pixel colour and game-object rendering (Member 2)
- input_conditioner.v - button synchronizer and debounce (Member 4)
- paddle_controller.v - paddle movement and limits (Member 4)
- game_controller.v - game state machine (Member 4)
- ball_engine.v - ball movement, collision, and scoring (Member 3)

These names are suggestions. Agree on module interfaces before adding code. Keep testbenches in simulation/, not in this folder.
