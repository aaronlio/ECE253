vlib work
vlog part2.sv
vsim part2

log {*/}
add wave {/*}

force {ClockIn} 0,1 1 ns -r 2ns

########## Basic Tests ##########

# Testing full speed
force {Reset} 1
force {Speed} 00
run 2ns

force {Reset} 0
run 39ns

# Testing 1 Hz
force {Reset} 1
force {Speed} 01
run 2ns

force {Reset} 0
run 152ns

force {Speed} 10
run 500ns

# Testing 0.5 Hz
force {Reset} 1
force {Speed} 10
run 2ns

force {Reset} 0
run 603ns

# Testing 0.25 Hz
force {Reset} 1
force {Speed} 11
run 2ns

force {Reset} 0
run 1203ns