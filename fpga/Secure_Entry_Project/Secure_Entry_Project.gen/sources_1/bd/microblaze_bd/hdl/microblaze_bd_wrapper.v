//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Fri Aug 15 22:24:04 2025
//Host        : DESKTOP-CA88SD5 running 64-bit major release  (build 9200)
//Command     : generate_target microblaze_bd_wrapper.bd
//Design      : microblaze_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module microblaze_bd_wrapper
   (Clk,
    gpio_rtl_0_tri_i,
    reset,
    usb_uart_rxd,
    usb_uart_txd);
  input Clk;
  input [11:0]gpio_rtl_0_tri_i;
  input reset;
  input usb_uart_rxd;
  output usb_uart_txd;

  wire Clk;
  wire [11:0]gpio_rtl_0_tri_i;
  wire reset;
  wire usb_uart_rxd;
  wire usb_uart_txd;

  microblaze_bd microblaze_bd_i
       (.Clk(Clk),
        .gpio_rtl_0_tri_i(gpio_rtl_0_tri_i),
        .reset(reset),
        .usb_uart_rxd(usb_uart_rxd),
        .usb_uart_txd(usb_uart_txd));
endmodule
