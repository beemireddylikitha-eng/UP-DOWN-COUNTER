module up_down_counter #(
    parameter WIDTH = 4
)(
    input  wire             clk,
    input  wire             reset,
    input  wire             enable,
    input  wire             up_down,
    output reg  [WIDTH-1:0] count
);

    always @(posedge clk) begin
        if (reset) begin
            count <= {WIDTH{1'b0}};
        end
        else if (enable) begin
            if (up_down)
                count <= count + 1'b1;   // UP
            else
                count <= count - 1'b1;   // DOWN
        end
    end

endmodule


How it works


             ┌─────────────────────┐
 clk ───────►│                     │
 reset ─────►│                     │
 enable ────►│   UP/DOWN COUNTER   │────► count[3:0]
 up_down ───►│                     │
             └─────────────────────┘
