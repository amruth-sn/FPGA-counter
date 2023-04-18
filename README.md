# FPGA Counter
This project is structured as follows: Multiple n-bit counters are implemented alongside a counter-debouncer that feed into a display driver which outputs from a seven-segment display driver.

The design consists of two states, or “modes”: automatic counting where the counter increments every second (1Hz), or manual counting in which the counter increments at the push of a button.

An active-low reset was also mapped to the push of a button. The value of the counter is displayed in hexadecimal on a seven-segment display. First, two clock divider modules were created in order to divide a global clock (running on 100MHz) into two more clocks: a 1kHz “fast clock” and the 1Hz “slow clock”. The counter-debouncer was next implemented and takes in the global clock. In turn, depending on the mode, a 16-bit counter is fed either the divided slow clock or the debounced global clock as its increment. A display control module was created that uses a 2-bit counter with the fast clock as its increment value. It is also fed in the value of the 16-bit counter every global clock cycle. This outputs a 2-bit select line that is used to generate two values: a 4-bit digit select value that determines the digit to display on the FPGA (one at a time), and a 4-bit hex value from the counter depending on the value of the select line. This hex value is input into a seven-segment decoder to yield a 7-bit binary value that is mapped to the seven-segment display on the FPGA.
