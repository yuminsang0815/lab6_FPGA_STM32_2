# Combo II-DLD S75 (xc7s75fgga484-1) / 서보모터 제어 (최상위 servo_board)
# KEYPADS SEL 아래(Button Switch), 클록 스위치 F(50 MHz).
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]

# 키패드 SW_1 = 리셋(1.5 ms 중앙), SW_2 = 왼쪽(-0.1 ms), SW_3 = 오른쪽(+0.1 ms)
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN N8 [get_ports btn_left]
set_property PACKAGE_PIN N4 [get_ports btn_right]

# TODO(실험실): 교재 SERVO MOTOR 핀 구성표의 FPGA 핀 번호를 넣고 주석을 해제한다.
# set_property PACKAGE_PIN ?? [get_ports servo]

# 현재 펄스 폭(0.1 ms 단위, 10~20) → LED1~LED8
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports *]
set_false_path -from [get_ports {rst_p btn_left btn_right}]
