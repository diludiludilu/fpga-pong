# FPGA-Based VGA Pong Game

## Digital System Design with HDL

A two-player Pong game implemented in Verilog HDL for the Digilent Nexys A7 Artix-7 FPGA board.

## Project overview

The FPGA generates a VGA display and controls a two-player Pong game. Players move paddles using onboard pushbuttons. The ball moves automatically, detects wall and paddle collisions, and updates the score when a player misses.

## Target hardware and tools

- FPGA board: Digilent Nexys A7
- FPGA family: Artix-7
- Main clock: 100 MHz
- Display: VGA, 640 x 480
- HDL: Verilog
- Development software: AMD Vivado 2026.1

**Board check still required:** Confirm whether the physical board is the Nexys A7-50T or Nexys A7-100T before selecting the FPGA part or adding XDC pin constraints.

## Planned features

- VGA display generation
- Two-player paddle control
- Ball movement
- Wall and paddle collision detection
- Score management
- Start, pause, resume, and restart
- Winner detection

## Team responsibilities and GitHub tasks

| Member | Responsibility | GitHub issue |
|---|---|---|
| Member 1 (you) | Project coordination, Vivado setup, top-level integration, board constraints, final FPGA test | [Issue #1](https://github.com/diludiludilu/fpga-pong/issues/1) |
| Member 2 | VGA timing and graphics rendering | [Issue #2](https://github.com/diludiludilu/fpga-pong/issues/2) |
| Member 3 | Ball movement, collision detection, and scoring | [Issue #3](https://github.com/diludiludilu/fpga-pong/issues/3) |
| Member 4 | Button conditioning, paddle control, and game state machine | [Issue #4](https://github.com/diludiludilu/fpga-pong/issues/4) |

The issues contain detailed checklists, deliverables, and acceptance checks. They are not assigned to GitHub accounts yet because the other members' usernames are not known.

## Documentation

- [Full project plan, responsibilities, and six-week timeline](docs/PROJECT_PLAN.md)
- [System architecture and proposed module interfaces](docs/ARCHITECTURE.md)
- [Getting started, GitHub workflow, and Vivado setup](docs/GETTING_STARTED.md)
- [Contribution and pull-request rules](CONTRIBUTING.md)

## Repository layout

- rtl/ - synthesizable Verilog design modules
- constraints/ - board-specific XDC constraints
- simulation/ - testbenches and simulation notes
- docs/ - project documentation
- vivado/ - optional Vivado project files, if the team agrees to track them

## How the team works

1. Every member reads the project plan and their GitHub issue.
2. Each member works on a separate Git branch.
3. Test the module before opening a pull request.
4. Ask another member to review the pull request.
5. Merge reviewed work into main.

Do not push directly to main. See CONTRIBUTING.md.

## Current project status

**Planning and setup.** The repository has the team plan and task issues. RTL modules, constraints, testbenches, and FPGA hardware results will be added as the team develops and tests them.
