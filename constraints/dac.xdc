# Combo II-DLD S75 (xc7s75fgga484-1) / DAC (최상위 dac), 장비 DAC = AD3202(8비트 병렬)
# 핀 출처: 교재 [실습 35] DAC 핀 구성표와 실습 핀 표(p.625). 클록 스위치 F(50 MHz).
# (교재 표의 clk = N8은 오기로 보여 메인 클록 B6을 사용)
set_property PACKAGE_PIN B6 [get_ports clk_50mhz]
create_clock -name clk_50mhz -period 20.000 [get_ports clk_50mhz]

# 리셋 = SW_1, 출력 채널 선택(A/B) = DIP_SW1
set_property PACKAGE_PIN K4 [get_ports rst_p]
set_property PACKAGE_PIN Y1 [get_ports add_sel]

# DAC 제어선
set_property PACKAGE_PIN E1 [get_ports dac_csn]
set_property PACKAGE_PIN F4 [get_ports dac_ldacn]
set_property PACKAGE_PIN G4 [get_ports dac_wen]
set_property PACKAGE_PIN G2 [get_ports dac_a_b]

# DAC 데이터 D7(MSB)~D0
set_property PACKAGE_PIN B3 [get_ports {dac_d[7]}]
set_property PACKAGE_PIN B1 [get_ports {dac_d[6]}]
set_property PACKAGE_PIN C4 [get_ports {dac_d[5]}]
set_property PACKAGE_PIN C2 [get_ports {dac_d[4]}]
set_property PACKAGE_PIN D5 [get_ports {dac_d[3]}]
set_property PACKAGE_PIN D2 [get_ports {dac_d[2]}]
set_property PACKAGE_PIN E5 [get_ports {dac_d[1]}]
set_property PACKAGE_PIN E3 [get_ports {dac_d[0]}]

# DAC에 쓰는 값(0~255 증가) → LED1~LED8
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports *]
set_false_path -from [get_ports {rst_p add_sel}]
