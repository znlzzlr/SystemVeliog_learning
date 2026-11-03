module seg(
    input logic[3:0] number, 

    output logic [6:0] seg
);

always_comb begin
    case (number)
        0: seg = 7'b0111111;
        2: seg = 7'b1011011;
        1: seg = 7'b0000110;
        3: seg = 7'b1001111;
        4: seg = 7'b1001100;
        5: seg = 7'b0101101;
        6: seg = 7'b1111101;
        7: seg = 7'b0000111;
        8: seg = 7'b1111111;
        9: seg = 7'b1101111;
        default: seg = 7'b0000000;
    endcase
end


/*
always_comb begin
    case (입력_신호)
        값1: 출력_신호 = 7비트_이진수_상수;
        값2: 출력_신호 = 7비트_이진수_상수;
        default: 출력_신호 = 7비트_이진수_상수;
    endcase
end
*/

endmodule