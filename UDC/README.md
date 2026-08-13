4-Bit UP/DOWN Counter

A simple and synthesizable 4-bit synchronous UP/DOWN Counter designed using Verilog HDL. The project includes RTL code, a self-checking testbench, simulation, and waveform verification.

📌 Project Overview

The UP/DOWN Counter can increment or decrement its output value depending on the up_down control signal.

up_down = 1 → Counter counts UP
up_down = 0 → Counter counts DOWN
enable = 1 → Counting is enabled
enable = 0 → Counter holds its current value
reset = 1 → Counter resets to 0

The counter is implemented as a synchronous design, with all counting operations occurring on the rising edge of the clock.

✨ Features
4-bit counter
Synchronous reset
UP/DOWN counting
Enable control
Automatic wrap-around
Synthesizable Verilog RTL
Self-checking testbench
VCD waveform generation
GTKWave simulation support
🧩 Block Diagram
                 ┌─────────────────────────┐
                 │                         │
        clk ────►│                         │
      reset ────►│                         │
     enable ────►│    4-BIT UP/DOWN        │────► count[3:0]
    up_down ────►│       COUNTER           │
                 │                         │
                 └─────────────────────────┘

🔌 Input and Output Signals
Signal	Direction	Width	Description
clk	Input	1	Clock signal
reset	Input	1	Synchronous reset
enable	Input	1	Enables counting
up_down	Input	1	1 = UP, 0 = DOWN
count	Output	4	Current counter value
🔢 Counting Operation
UP Counting

When enable = 1 and up_down = 1:

0 → 1 → 2 → 3 → 4 → ... → 14 → 15 → 0

DOWN Counting

When enable = 1 and up_down = 0:

15 → 14 → 13 → ... → 3 → 2 → 1 → 0 → 15

Hold

When enable = 0, the counter maintains its current value.

5 → 5 → 5 → 5

📁 Project Structure
up-down-counter/
│
├── README.md
│
├── src/
│   └── up_down_counter.v
│
├── tb/
│   └── up_down_counter_tb.v
│
├── sim/
│   └── waveform.png
│
├── docs/
│   └── block_diagram.png
│
└── .gitignore

💻 RTL Design

The main RTL module is located at:

src/up_down_counter.v


The counter uses a parameterized width, allowing the design to be easily modified for counters larger or smaller than 4 bits.

🧪 Testbench

The testbench is located at:

tb/up_down_counter_tb.v


The testbench verifies:

Reset operation
UP counting
DOWN counting
Enable OFF / hold operation
Enable ON operation
Reset operation after counting

The testbench is self-checking and displays PASSED or FAILED messages in the simulator console.

📊 Simulation

The design can be simulated using Icarus Verilog and the waveform can be viewed using GTKWave.

Compile
iverilog -o up_down_counter.vvp src/up_down_counter.v tb/up_down_counter_tb.v

Run
vvp up_down_counter.vvp

Open Waveform
gtkwave up_down_counter.vcd

✅ Expected Test Results
TEST 1 PASSED: Reset
TEST 2 PASSED: UP count
TEST 2 PASSED: UP count
TEST 2 PASSED: UP count
TEST 3 PASSED: DOWN count
TEST 3 PASSED: DOWN count
TEST 4 PASSED: Enable OFF
TEST 5 PASSED: Enable ON
TEST 6 PASSED: Reset again
--------------------------------
All tests completed.
--------------------------------

📈 Waveform

The simulation waveform should show:

clk      ─┐_┌─┐_┌─┐_┌─┐_┌─┐_┌─

reset    ────────┐________________

enable   ________┌────────────────

up_down  ────────┌───────┐────────
                  UP      DOWN

count    0  →  1  →  2  →  3  →  2  →  1


A GTKWave screenshot can be placed in:

sim/waveform.png


and displayed here:

![Simulation Waveform](sim/waveform.png)

🛠️ Tools Used
Verilog HDL
Icarus Verilog
GTKWave
Git
GitHub
🎯 Learning Objectives

This project demonstrates:

RTL design using Verilog
Sequential logic
Clocked always blocks
Counters
Control signals
Testbench development
Self-checking simulation
Waveform analysis
GitHub project organization
🚀 Future Improvements

Possible extensions include:

Parameterized counter width
Asynchronous reset option
Loadable counter value
Terminal-count output
7-segment display interface
FPGA implementation
Separate UP and DOWN buttons
Debouncing for physical buttons
👨‍💻 Author

Your Name: B.Likitha

Digital Design / Verilog HDL Project

📄 License

This project is available for educational and personal use.