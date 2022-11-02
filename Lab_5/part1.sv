module part1(Clock, Enable, Reset, CounterValue);
    input logic Clock, Enable, Reset;
    input logic [6:0] wires;
    output logic [7:0]CounterValue;

    tflip t1(Clock, Enable, Reset, CounterValue[0]);
    wires[0] = Enable & CounterValue[0];
    
    tflip t2(Clock, wires[0], Reset, CounterValue[1]);
    wires[1] = wires[0] & CounterValue[1];
    
    tflip t3(Clock, wires[1], Reset, CounterValue[2]);
    wires[2] = wires[1] & CounterValue[2];
    
    tflip t4(Clock, wires[2], Reset, CounterValue[3]);
    wires[3] = wires[2] & CounterValue[3];
    
    tflip t5(Clock, wires[3], Reset, CounterValue[4]);
    wires[4] = wires[3] & CounterValue[4];
    
    tflip t6(Clock, wires[4], Reset, CounterValue[5]);
    wires[5] = wires[4] & CounterValue[5];
    
    tflip t7(Clock, wires[5], Reset, CounterValue[6]);
    wires[6] = wires[5] & CounterValue[6];
    
    tflip t8(Clock, wires[6], Reset, CounterValue[7]);

endmodule

module tflip(Clock, Enable, Reset, CounterValue);
    input logic Clock, Enable, Reset;
    output logic CounterValue;
    always_ff @ (posedge Clock, negedge Reset)
    begin
        if(!Reset)
            CounterValue <= 0;
        else
            CounterValue <= Enable^CounterValue;
    end
endmodule