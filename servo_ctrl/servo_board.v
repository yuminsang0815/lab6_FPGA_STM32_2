`timescale 1ns/1ps
// 보드 시연용 최상위: 키패드 버튼을 동기화·20 ms 디바운스해 한 클록 펄스로 바꾼 뒤
// servo_ctrl과 같은 구성(servo_position + servo_pwm)에 전달합니다.
// (left_pulse/right_pulse는 버튼 한 번당 한 클록 펄스여야 하므로)
// 현재 펄스 폭은 LED에 0.1 ms 단위 값(10~20)으로 표시합니다.
module servo_board(
    input wire clk_50mhz, rst_p, btn_left, btn_right,
    output wire servo,
    output wire [7:0] led_out
);
    wire left_pulse, right_pulse;
    wire [31:0] pulse_us;
    button_onepulse u_left (.clk(clk_50mhz), .rst_p(rst_p), .button(btn_left),  .pulse(left_pulse));
    button_onepulse u_right(.clk(clk_50mhz), .rst_p(rst_p), .button(btn_right), .pulse(right_pulse));
    servo_position u_position(clk_50mhz, rst_p, left_pulse, right_pulse, pulse_us);
    servo_pwm u_pwm(clk_50mhz, rst_p, pulse_us, servo);
    assign led_out = pulse_us / 100;   // 1000~2000 us → 10~20
endmodule
