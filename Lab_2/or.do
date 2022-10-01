# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim v7432

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# first test case
#set input values using the force command, signal names need to be in {} brackets
force {pin1} 0
force {pin2} 0
#run simulation for a few ns
run 10ns

# second test case
force {pin1} 0
force {pin2} 1
#run simulation for a few ns
run 10ns

# third test case
force {pin1} 1
force {pin2} 0
#run simulation for a few ns
run 10ns

# fourth test case
force {pin1} 1
force {pin2} 1
#run simulation for a few ns
run 10ns

# pin4,5

force {pin4} 0
force {pin5} 0
#run simulation for a few ns
run 10ns

force {pin4} 0
force {pin5} 1
#run simulation for a few ns
run 10ns

force {pin4} 1
force {pin5} 0
#run simulation for a few ns
run 10ns

force {pin4} 1
force {pin5} 1
#run simulation for a few ns
run 10ns

# pin13,12

force {pin12} 0
force {pin13} 0
#run simulation for a few ns
run 10ns

force {pin12} 0
force {pin13} 1
#run simulation for a few ns
run 10ns

force {pin12} 1
force {pin13} 0
#run simulation for a few ns
run 10ns

force {pin12} 1
force {pin13} 1
#run simulation for a few ns
run 10ns

# pin10,9

force {pin10} 0
force {pin9} 0
#run simulation for a few ns
run 10ns

force {pin10} 0
force {pin9} 1
#run simulation for a few ns
run 10ns

force {pin10} 1
force {pin9} 0
#run simulation for a few ns
run 10ns

force {pin10} 1
force {pin9} 1
#run simulation for a few ns
run 10ns