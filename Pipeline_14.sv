// Generated by CIRCT unknown git version
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_MEM_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module Pipeline_14(
  input         clock,
                reset,
                io_in_valid,
  input  [6:0]  io_in_bits_cmd_inst_funct,
  input  [63:0] io_in_bits_cmd_rs1,
                io_in_bits_cmd_rs2,
  input  [67:0] io_in_bits_dram_addr,
                io_in_bits_spad_addr,
  input  [64:0] io_in_bits_pool_dram_addr,
  input  [65:0] io_in_bits_pool_spad_addr,
  input  [15:0] io_in_bits_channels,
  input         io_in_bits_is_pool,
  input  [15:0] io_in_bits_I,
                io_in_bits_J,
  input         io_out_ready,
  output        io_in_ready,
                io_out_valid,
  output [6:0]  io_out_bits_cmd_inst_funct,
  output [4:0]  io_out_bits_cmd_inst_rs2,
                io_out_bits_cmd_inst_rs1,
  output        io_out_bits_cmd_inst_xd,
                io_out_bits_cmd_inst_xs1,
                io_out_bits_cmd_inst_xs2,
  output [4:0]  io_out_bits_cmd_inst_rd,
  output [6:0]  io_out_bits_cmd_inst_opcode,
  output [63:0] io_out_bits_cmd_rs1,
                io_out_bits_cmd_rs2,
  output [67:0] io_out_bits_dram_addr,
                io_out_bits_spad_addr,
  output [64:0] io_out_bits_pool_dram_addr,
  output [65:0] io_out_bits_pool_spad_addr,
  output [15:0] io_out_bits_channels,
  output        io_out_bits_is_pool,
  output [15:0] io_out_bits_I,
                io_out_bits_J,
  output        io_busy
);

  reg  [6:0]  stages_0_cmd_inst_funct;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_0_cmd_inst_rs2;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_0_cmd_inst_rs1;	// @[Pipeline.scala:21:21]
  reg         stages_0_cmd_inst_xd;	// @[Pipeline.scala:21:21]
  reg         stages_0_cmd_inst_xs1;	// @[Pipeline.scala:21:21]
  reg         stages_0_cmd_inst_xs2;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_0_cmd_inst_rd;	// @[Pipeline.scala:21:21]
  reg  [6:0]  stages_0_cmd_inst_opcode;	// @[Pipeline.scala:21:21]
  reg  [63:0] stages_0_cmd_rs1;	// @[Pipeline.scala:21:21]
  reg  [63:0] stages_0_cmd_rs2;	// @[Pipeline.scala:21:21]
  reg  [67:0] stages_0_dram_addr;	// @[Pipeline.scala:21:21]
  reg  [67:0] stages_0_spad_addr;	// @[Pipeline.scala:21:21]
  reg  [64:0] stages_0_pool_dram_addr;	// @[Pipeline.scala:21:21]
  reg  [65:0] stages_0_pool_spad_addr;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_0_channels;	// @[Pipeline.scala:21:21]
  reg         stages_0_is_pool;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_0_I;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_0_J;	// @[Pipeline.scala:21:21]
  reg  [6:0]  stages_1_cmd_inst_funct;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_1_cmd_inst_rs2;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_1_cmd_inst_rs1;	// @[Pipeline.scala:21:21]
  reg         stages_1_cmd_inst_xd;	// @[Pipeline.scala:21:21]
  reg         stages_1_cmd_inst_xs1;	// @[Pipeline.scala:21:21]
  reg         stages_1_cmd_inst_xs2;	// @[Pipeline.scala:21:21]
  reg  [4:0]  stages_1_cmd_inst_rd;	// @[Pipeline.scala:21:21]
  reg  [6:0]  stages_1_cmd_inst_opcode;	// @[Pipeline.scala:21:21]
  reg  [63:0] stages_1_cmd_rs1;	// @[Pipeline.scala:21:21]
  reg  [63:0] stages_1_cmd_rs2;	// @[Pipeline.scala:21:21]
  reg  [67:0] stages_1_dram_addr;	// @[Pipeline.scala:21:21]
  reg  [67:0] stages_1_spad_addr;	// @[Pipeline.scala:21:21]
  reg  [64:0] stages_1_pool_dram_addr;	// @[Pipeline.scala:21:21]
  reg  [65:0] stages_1_pool_spad_addr;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_1_channels;	// @[Pipeline.scala:21:21]
  reg         stages_1_is_pool;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_1_I;	// @[Pipeline.scala:21:21]
  reg  [15:0] stages_1_J;	// @[Pipeline.scala:21:21]
  reg         valids_0;	// @[Pipeline.scala:22:25]
  reg         valids_1;	// @[Pipeline.scala:22:25]
  wire        stalling_1 = valids_1 & ~io_out_ready;	// @[Pipeline.scala:22:25, :28:{34,37}]
  wire        stalling_0 = valids_0 & stalling_1;	// @[Pipeline.scala:22:25, :28:34, :30:16]
  wire        _T_2 = ~stalling_0 & io_in_valid;	// @[Decoupled.scala:51:35, Pipeline.scala:27:20, :30:16]
  always @(posedge clock) begin
    if (_T_2) begin	// @[Decoupled.scala:51:35]
      stages_0_cmd_inst_funct <= io_in_bits_cmd_inst_funct;	// @[Pipeline.scala:21:21]
      stages_0_cmd_inst_rs2 <= 5'h0;	// @[Pipeline.scala:21:21]
      stages_0_cmd_inst_rs1 <= 5'h0;	// @[Pipeline.scala:21:21]
      stages_0_cmd_inst_rd <= 5'h0;	// @[Pipeline.scala:21:21]
      stages_0_cmd_inst_opcode <= 7'h0;	// @[Pipeline.scala:21:21]
      stages_0_cmd_rs1 <= io_in_bits_cmd_rs1;	// @[Pipeline.scala:21:21]
      stages_0_cmd_rs2 <= io_in_bits_cmd_rs2;	// @[Pipeline.scala:21:21]
      stages_0_dram_addr <= io_in_bits_dram_addr;	// @[Pipeline.scala:21:21]
      stages_0_spad_addr <= io_in_bits_spad_addr;	// @[Pipeline.scala:21:21]
      stages_0_pool_dram_addr <= io_in_bits_pool_dram_addr;	// @[Pipeline.scala:21:21]
      stages_0_pool_spad_addr <= io_in_bits_pool_spad_addr;	// @[Pipeline.scala:21:21]
      stages_0_channels <= io_in_bits_channels;	// @[Pipeline.scala:21:21]
      stages_0_is_pool <= io_in_bits_is_pool;	// @[Pipeline.scala:21:21]
      stages_0_I <= io_in_bits_I;	// @[Pipeline.scala:21:21]
      stages_0_J <= io_in_bits_J;	// @[Pipeline.scala:21:21]
    end
    stages_0_cmd_inst_xd <= ~_T_2 & stages_0_cmd_inst_xd;	// @[Decoupled.scala:51:35, Pipeline.scala:21:21, :55:22, :56:19]
    stages_0_cmd_inst_xs1 <= ~_T_2 & stages_0_cmd_inst_xs1;	// @[Decoupled.scala:51:35, Pipeline.scala:21:21, :55:22, :56:19]
    stages_0_cmd_inst_xs2 <= ~_T_2 & stages_0_cmd_inst_xs2;	// @[Decoupled.scala:51:35, Pipeline.scala:21:21, :55:22, :56:19]
    if (~stalling_1) begin	// @[Pipeline.scala:28:34]
      stages_1_cmd_inst_funct <= stages_0_cmd_inst_funct;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_rs2 <= stages_0_cmd_inst_rs2;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_rs1 <= stages_0_cmd_inst_rs1;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_xd <= stages_0_cmd_inst_xd;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_xs1 <= stages_0_cmd_inst_xs1;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_xs2 <= stages_0_cmd_inst_xs2;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_rd <= stages_0_cmd_inst_rd;	// @[Pipeline.scala:21:21]
      stages_1_cmd_inst_opcode <= stages_0_cmd_inst_opcode;	// @[Pipeline.scala:21:21]
      stages_1_cmd_rs1 <= stages_0_cmd_rs1;	// @[Pipeline.scala:21:21]
      stages_1_cmd_rs2 <= stages_0_cmd_rs2;	// @[Pipeline.scala:21:21]
      stages_1_dram_addr <= stages_0_dram_addr;	// @[Pipeline.scala:21:21]
      stages_1_spad_addr <= stages_0_spad_addr;	// @[Pipeline.scala:21:21]
      stages_1_pool_dram_addr <= stages_0_pool_dram_addr;	// @[Pipeline.scala:21:21]
      stages_1_pool_spad_addr <= stages_0_pool_spad_addr;	// @[Pipeline.scala:21:21]
      stages_1_channels <= stages_0_channels;	// @[Pipeline.scala:21:21]
      stages_1_is_pool <= stages_0_is_pool;	// @[Pipeline.scala:21:21]
      stages_1_I <= stages_0_I;	// @[Pipeline.scala:21:21]
      stages_1_J <= stages_0_J;	// @[Pipeline.scala:21:21]
    end
    if (reset) begin
      valids_0 <= 1'h0;	// @[Pipeline.scala:22:25]
      valids_1 <= 1'h0;	// @[Pipeline.scala:22:25]
    end
    else begin
      valids_0 <= _T_2 | stalling_1 & valids_0;	// @[Decoupled.scala:51:35, Pipeline.scala:22:25, :28:34, :40:17, :41:12, :45:22, :46:19]
      valids_1 <= valids_0 | ~io_out_ready & valids_1;	// @[Pipeline.scala:22:25, :36:24, :37:19, :49:16, :50:12]
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM_0;
    logic [31:0] _RANDOM_1;
    logic [31:0] _RANDOM_2;
    logic [31:0] _RANDOM_3;
    logic [31:0] _RANDOM_4;
    logic [31:0] _RANDOM_5;
    logic [31:0] _RANDOM_6;
    logic [31:0] _RANDOM_7;
    logic [31:0] _RANDOM_8;
    logic [31:0] _RANDOM_9;
    logic [31:0] _RANDOM_10;
    logic [31:0] _RANDOM_11;
    logic [31:0] _RANDOM_12;
    logic [31:0] _RANDOM_13;
    logic [31:0] _RANDOM_14;
    logic [31:0] _RANDOM_15;
    logic [31:0] _RANDOM_16;
    logic [31:0] _RANDOM_17;
    logic [31:0] _RANDOM_18;
    logic [31:0] _RANDOM_19;
    logic [31:0] _RANDOM_20;
    logic [31:0] _RANDOM_21;
    logic [31:0] _RANDOM_22;
    logic [31:0] _RANDOM_23;
    logic [31:0] _RANDOM_24;
    logic [31:0] _RANDOM_25;
    logic [31:0] _RANDOM_26;
    logic [31:0] _RANDOM_27;
    logic [31:0] _RANDOM_28;
    logic [31:0] _RANDOM_29;
    logic [31:0] _RANDOM_30;
    logic [31:0] _RANDOM_31;
    logic [31:0] _RANDOM_32;
    logic [31:0] _RANDOM_33;
    logic [31:0] _RANDOM_34;
    logic [31:0] _RANDOM_35;
    logic [31:0] _RANDOM_36;
    initial begin
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        _RANDOM_1 = `RANDOM;
        _RANDOM_2 = `RANDOM;
        _RANDOM_3 = `RANDOM;
        _RANDOM_4 = `RANDOM;
        _RANDOM_5 = `RANDOM;
        _RANDOM_6 = `RANDOM;
        _RANDOM_7 = `RANDOM;
        _RANDOM_8 = `RANDOM;
        _RANDOM_9 = `RANDOM;
        _RANDOM_10 = `RANDOM;
        _RANDOM_11 = `RANDOM;
        _RANDOM_12 = `RANDOM;
        _RANDOM_13 = `RANDOM;
        _RANDOM_14 = `RANDOM;
        _RANDOM_15 = `RANDOM;
        _RANDOM_16 = `RANDOM;
        _RANDOM_17 = `RANDOM;
        _RANDOM_18 = `RANDOM;
        _RANDOM_19 = `RANDOM;
        _RANDOM_20 = `RANDOM;
        _RANDOM_21 = `RANDOM;
        _RANDOM_22 = `RANDOM;
        _RANDOM_23 = `RANDOM;
        _RANDOM_24 = `RANDOM;
        _RANDOM_25 = `RANDOM;
        _RANDOM_26 = `RANDOM;
        _RANDOM_27 = `RANDOM;
        _RANDOM_28 = `RANDOM;
        _RANDOM_29 = `RANDOM;
        _RANDOM_30 = `RANDOM;
        _RANDOM_31 = `RANDOM;
        _RANDOM_32 = `RANDOM;
        _RANDOM_33 = `RANDOM;
        _RANDOM_34 = `RANDOM;
        _RANDOM_35 = `RANDOM;
        _RANDOM_36 = `RANDOM;
        stages_0_cmd_inst_funct = _RANDOM_0[6:0];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_rs2 = _RANDOM_0[11:7];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_rs1 = _RANDOM_0[16:12];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_xd = _RANDOM_0[17];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_xs1 = _RANDOM_0[18];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_xs2 = _RANDOM_0[19];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_rd = _RANDOM_0[24:20];	// @[Pipeline.scala:21:21]
        stages_0_cmd_inst_opcode = _RANDOM_0[31:25];	// @[Pipeline.scala:21:21]
        stages_0_cmd_rs1 = {_RANDOM_1, _RANDOM_2};	// @[Pipeline.scala:21:21]
        stages_0_cmd_rs2 = {_RANDOM_3, _RANDOM_4};	// @[Pipeline.scala:21:21]
        stages_0_dram_addr = {_RANDOM_8[31:9], _RANDOM_9, _RANDOM_10[12:0]};	// @[Pipeline.scala:21:21]
        stages_0_spad_addr = {_RANDOM_10[31:13], _RANDOM_11, _RANDOM_12[16:0]};	// @[Pipeline.scala:21:21]
        stages_0_pool_dram_addr = {_RANDOM_12[31:17], _RANDOM_13, _RANDOM_14[17:0]};	// @[Pipeline.scala:21:21]
        stages_0_pool_spad_addr = {_RANDOM_14[31:18], _RANDOM_15, _RANDOM_16[19:0]};	// @[Pipeline.scala:21:21]
        stages_0_channels = {_RANDOM_16[31:20], _RANDOM_17[3:0]};	// @[Pipeline.scala:21:21]
        stages_0_is_pool = _RANDOM_17[4];	// @[Pipeline.scala:21:21]
        stages_0_I = _RANDOM_17[20:5];	// @[Pipeline.scala:21:21]
        stages_0_J = {_RANDOM_17[31:21], _RANDOM_18[4:0]};	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_funct = _RANDOM_18[11:5];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_rs2 = _RANDOM_18[16:12];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_rs1 = _RANDOM_18[21:17];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_xd = _RANDOM_18[22];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_xs1 = _RANDOM_18[23];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_xs2 = _RANDOM_18[24];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_rd = _RANDOM_18[29:25];	// @[Pipeline.scala:21:21]
        stages_1_cmd_inst_opcode = {_RANDOM_18[31:30], _RANDOM_19[4:0]};	// @[Pipeline.scala:21:21]
        stages_1_cmd_rs1 = {_RANDOM_19[31:5], _RANDOM_20, _RANDOM_21[4:0]};	// @[Pipeline.scala:21:21]
        stages_1_cmd_rs2 = {_RANDOM_21[31:5], _RANDOM_22, _RANDOM_23[4:0]};	// @[Pipeline.scala:21:21]
        stages_1_dram_addr = {_RANDOM_26[31:14], _RANDOM_27, _RANDOM_28[17:0]};	// @[Pipeline.scala:21:21]
        stages_1_spad_addr = {_RANDOM_28[31:18], _RANDOM_29, _RANDOM_30[21:0]};	// @[Pipeline.scala:21:21]
        stages_1_pool_dram_addr = {_RANDOM_30[31:22], _RANDOM_31, _RANDOM_32[22:0]};	// @[Pipeline.scala:21:21]
        stages_1_pool_spad_addr = {_RANDOM_32[31:23], _RANDOM_33, _RANDOM_34[24:0]};	// @[Pipeline.scala:21:21]
        stages_1_channels = {_RANDOM_34[31:25], _RANDOM_35[8:0]};	// @[Pipeline.scala:21:21]
        stages_1_is_pool = _RANDOM_35[9];	// @[Pipeline.scala:21:21]
        stages_1_I = _RANDOM_35[25:10];	// @[Pipeline.scala:21:21]
        stages_1_J = {_RANDOM_35[31:26], _RANDOM_36[9:0]};	// @[Pipeline.scala:21:21]
        valids_0 = _RANDOM_36[10];	// @[Pipeline.scala:21:21, :22:25]
        valids_1 = _RANDOM_36[11];	// @[Pipeline.scala:21:21, :22:25]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign io_in_ready = ~stalling_0;	// @[Pipeline.scala:27:20, :30:16]
  assign io_out_valid = valids_1;	// @[Pipeline.scala:22:25]
  assign io_out_bits_cmd_inst_funct = stages_1_cmd_inst_funct;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_rs2 = stages_1_cmd_inst_rs2;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_rs1 = stages_1_cmd_inst_rs1;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_xd = stages_1_cmd_inst_xd;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_xs1 = stages_1_cmd_inst_xs1;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_xs2 = stages_1_cmd_inst_xs2;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_rd = stages_1_cmd_inst_rd;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_inst_opcode = stages_1_cmd_inst_opcode;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_rs1 = stages_1_cmd_rs1;	// @[Pipeline.scala:21:21]
  assign io_out_bits_cmd_rs2 = stages_1_cmd_rs2;	// @[Pipeline.scala:21:21]
  assign io_out_bits_dram_addr = stages_1_dram_addr;	// @[Pipeline.scala:21:21]
  assign io_out_bits_spad_addr = stages_1_spad_addr;	// @[Pipeline.scala:21:21]
  assign io_out_bits_pool_dram_addr = stages_1_pool_dram_addr;	// @[Pipeline.scala:21:21]
  assign io_out_bits_pool_spad_addr = stages_1_pool_spad_addr;	// @[Pipeline.scala:21:21]
  assign io_out_bits_channels = stages_1_channels;	// @[Pipeline.scala:21:21]
  assign io_out_bits_is_pool = stages_1_is_pool;	// @[Pipeline.scala:21:21]
  assign io_out_bits_I = stages_1_I;	// @[Pipeline.scala:21:21]
  assign io_out_bits_J = stages_1_J;	// @[Pipeline.scala:21:21]
  assign io_busy = io_in_valid | valids_0 | valids_1;	// @[Pipeline.scala:22:25, :24:28]
endmodule
