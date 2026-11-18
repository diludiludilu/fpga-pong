# Project Plan: FPGA-Based VGA Pong

## 1. Project goal

Build a two-player Pong game in Verilog HDL and run it on a Digilent Nexys A7 Artix-7 FPGA board. The FPGA will generate a VGA picture, read the board's pushbuttons, move two paddles and a ball, detect collisions, and keep score.

This repository is the team's shared source of truth. Keep the project plan, member responsibilities, tasks, decisions, and test evidence here so that every member knows what is happening.

## 2. What the finished game should do

1. Show a Pong playfield on a VGA monitor.
2. Show two paddles, one on the left and one on the right.
3. Let two players move their paddles using the onboard pushbuttons.
4. Move the ball automatically while the game is playing.
5. Bounce the ball from the top and bottom walls.
6. Bounce the ball from a paddle when the ball hits it.
7. Give a point to the other player when a player misses the ball.
8. Display both players' scores.
9. Support start, pause, resume, and restart.
10. Show a winner when the agreed winning score is reached.

## 3. Hardware and software baseline

| Item | Current project target |
|---|---|
| FPGA board | Digilent Nexys A7 |
| FPGA family | Artix-7 |
| Main clock | 100 MHz |
| Display | VGA, 640 x 480 active area |
| HDL | Verilog |
| Design software | AMD Vivado 2026.1 |
| Players | 2 |
| Input | Onboard pushbuttons |
| Output | VGA monitor |

**Important hardware check:** Nexys A7 boards are available in different FPGA sizes, including 50T and 100T. Before selecting the FPGA part or adding pin constraints, Member 1 must read the exact variant printed on the physical board. Do not guess the part number or copy an XDC file for a different board.

The VGA timing values in this plan are the starting design target. The team must test the display on the actual monitor and record any adjustment.

## 4. Scope and design decisions

### Included in the first version

- VGA timing and RGB output.
- Two paddle controls.
- Ball movement and collision detection.
- Score tracking.
- Start, pause, resume, restart, and winner state.
- Simulation testbenches.
- A working bitstream tested on the physical FPGA.

### Not required for the first version

- Sound effects.
- Online multiplayer.
- Network communication.
- Complex menus or animations.
- Saving high scores after power is removed.

Keep the first version small and reliable. Extra features can be considered only after the required game works.

### Initial values to agree and tune

The team should agree on object sizes, ball speed, paddle speed, and winning score before final integration. Suggested starting values are:

- Playfield: 640 x 480 pixels.
- Paddle height: about 64 pixels.
- Paddle width: about 8 pixels.
- Ball: about 8 x 8 pixels.
- Winning score: 5 points.

These are design starting points, not fixed hardware requirements.

## 5. Team responsibilities

Each member owns the modules listed below. Members should explain their own design, write tests, and help with integration. Ownership does not mean working alone: all interface changes must be discussed with the team.

### Member 1 (you): Project coordination and top-level integration

**Main goal:** Make the separate modules work together on the actual FPGA.

Detailed responsibilities:

1. Confirm the exact Nexys A7 variant from the board label.
2. Create the Vivado RTL project and select the matching FPGA part.
3. Agree the clock, reset, signal names, and module interfaces with all members.
4. Create the top-level module, suggested name: pong_top.
5. Connect the VGA, renderer, ball, paddle, button, and game-controller modules.
6. Add the correct official XDC constraints for the confirmed board variant.
7. Check that the clock, reset, VGA pins, and button pins match the board documentation.
8. Integrate one module at a time. Do not wait until every module is finished before compiling.
9. Run elaboration, synthesis, implementation, and bitstream generation.
10. Help module owners fix integration errors without silently changing their design.
11. Test the bitstream on the physical FPGA.
12. Keep the README, project status, and final evidence up to date.
13. Review pull requests and check that each contribution includes a test result.

**Expected files/deliverables:**

- Top-level Verilog module.
- Final board-specific XDC file.
- Vivado setup/build instructions.
- Integration and hardware test results.
- Final demonstration evidence.

### Member 2: VGA timing and graphics renderer

**Main goal:** Make the game visible on the VGA monitor.

Detailed responsibilities:

1. Study the 640 x 480 VGA timing format.
2. Discuss the pixel-enable approach with Member 1.
3. Generate a pixel-enable pulse from the 100 MHz system clock. The initial target is one pixel update every four system-clock cycles, which gives an effective 25 MHz pixel rate.
4. Implement horizontal and vertical counters.
5. Generate horizontal sync, vertical sync, active-video, and pixel-coordinate signals.
6. Implement the renderer for the background, centre line, paddles, ball, and score.
7. Make sure RGB is blank outside the active display area.
8. Use the coordinates and score values supplied by the game modules; do not create a second copy of the game state.
9. Write testbenches for counter limits, sync timing, and active-video boundaries.
10. First display a simple test pattern, then add game objects.

**Expected files/deliverables:**

