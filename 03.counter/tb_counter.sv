module tb_counter #(parameter WIDTH = 4);

    logic clk;
    logic reset;
    logic [WIDTH-1:0] test_count;

    // 카운터 인스턴스화
    // #(.WIDTH(WIDTH)) 이건 왜 있는거지
    // 테스트 벤치에서 설정한 WIDTHdml 크기를 그대로 사용할 수 있음
    // 즉 아웃풋(count)의 크기를 설정할 수 있음
    counter #(.WIDTH(WIDTH)) dut (
        .clk (clk),
        .rst (reset),
        .count (test_count)
    );

    integer i;

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    initial begin
        // 모니터링 세팅: 값이 바뀔 때마다 자동으로 콘솔에 찍어줌!
        $monitor("Time = %03t | rst = %b | count = %02d", $time, reset, test_count);

        // 근데 이러면 굳이 리셋이 필요 없는거 아닌가
        // 모듈을 작동시켰을 때 회로에 어떤 값이 들어있는지 알 수 없음
        // 따라서 리셋을 실행시켜 회로를 초기화
        reset = 1;
        #30;
        reset = 0;

        // 충분히 시간이 흘러 값이 잘 올라가는지 구경할 시간 주기
        
        //for (i = 0; i < 5; i++)begin
        //    $display("count: %d", test_count);
            #100;
        // end
        // 시뮬레이션 종료
        $finish;
        

        /*
        while (!rst && test_count < 6) begin
            if(clk) begin
                test_count++; // > 테스트에서 아웃풋을 조작할 수 없음, 애초에 dut에서 아웃풋(count연산)을 결정을 해놓고 왜 이렇게 했던거지
                #30;
            end
        end
        */
    end

endmodule

/*
첫 출력
count:  0
count:  7
count: 14
count:  5
count: 12

클럭이 #5, 한 사이클이 #10인데 포문 내부 딜레이가 #70 이여서 7씩 증가
*/