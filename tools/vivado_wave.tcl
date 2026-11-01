# Vivado Simulator(XSim) GUI에서 테스트벤치를 끝까지 실행하고 파형을 표시합니다 (캡처용).
# xsim tb_behav -gui -tclbatch vivado_wave.tcl 로 실행하며, 설계 이름은 환경 변수 WAVE_NAME으로 받습니다.
set name $::env(WAVE_NAME)
switch $name {
    servo_ctrl { add_wave {/tb/clk} {/tb/rst} {/tb/l} {/tb/r} {/tb/us} {/tb/pwm_dut/width_cycles} {/tb/pwm_dut/count} {/tb/servo} }
    sram       { add_wave {/tb/wr} {/tb/rd} {/tb/address} {/tb/data_in} {/tb/cs_n} {/tb/oe_n} {/tb/we_n} {/tb/ram_address} {/tb/bus} {/tb/led} }
    dac        { add_wave {/tb/clk} {/tb/rst} {/tb/channel} {/tb/dut/update} {/tb/we_n} {/tb/cs_n} {/tb/ldac_n} {/tb/a_b} {/tb/data} {/tb/led} }
    uart_cmd   { add_wave {/tb/clk} {/tb/rst} {/tb/mcu_tx} {/tb/dut/rx_valid} {/tb/dut/rx_data} {/tb/pc_rx} {/tb/led} {/tb/low7} }
}
# $finish 직전까지만 실행해 소스 창 대신 파형 창이 앞에 남게 한다
switch $name { servo_ctrl { run 100035ns } sram { run 163ns } dac { run 10435ns } uart_cmd { run 12795ns } }
foreach w [get_waves *] { catch { set_property radix unsigned $w } }
foreach w {bus rx_data low7} { catch { set_property radix hex [get_waves $w] } }
