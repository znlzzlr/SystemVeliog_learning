module counter #(parameter WIDTH = 4) (
    input logic clk,
    input logic rst, // 리셋 신호가 들어오면 0으로 초기화
    output logic [WIDTH-1:0] count
);

    // 클럭의 상승 엣지(posedge)마다 동작하는 블록은 always_ff를 쓴다네
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            // rst <= 0; 해당 구문이 rst를 wire로 취급하게 하여 오류 발생
        end else begin
            // 클럭이 뛸 때마다 count를 어떻게 처리해야 할까?
            count <= count + 1;
        end
    end

endmodule