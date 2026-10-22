# lab6_FPGA_STM32_2

전자전기컴퓨터설계실험Ⅱ STM32_2 주차 FPGA 교재 실습: 서보모터 제어(`servo_ctrl`), SRAM 읽기·쓰기(`sram`), DAC(`dac`)와 STM32_2 과제6·7의 FPGA 쪽 UART 수신 회로(`uart_cmd`).

- 코드 출처: [Glaysia/ece2_474 `docs/FPGA_additional.md`](https://github.com/Glaysia/ece2_474/blob/main/docs/FPGA_additional.md) 5·6·8번 실습 (TB에 파형 저장만 추가). `uart_cmd`는 Lab3 UART 에코의 `uart_rx`/`uart_tx`를 재사용해 작성.
- 실험 전 레포트: [reports/pre/01_servo_sram_dac.md](reports/pre/01_servo_sram_dac.md)
- 시뮬레이션 로그·파형: [evidence/vscode/](evidence/vscode/)
- MCU 쪽 과제 코드: [yuminsang0815/stm32_lab `evidence/STM32_2`](https://github.com/yuminsang0815/stm32_lab/tree/main/evidence/STM32_2)

## 시뮬레이션 실행 (Icarus Verilog + GTKWave)

VS Code: `Ctrl+Shift+P` → `Tasks: Run Task` → `SIM: ...`

```
.\run_sim.bat servo_ctrl wave
.\run_sim.bat sram wave
.\run_sim.bat dac wave
.\run_sim.bat uart_cmd wave
```

파형 캡처 다시 만들기: `powershell -ExecutionPolicy Bypass -File .\capture_wave.ps1`

## Vivado (시뮬레이션 → 합성 → 구현 → 비트스트림)

```
vivado -mode batch -source tools/vivado_build.tcl -tclargs uart_cmd
```

| 설계 | 보드 최상위 | 핀 제약 | 상태 |
|---|---|---|---|
| uart_cmd | `uart_cmd` | [uart_cmd.xdc](constraints/uart_cmd.xdc) | 비트스트림 생성 완료 |
| servo_ctrl | `servo_board` (버튼 디바운스 포함) | [servo_ctrl.xdc](constraints/servo_ctrl.xdc) | 서보 출력 핀 확인 후 빌드 |
| sram | `sram` | [sram.xdc](constraints/sram.xdc) | SRAM 버스 핀 확인 후 빌드 |
| dac | `dac` | [dac.xdc](constraints/dac.xdc) | DAC 핀 확인 후 빌드 |

servo·sram·dac XDC의 `TODO(실험실)` 줄에 교재 핀 구성표의 핀 번호를 넣고 주석을 해제한 뒤 같은 명령(`-tclargs servo_ctrl` 등)으로 빌드한다. 결과 프로젝트 `vivado/<설계>/<설계>.xpr`를 열고 Open Hardware Manager → Program Device로 `vivado/<설계>/<설계>.runs/impl_1/<최상위>.bit`를 다운로드한다.
