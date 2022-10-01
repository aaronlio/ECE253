# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.sv

#load simulation using mux as the top level simulation module
vsim v7404

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

# first test case
#set input values using the force command, signal names need to be in {} brackets
force {pin1} 0
run 10ns

force {pin1} 1
run 10ns

force {pin3} 0
run 10ns

force {pin3} 1
run 10ns

force {pin5} 0
run 10ns

force {pin5} 1
run 10ns

force {pin9} 0
run 10ns

force {pin9} 1
run 10ns

force {pin11} 0
run 10ns

force {pin11} 1
run 10ns

force {pin13} 0
run 10ns

force {pin13} 1
run 10ns