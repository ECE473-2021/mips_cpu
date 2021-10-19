module PC(
    input wire [31:0] newPC,
    input wire clock,
    input wire reset,
    output reg[31:0] PC); //Not sure if I'm in love with these names, feel free to suggest fixes.

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            PC <= 32'h00000000;
        end
        else begin
            PC <= newPC;
        end
    end


endmodule