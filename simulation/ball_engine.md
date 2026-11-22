# Member 3 milestone 1

The 8 by 8 ball starts at (316, 236) in the 640 by 480 playfield.
The signed 11-bit outputs represent the ball's top-left corner.
An active-high synchronous reset returns it to the centre.
With the game active, each frame tick advances X by 4 and Y by 3.

Run from the repository root.

```powershell
iverilog -g2012 -Wall -s tb_ball_engine -o ball_test.vvp rtl/ball_engine.v simulation/tb_ball_engine.v
vvp ball_test.vvp
```

Expected result is PASS for centre reset, frame-gated movement, pause,
and resume. The next milestone adds top and bottom wall bounce.