- VGA timing/pixel-enable module.
- Pong graphics renderer.
- Testbench files and simulation results.
- Short notes explaining timing values, sync polarity, and RGB width.

### Member 3: Ball movement, collision detection, and scoring

**Main goal:** Make the ball behave correctly and keep the score.

Detailed responsibilities:

1. Agree coordinate ranges, object sizes, and update timing with Members 1 and 2.
2. Store the ball's horizontal and vertical position.
3. Store the ball's direction or velocity.
4. Update the ball only on the agreed game tick/frame tick, not on every 100 MHz clock cycle.
5. Detect top-wall and bottom-wall collisions.
6. Detect collisions with the left and right paddles.
7. Detect when the ball passes a paddle and award a point to the other player.
8. Reset the ball to a known serve position after a point.
9. Keep both scores in registers and expose them to the renderer.
10. Define what happens when the winning score is reached with Member 4.
11. Write testbenches for each collision and scoring case.

**Expected files/deliverables:**

- Ball-engine module.
- Score logic, either inside the ball engine or as a separate module agreed by the team.
- Testbenches for wall bounce, paddle hit, missed paddle, score update, and ball reset.
- Short notes explaining the collision conditions and game update rate.

### Member 4: Button conditioning, paddle controls, and game state machine

**Main goal:** Make physical controls reliable and control the game states.

Detailed responsibilities:

1. Agree the logical button mapping with the team.
2. Verify each physical button pin against the official XDC for the confirmed board variant.
3. Synchronize pushbutton inputs to the system clock.
4. Add debounce logic so one press does not create many false events.
5. Create paddle movement logic for both players.
6. Keep both paddles inside the playfield.
7. Implement the game state machine.
8. Support ready/start, playing, paused, and game-over states.
9. Define start, pause, resume, and restart behavior.
10. Coordinate with Member 3 on score and winner signals.
11. Write testbenches for button conditioning, paddle limits, and state transitions.

**Expected files/deliverables:**

- Button synchronizer/debouncer.
- Paddle controller.
- Game controller/state machine.
- Testbenches and a state-transition table or diagram.
- Short notes describing the final button mapping and how to play.

## 6. Suggested module architecture

The following names and boundaries are a starting point. Members should agree on exact ports before writing modules.

| Module | Owner | Purpose |
|---|---|---|
| pong_top | Member 1 | Connects all modules and board I/O |
| vga_timing | Member 2 | Pixel enable, coordinates, sync, active-video, frame tick |
| pong_renderer | Member 2 | Converts coordinates and game objects into RGB |
| input_conditioner | Member 4 | Synchronizes and debounces buttons |
| paddle_controller | Member 4 | Moves and limits both paddles |
| game_controller | Member 4 | Start, play, pause, restart, game-over states |
| ball_engine | Member 3 | Ball movement, wall/paddle collisions, scoring |

Do not create duplicate modules that perform the same job. If the team changes this architecture, update this document before integration.

### Important shared signals

- clk100: 100 MHz board clock.
- reset: internal reset signal with one agreed polarity.
- pixel_ce: one-cycle enable for each VGA pixel update.
- frame_tick: one-cycle enable once per displayed frame, used for game updates.
- pixel_x, pixel_y: current VGA pixel coordinates.
- video_on: indicates that the current pixel is inside the active 640 x 480 area.
- p1_y, p2_y: vertical positions of the two paddles.
- ball_x, ball_y: ball position.
- score1, score2: player scores.
- rgb: VGA colour output.

All sequential game logic should use the same 100 MHz clock and clock-enable pulses where practical. Avoid creating unrelated clocks for individual modules. This keeps the design easier to integrate and reduces clock-domain problems.

## 7. Development timeline

This is a **suggested six-week plan**, not a confirmed course deadline. If the course deadline is earlier, the team should shorten the schedule together and keep the integration/testing stages.

| Period | Main goal | Member 1 | Member 2 | Member 3 | Member 4 |
|---|---|---|---|---|---|
| Week 1 | Setup and agreement | Confirm board, create Vivado project, agree interfaces | Study VGA timing | Design ball/collision rules | Design button mapping and FSM |
| Week 2 | Basic display and inputs | Integrate skeleton and verify clock/reset | Build VGA timing and test pattern | Build ball-engine skeleton and tests | Build button conditioning |
| Week 3 | Visible game objects and paddles | Integrate display and controls | Draw paddles, ball placeholder, centre line | Complete basic ball movement | Complete paddle movement and limits |
| Week 4 | Game behavior | Integrate and compile all modules | Add score rendering | Complete collisions and scoring | Complete start/pause/restart FSM |
| Week 5 | Full simulation and debugging | Run full build and track issues | Test display timing and rendering | Test all scoring/collision cases | Test controls and state transitions |
| Week 6 | FPGA demonstration and report | Program board and lead final tests | Verify VGA display | Verify ball and scoring | Verify controls and game states |

### End-of-week checkpoints

