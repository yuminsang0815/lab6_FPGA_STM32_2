# Combo II-DLD S75 (xc7s75fgga484-1) / DAC (최상위 dac)
# KEYPADS SEL 아래(Button Switch), 클록 스위치 F(50 MHz).
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]

# 리셋: 키패드 SW_1, 출력 채널 선택(A/B): DIP8
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN U4 [get_ports add_sel]

# DAC에 쓰는 값(0~255 증가) → LED1~LED8
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]

# TODO(실험실): 교재 DAC 핀 구성표의 FPGA 핀 번호를 넣고 주석을 해제한다.
# set_property PACKAGE_PIN ?? [get_ports dac_csn]
# set_property PACKAGE_PIN ?? [get_ports dac_ldacn]
# set_property PACKAGE_PIN ?? [get_ports dac_wen]
# set_property PACKAGE_PIN ?? [get_ports dac_a_b]
# set_property PACKAGE_PIN ?? [get_ports {dac_d[0]}]         ... dac_d[7:0] 8개

set_property IOSTANDARD LVCMOS33 [get_ports *]
set_false_path -from [get_ports {rst_p add_sel}]
