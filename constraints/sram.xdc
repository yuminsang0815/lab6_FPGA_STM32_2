# Combo II-DLD S75 (xc7s75fgga484-1) / SRAM 읽기·쓰기 (최상위 sram, 클록 없는 조합회로)
# KEYPADS SEL 아래(Button Switch).
# 키패드 SW_2 = 쓰기(ctrl_w, 누르는 동안), SW_3 = 읽기(ctrl_r, 누르는 동안)
set_property PACKAGE_PIN N8 [get_ports ctrl_w]
set_property PACKAGE_PIN N4 [get_ports ctrl_r]

# 주소 = DIP1~4, 쓸 데이터 = DIP5~8 (Lab1 4비트 가산기와 같은 핀)
set_property PACKAGE_PIN Y1 [get_ports {address[3]}]
set_property PACKAGE_PIN W3 [get_ports {address[2]}]
set_property PACKAGE_PIN U2 [get_ports {address[1]}]
set_property PACKAGE_PIN T1 [get_ports {address[0]}]
set_property PACKAGE_PIN W4 [get_ports {data_in[3]}]
set_property PACKAGE_PIN W1 [get_ports {data_in[2]}]
set_property PACKAGE_PIN V4 [get_ports {data_in[1]}]
set_property PACKAGE_PIN U4 [get_ports {data_in[0]}]

# 읽은 데이터 하위 4비트 → LED5~LED8 (LED1~4는 항상 0)
set_property PACKAGE_PIN L4 [get_ports {led_out[7]}]
set_property PACKAGE_PIN M4 [get_ports {led_out[6]}]
set_property PACKAGE_PIN M2 [get_ports {led_out[5]}]
set_property PACKAGE_PIN N7 [get_ports {led_out[4]}]
set_property PACKAGE_PIN M7 [get_ports {led_out[3]}]
set_property PACKAGE_PIN M3 [get_ports {led_out[2]}]
set_property PACKAGE_PIN M1 [get_ports {led_out[1]}]
set_property PACKAGE_PIN N5 [get_ports {led_out[0]}]

# TODO(실험실): 교재 SRAM 핀 구성표의 FPGA 핀 번호를 넣고 주석을 해제한다.
# set_property PACKAGE_PIN ?? [get_ports ram_cs]
# set_property PACKAGE_PIN ?? [get_ports ram_oe]
# set_property PACKAGE_PIN ?? [get_ports ram_we]
# set_property PACKAGE_PIN ?? [get_ports {ram_address[0]}]   ... ram_address[17:0] 18개
# set_property PACKAGE_PIN ?? [get_ports {ram_data[0]}]      ... ram_data[15:0] 16개

set_property IOSTANDARD LVCMOS33 [get_ports *]
