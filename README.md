
# FPGA-Based VGA Pong Game

## Digital System Design with HDL

A two-player Pong game implemented using Verilog HDL on the Digilent Nexys A7 Artix-7 FPGA.

## Project Overview

The FPGA generates a VGA display and controls a two-player Pong game.

Players control their paddles using the onboard pushbuttons. The ball moves automatically, detects collisions, and updates the score when a player misses.

## Hardware

- FPGA Board: Digilent Nexys A7
- FPGA Family: Artix-7
- Main Clock: 100 MHz
- Display: VGA 640 x 480
- Development Software: AMD Vivado

## Main Features

- VGA display generation
- Two-player paddle control
- Ball movement
- Wall collision detection
- Paddle collision detection
- Score management
- Start and pause
- Restart and winner detection

## Team Responsibilities

- Member 1: Project coordination, top-level integration and FPGA implementation
- Member 2: VGA timing and graphics rendering
- Member 3: Ball physics, collision detection and scoring
- Member 4: Button conditioning, paddle control and game FSM

## Repository Structure

- rtl/ - Verilog source files
- constraints/ - FPGA constraints
- simulation/ - Testbenches and results
- docs/ - Project documentation
- vivado/ - Vivado project files

## Development Workflow

All modules must be tested before integration.

Changes should be submitted through branches and pull requests.

The main branch should contain the latest reviewed and integrated version.

## Project Status

Planning and initial development.