- **Week 1:** Board variant, module list, signal names, reset convention, and button mapping are documented.
- **Week 2:** A VGA test pattern is visible in simulation; input conditioning has a testbench.
- **Week 3:** Paddles and a ball can be drawn; paddle movement works in simulation.
- **Week 4:** Ball collisions, scoring, and game states work in simulation.
- **Week 5:** All modules are integrated and the full test checklist is passed or known failures are recorded.
- **Week 6:** The FPGA demonstration works, and the report, screenshots, and final code are ready.

## 8. Step-by-step project workflow

1. **Confirm hardware.** Read the board model and FPGA size from the physical Nexys A7 board. Record it in the README.
2. **Set up the repository.** Every member gets access, clones the repository, and reads this plan.
3. **Agree interfaces.** Write down module ports, signal widths, clock, reset, and update enables before parallel coding.
4. **Create the Vivado project.** Member 1 selects the correct FPGA part. Do not add guessed pin constraints.
5. **Build the VGA foundation.** Member 2 creates the timing module and a simple test pattern.
6. **Build controls.** Member 4 tests synchronized buttons and paddle movement.
7. **Build game physics.** Member 3 tests ball movement, collisions, and score changes.
8. **Integrate in small steps.** Member 1 connects completed modules and runs compilation after each integration.
9. **Run full simulation.** The team checks the test plan below and fixes failures before hardware testing.
10. **Test on the FPGA.** Verify VGA output, buttons, movement, collisions, score, pause, restart, and winner behavior.
11. **Prepare the submission.** Update documentation, save test evidence, and prepare the demonstration.

## 9. Testing plan

| Area | What must be tested | Expected result |
|---|---|---|
| VGA counters | Horizontal and vertical counter wrap | Counters stop at the agreed totals and restart correctly |
| VGA sync | Sync pulse position and width | Sync and active-video match the chosen timing |
| VGA rendering | Background, centre line, paddles, ball, score | Each object appears at the supplied coordinates |
| Buttons | Synchronization and debounce | One press produces a clean control event |
| Paddles | Up/down movement and screen limits | Paddles move correctly and never leave the playfield |
| Ball | Normal movement | Ball moves only on the game tick |
| Wall collision | Top and bottom edges | Vertical direction reverses |
| Paddle collision | Left and right paddles | Ball bounces when the collision condition is met |
| Scoring | Ball passes a paddle | Correct opponent receives one point |
| Game states | Start, pause, resume, restart, game over | State changes follow the agreed rules |
| Integration | All modules connected | No missing ports, unknown signals, or unexpected latches |
| Hardware | Actual Nexys A7 and VGA monitor | The game is playable on the physical board |

Every module owner should include a testbench and a short note describing what was tested. A simulation screenshot is useful evidence, but it does not replace a testbench.

## 10. Definition of done

A task is complete only when:

- The code is committed to a separate branch.
- The module has a clear purpose and understandable signal names.
- The owner can explain how the module works.
- A testbench covers its important behavior.
- The test result is recorded in the pull request.
- Another member has reviewed the change.
- The pull request is merged into main.

The whole project is complete when the game works on the confirmed FPGA board, all required features pass testing, and the team can explain the design.

## 11. Risks and decisions to track

| Risk / open decision | What the team must do |
|---|---|
| Exact board variant is unknown | Confirm 50T or 100T from the board label before selecting the FPGA part or XDC |
| Incorrect pin constraints | Use the official master XDC matching the exact board variant |
| Different module interfaces | Agree ports and signal widths before coding; update this plan when they change |
| Button bounce | Synchronize and debounce every physical button |
| Game logic runs too fast | Use frame_tick or another agreed clock enable |
| Integration happens too late | Compile and integrate small pieces every week |
| Vivado generated files clutter Git | Commit source, constraints, testbenches, and documentation; ignore generated runs/cache/log files |
| Team members cannot open the repository | The repository is private; the owner must invite each member as a collaborator |

## 12. Team communication

At each group meeting, each member should explain:

1. What I completed since the last meeting.
2. What I tested and what the result was.
3. What I am working on next.
4. What is blocking me or what help I need.

Use the GitHub issue for the member's work. Use pull requests to review code. Use the group chat for quick discussion, but record important technical decisions in this repository so nobody has to search through old messages.

## 13. GitHub task links

- [Member 1 issue: Project coordination and integration](https://github.com/diludiludilu/fpga-pong/issues/1)
- [Member 2 issue: VGA timing and graphics](https://github.com/diludiludilu/fpga-pong/issues/2)
- [Member 3 issue: Ball movement, collisions, and scoring](https://github.com/diludiludilu/fpga-pong/issues/3)
- [Member 4 issue: Buttons, paddles, and game FSM](https://github.com/diludiludilu/fpga-pong/issues/4)

The issues are currently unassigned because the other members' GitHub usernames have not been provided. The team owner can assign each issue after everyone has access.
