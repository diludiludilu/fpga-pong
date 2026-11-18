# Contributing to FPGA Pong

## Golden rule

Do not push directly to main. Work on your own branch, test your change, and open a pull request.

## Branch names

Use names that show the type of work and member/module:

- feature/member-1-top-level
- feature/member-2-vga-timing
- feature/member-3-ball-engine
- feature/member-4-paddle-controls
- fix/vga-sync-boundary
- docs/update-setup-guide

## Commit messages

Keep commit messages short and meaningful:

- Add VGA timing counters
- Implement paddle boundary checks
- Add ball collision testbench
- Document board pin mapping

Do not use messages such as update, final, or my work.

## Before opening a pull request

- [ ] My branch is based on the latest main.
- [ ] I changed only files related to the task.
- [ ] The code is readable and I can explain it.
- [ ] I ran the relevant simulation or syntax check.
- [ ] I recorded the test result.
- [ ] I updated documentation if an interface or design decision changed.
- [ ] I checked git status and did not include generated Vivado files or secrets.
- [ ] I linked the GitHub issue for my task.

## Pull request description

Every pull request should explain:

1. What changed? Name the module or document.
2. Why was it changed? Link it to the project requirement or issue.
3. How was it tested? Give the testbench/simulation result.
4. What should the reviewer check? Mention any important logic or interface.
5. Are there known problems? Do not hide unfinished work.

## Code collaboration rules

- Agree on shared module ports before implementing connections.
- Tell the team before changing a port name, width, clock, reset, or signal meaning.
- Do not silently overwrite another member's work.
- Keep one owner for each module, but let other members review it.
- Prefer small pull requests that are easy to understand.
- Do not merge code that has not been tested.
- If a test cannot be run, explain why in the pull request.

## Verilog style

- Use clear module and signal names.
- Use consistent indentation.
- Comment why important logic is needed, not every obvious line.
- Keep sequential logic and combinational logic clearly separated.
- Use non-blocking assignments (<=) in clocked sequential blocks.
- Use blocking assignments (=) in combinational blocks.
- Avoid inferred latches.
- Keep the clock and reset conventions consistent across modules.
- Use parameters for values the team may need to tune, such as paddle height, ball size, and winning score.

## Vivado files

The source of truth for design code should be the files in rtl/, with constraints in constraints/ and testbenches in simulation/.

Do not upload .lic files, passwords, tokens, or personal credentials. Do not commit Vivado cache/run/log folders. Commit the .xpr project file only if the team has agreed on a reproducible shared project layout.
