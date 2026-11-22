# Getting Started

## 1. Get access to the private repository

Repository: https://github.com/diludiludilu/fpga-pong

This repository is private. Sending the link alone does not give someone access. The owner must open **Settings → Collaborators → Add people**, enter each member's GitHub username, and send an invitation. Each member must accept it.

Never share a GitHub password or personal access token with the group.

## 2. Tools needed

- AMD Vivado with Verilog simulation support.
- Git or GitHub Desktop.
- A text editor for Verilog and Markdown.
- Access to the Nexys A7 board for hardware testing.

Use the same Vivado version where possible. The project coordinator is currently using Vivado 2026.1. Do not upload a personal Vivado license file (.lic) to GitHub.

## 3. Confirm the FPGA board

Check the model printed on the physical board: Nexys A7-50T or Nexys A7-100T. Tell Member 1 the exact model. The FPGA part and XDC constraints depend on this choice. Do not select a device based only on the words "Artix-7".

## 4. Clone the repository

After accepting the invitation, open a terminal or Git Bash and run:

```bash
git clone https://github.com/diludiludilu/fpga-pong.git
cd fpga-pong
git branch
```

To get the latest main branch later:

```bash
git switch main
git pull origin main
```

## 5. GitHub workflow

Do not edit the shared main branch directly. Each member works on a separate branch and opens a pull request.

### Step A: Update main

```bash
git switch main
git pull origin main
```

### Step B: Create your own branch

Examples:

```bash
git switch -c feature/member-2-vga-timing
git switch -c feature/member-3-ball-engine
git switch -c feature/member-4-paddle-controls
```

Member 1 can use feature/member-1-top-level.

### Step C: Edit and test

- Edit files related to your task.
- Read the code and understand what each signal does.
- Run the relevant testbench.
- Tell the team before changing a shared module interface.

### Step D: Commit your work

```bash
git status
git add rtl simulation docs
git commit -m "Add VGA timing module"
```

Use a commit message that describes your actual change.

### Step E: Push your branch

```bash
git push -u origin feature/member-2-vga-timing
```

Replace the example branch name with your own.

### Step F: Open a pull request

1. Open the repository on GitHub.
2. Click **Compare & pull request** for your branch.
3. Explain what you changed.
4. List the tests you ran and their results.
5. Link the GitHub issue for your task.
6. Ask another member to review it.
7. Fix requested changes.
8. Merge only after review.

## 6. Member task links

- [Member 1: Project coordination and integration](https://github.com/diludiludilu/fpga-pong/issues/1)
- [Member 2: VGA timing and graphics](https://github.com/diludiludilu/fpga-pong/issues/2)
- [Member 3: Ball movement, collisions, and scoring](https://github.com/diludiludilu/fpga-pong/issues/3)
- [Member 4: Buttons, paddles, and game state machine](https://github.com/diludiludilu/fpga-pong/issues/4)

Open the issue for your member number. Read its checklist, deliverables, and acceptance checks.

## 7. Create the Vivado project

Confirm the exact FPGA part first.

1. Open Vivado.
2. Select **Create Project**.
3. Name it FPGA_VGA_PONG.
4. Choose **RTL Project**.
5. Add Verilog source files from the repository's rtl/ folder when they are ready.
6. Add testbench files from simulation/ when running simulation.
7. Add the board-specific XDC file from constraints/ only after the board variant and pin mapping are confirmed.
8. Select the exact FPGA part or matching board definition.
9. Run Check Syntax or Run Simulation.
10. Save the project locally.

Keep the source files in the repository folders as the team's shared copies. Do not create multiple competing copies of the same Verilog file.

The team should agree before committing the Vivado .xpr project file. Generated run, cache, and log folders should not be committed.

## 8. Where files belong

| Folder | Purpose |
|---|---|
| rtl/ | Verilog design modules |
| constraints/ | Board-specific XDC constraints |
| simulation/ | Testbenches and simulation notes/results |
| docs/ | Project plan, architecture, setup notes, and evidence |
| vivado/ | Optional Vivado project file, only if the team agrees to track it |

## 9. Do not upload private or generated files

Never commit or push:

- Local environment files such as `.env`, `.env.local`, or `.env.production`.
- Passwords, API keys, GitHub tokens, SSH private keys, or other credentials.
- Personal Vivado license files such as `.lic`.
- Private key/certificate files such as `.pem`, `.key`, `.p12`, or `.pfx`.
- Vivado cache, run, and temporary folders.
- `.jou`, `.log`, and other generated files.
- Large generated files unless the team specifically decides they are required.

### Do we need a .env file for this FPGA project?

Normally, no. This is a Verilog/Vivado FPGA project, so the source code, testbenches, constraints, and Vivado project files do not usually need a `.env` file. Do not create one unless a specific tool or script in this project genuinely requires environment variables.

If a future script needs configuration:

1. Keep real secrets and machine-specific values in a local `.env` file.
2. Never commit that real `.env` file.
3. If teammates need to know which variable names are required, create an `.env.example` containing placeholder values only, never real credentials.
4. Share required setup instructions in the documentation, not passwords or tokens in GitHub.

The repository's `.gitignore` excludes local environment files, private keys, Vivado license files, and common Vivado-generated files. **Important:** `.gitignore` only prevents new untracked files from being added; it does not remove a file that was already committed. Always inspect `git status` and the staged file list before committing.

## 10. First tasks for every member

1. Accept the repository invitation.
2. Clone the repository.
3. Read README.md.
4. Read docs/PROJECT_PLAN.md.
5. Read docs/ARCHITECTURE.md.
6. Open the GitHub issue for your member number.
7. Tell the group that you can access the repository.
8. Do not change shared interfaces until the team agrees on them.
