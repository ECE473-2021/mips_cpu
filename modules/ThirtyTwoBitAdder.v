module ThirtyTwoBitAdder(
input wire[31:0] operand1,
input wire[31:0] operand2,
output reg[31:0] sum,
output reg overflow);

reg[32:0]SumBus;

always @(*)begin
SumBus = operand1+operand2;
sum <= SumBus[31:0];
overflow <= SumBus[32];
end
endmodule