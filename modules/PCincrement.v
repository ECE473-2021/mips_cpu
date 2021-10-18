module PCincrement(
input wire[31:0] PCin,
output reg[31:0] sum);

reg one;
always @(*)begin
one <= 1'b1; //Might need to be 4 if we do byte addressable.
sum = PCin + one;
end
endmodule