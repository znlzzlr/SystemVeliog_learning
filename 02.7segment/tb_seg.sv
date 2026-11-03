module tb_seg;

    // 1. 모듈에 넣어줄 가짜 입력과 결과를 받을 변수를 선언한다네
    logic [3:0] test_number;
    logic [6:0] test_seg;
    logic t_a, t_b, t_c, t_d, t_e, t_f, t_g;

    // 2. 아까 만든 seg 모듈을 여기에 소환(Instantiation)한다네
    seg dut(
        .number(test_number),
        .seg(test_seg)
    );
    // 3. initial 블록을 열어서 시간을 흘려가며 test_number에 값을 차례대로 넣어보게나!
    integer i;

    initial begin

        $dumpfile("sim.vcd"); // 파형을 저장할 파일 이름을 지정하고
        $dumpvars(0, tb_seg);  // 이 모듈 아래의 모든 신호를 기록하라는 뜻이지

        for (i = 0; i < 10; i = i + 1) begin
            test_number = i;
            #20;
            $display("num = %d, seg = %b", test_number, test_seg);
        end   

        $finish;
    end

endmodule
