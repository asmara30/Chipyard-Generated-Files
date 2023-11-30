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

module LoopConvLdInput(
  input         clock,
                reset,
                io_req_valid,
  input  [15:0] io_req_bits_outer_bounds_batch_size,
                io_req_bits_outer_bounds_in_dim,
                io_req_bits_outer_bounds_in_channels,
                io_req_bits_inner_bounds_batches,
                io_req_bits_inner_bounds_lpad,
                io_req_bits_inner_bounds_rpad,
                io_req_bits_inner_bounds_upad,
                io_req_bits_inner_bounds_dpad,
                io_req_bits_derived_params_irows,
                io_req_bits_derived_params_icols,
                io_req_bits_derived_params_irows_unpadded,
                io_req_bits_derived_params_icols_unpadded,
                io_req_bits_derived_params_ichs,
                io_req_bits_derived_params_input_spad_stride,
  input  [13:0] io_req_bits_addr_start,
  input  [39:0] io_req_bits_dram_addr,
  input         io_req_bits_downsample,
  input  [15:0] io_req_bits_max_pixels_per_row,
  input         io_req_bits_input_dilated,
                io_req_bits_trans_input_3120,
                io_req_bits_loop_id,
                io_cmd_ready,
                io_rob_overloaded,
                io_wait_for_prev_loop,
  output        io_req_ready,
                io_cmd_valid,
  output [6:0]  io_cmd_bits_inst_funct,
  output [4:0]  io_cmd_bits_inst_rs2,
                io_cmd_bits_inst_rs1,
  output        io_cmd_bits_inst_xd,
                io_cmd_bits_inst_xs1,
                io_cmd_bits_inst_xs2,
  output [4:0]  io_cmd_bits_inst_rd,
  output [6:0]  io_cmd_bits_inst_opcode,
  output [63:0] io_cmd_bits_rs1,
                io_cmd_bits_rs2,
  output        io_idle,
                io_loop_id
);

  wire        _command_p_io_in_ready;	// @[LoopConv.scala:307:25]
  wire        _command_p_io_out_valid;	// @[LoopConv.scala:307:25]
  wire [6:0]  _command_p_io_out_bits_cmd_inst_funct;	// @[LoopConv.scala:307:25]
  wire [63:0] _command_p_io_out_bits_cmd_rs1;	// @[LoopConv.scala:307:25]
  wire [63:0] _command_p_io_out_bits_cmd_rs2;	// @[LoopConv.scala:307:25]
  wire [67:0] _command_p_io_out_bits_dram_addr;	// @[LoopConv.scala:307:25]
  wire [50:0] _command_p_io_out_bits_spad_addr;	// @[LoopConv.scala:307:25]
  wire [19:0] _command_p_io_out_bits_I;	// @[LoopConv.scala:307:25]
  wire [17:0] _command_p_io_out_bits_K;	// @[LoopConv.scala:307:25]
  wire        _command_p_io_busy;	// @[LoopConv.scala:307:25]
  reg  [1:0]  state;	// @[LoopConv.scala:250:22]
  reg  [15:0] req_outer_bounds_batch_size;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_outer_bounds_in_dim;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_outer_bounds_in_channels;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_inner_bounds_batches;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_inner_bounds_lpad;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_inner_bounds_rpad;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_inner_bounds_upad;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_inner_bounds_dpad;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_irows;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_icols;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_irows_unpadded;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_icols_unpadded;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_ichs;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_derived_params_input_spad_stride;	// @[LoopConv.scala:252:16]
  reg  [13:0] req_addr_start;	// @[LoopConv.scala:252:16]
  reg  [39:0] req_dram_addr;	// @[LoopConv.scala:252:16]
  reg         req_downsample;	// @[LoopConv.scala:252:16]
  reg  [15:0] req_max_pixels_per_row;	// @[LoopConv.scala:252:16]
  reg         req_input_dilated;	// @[LoopConv.scala:252:16]
  reg         req_trans_input_3120;	// @[LoopConv.scala:252:16]
  reg         req_loop_id;	// @[LoopConv.scala:252:16]
  wire [15:0] _GEN = req_trans_input_3120 ? (req_inner_bounds_batches < 16'h40 ? req_inner_bounds_batches : 16'h40) : req_derived_params_ichs < 16'h40 ? req_derived_params_ichs : 16'h40;	// @[LoopConv.scala:252:16, :260:{30,36}, :261:{33,42}, :262:29]
  reg  [15:0] b;	// @[LoopConv.scala:265:14]
  reg  [15:0] irow;	// @[LoopConv.scala:266:17]
  reg  [15:0] icol;	// @[LoopConv.scala:267:17]
  reg  [15:0] ich;	// @[LoopConv.scala:268:16]
  wire [16:0] _GEN_0 = {16'h0, req_input_dilated};	// @[LoopConv.scala:252:16, :257:37, :387:7]
  wire [16:0] _state_T_1 = {1'h0, req_inner_bounds_upad} + _GEN_0;	// @[LoopConv.scala:250:22, :252:16, :257:37]
  wire [18:0] _GEN_1 = {{3{irow[15]}}, irow};	// @[LoopConv.scala:266:17, :271:26]
  wire [16:0] _state_T_7 = {1'h0, req_inner_bounds_lpad} + _GEN_0;	// @[LoopConv.scala:250:22, :252:16, :257:37]
  wire [16:0] _GEN_2 = {irow[15], irow};	// @[LoopConv.scala:266:17, :271:26, :273:37]
  wire        _I_T_6 = $signed(icol) < 16'sh0;	// @[LoopConv.scala:267:17, :273:68, :387:7]
  wire [16:0] _I_T_20 = {1'h0, req_derived_params_icols_unpadded};	// @[LoopConv.scala:250:22, :252:16, :273:100]
  wire [16:0] _GEN_3 = {icol[15], icol};	// @[LoopConv.scala:267:17, :272:26, :273:82]
  wire [15:0] _GEN_4 = {16{ich[15]}};	// @[LoopConv.scala:268:16, :278:54]
  wire [31:0] _GEN_5 = {_GEN_4, ich};	// @[LoopConv.scala:268:16, :278:54]
  wire [31:0] _GEN_6 = {16'h0, req_outer_bounds_in_dim};	// @[LoopConv.scala:252:16, :278:54, :387:7]
  wire [31:0] _dram_offset_T_2 = _GEN_5 * _GEN_6;	// @[LoopConv.scala:278:54]
  wire [47:0] _GEN_7 = {32'h0, req_outer_bounds_in_dim};	// @[LoopConv.scala:252:16, :278:63]
  wire [47:0] _dram_offset_T_6 = {{16{_dram_offset_T_2[31]}}, _dram_offset_T_2} * _GEN_7;	// @[LoopConv.scala:278:{54,63}]
  wire [31:0] _GEN_8 = {{16{irow[15]}}, irow};	// @[LoopConv.scala:266:17, :271:26, :278:79]
  wire [31:0] _dram_offset_T_10 = _GEN_8 * _GEN_6;	// @[LoopConv.scala:278:{54,79}]
  wire [48:0] _dram_offset_T_12 = {_dram_offset_T_6[47], _dram_offset_T_6} + {{17{_dram_offset_T_10[31]}}, _dram_offset_T_10};	// @[LoopConv.scala:278:{63,72,79}]
  wire [49:0] _GEN_9 = {{34{icol[15]}}, icol};	// @[LoopConv.scala:267:17, :272:26, :278:87]
  wire [49:0] _dram_offset_T_13 = {_dram_offset_T_12[48], _dram_offset_T_12} + _GEN_9;	// @[LoopConv.scala:278:{72,87}]
  wire [65:0] _dram_offset_T_16 = {{16{_dram_offset_T_13[49]}}, _dram_offset_T_13} * {50'h0, req_inner_bounds_batches};	// @[LoopConv.scala:252:16, :278:{87,96}]
  wire [66:0] _dram_offset_T_18 = {_dram_offset_T_16[65], _dram_offset_T_16} + {{51{b[15]}}, b};	// @[LoopConv.scala:265:14, :278:{96,106}]
  wire [15:0] _GEN_10 = {16{b[15]}};	// @[LoopConv.scala:265:14, :278:106, :279:10]
  wire [31:0] _GEN_11 = {_GEN_10, b};	// @[LoopConv.scala:265:14, :279:10]
  wire [31:0] _dram_offset_T_26 = _GEN_11 * _GEN_6;	// @[LoopConv.scala:278:54, :279:10]
  wire [47:0] _dram_offset_T_30 = {{16{_dram_offset_T_26[31]}}, _dram_offset_T_26} * _GEN_7;	// @[LoopConv.scala:278:63, :279:{10,19}]
  wire [31:0] _dram_offset_T_34 = _GEN_8 * _GEN_6;	// @[LoopConv.scala:278:{54,79}, :279:35]
  wire [48:0] _dram_offset_T_36 = {_dram_offset_T_30[47], _dram_offset_T_30} + {{17{_dram_offset_T_34[31]}}, _dram_offset_T_34};	// @[LoopConv.scala:279:{19,28,35}]
  wire [49:0] _dram_offset_T_37 = {_dram_offset_T_36[48], _dram_offset_T_36} + _GEN_9;	// @[LoopConv.scala:278:87, :279:{28,43}]
  wire [65:0] _dram_offset_T_40 = {{16{_dram_offset_T_37[49]}}, _dram_offset_T_37} * {50'h0, req_outer_bounds_in_channels};	// @[LoopConv.scala:252:16, :278:96, :279:{43,52}]
  wire [66:0] _dram_offset_T_42 = {_dram_offset_T_40[65], _dram_offset_T_40} + {{51{ich[15]}}, ich};	// @[LoopConv.scala:268:16, :278:54, :279:{52,66}]
  wire [27:0] _GEN_12 = {12'h0, req_derived_params_input_spad_stride};	// @[LoopConv.scala:252:16, :283:54]
  wire [27:0] _spad_addr_T_4 = {_GEN_10, b[15:4]} * _GEN_12;	// @[LoopConv.scala:265:14, :279:10, :283:{31,54}]
  wire [28:0] _GEN_13 = {15'h0, req_addr_start};	// @[LoopConv.scala:252:16, :283:{25,90}]
  wire [28:0] _spad_addr_T_6 = _GEN_13 + {_spad_addr_T_4[27], _spad_addr_T_4};	// @[LoopConv.scala:283:{25,54}]
  wire [15:0] _GEN_14 = {15'h0, req_downsample};	// @[LoopConv.scala:252:16, :283:90]
  wire [31:0] _GEN_15 = {16'h0, req_derived_params_irows >> _GEN_14};	// @[LoopConv.scala:252:16, :283:{81,90}, :387:7]
  wire [31:0] _spad_addr_T_10 = _GEN_5 * _GEN_15;	// @[LoopConv.scala:278:54, :283:81]
  wire [15:0] _spad_addr_T_46 = req_derived_params_icols >> _GEN_14;	// @[LoopConv.scala:252:16, :283:{90,118}]
  wire [47:0] _GEN_16 = {32'h0, _spad_addr_T_46};	// @[LoopConv.scala:278:63, :283:{109,118}]
  wire [47:0] _spad_addr_T_15 = {{16{_spad_addr_T_10[31]}}, _spad_addr_T_10} * _GEN_16;	// @[LoopConv.scala:283:{81,109}]
  wire [48:0] _spad_addr_T_17 = {{20{_spad_addr_T_6[28]}}, _spad_addr_T_6} + {_spad_addr_T_15[47], _spad_addr_T_15};	// @[LoopConv.scala:283:{25,74,109}]
  wire [18:0] _GEN_17 = {18'h0, req_downsample};	// @[LoopConv.scala:252:16, :283:153, Mux.scala:101:16]
  wire [18:0] _spad_addr_T_45 = $signed($signed(_GEN_1 + {2'h0, _state_T_1 >> _GEN_0}) >>> _GEN_17);	// @[LoopConv.scala:257:{37,59}, :271:26, :283:153, :310:14]
  wire [34:0] _GEN_18 = {{16{_spad_addr_T_45[18]}}, _spad_addr_T_45};	// @[LoopConv.scala:283:{153,172}]
  wire [34:0] _GEN_19 = {19'h0, _spad_addr_T_46};	// @[LoopConv.scala:283:{118,172}, :351:35]
  wire [34:0] _spad_addr_T_22 = _GEN_18 * _GEN_19;	// @[LoopConv.scala:283:172]
  wire [49:0] _spad_addr_T_24 = {_spad_addr_T_17[48], _spad_addr_T_17} + {{15{_spad_addr_T_22[34]}}, _spad_addr_T_22};	// @[LoopConv.scala:283:{74,137,172}]
  wire [18:0] _spad_addr_T_52 = $signed($signed({{3{icol[15]}}, icol} + {2'h0, _state_T_7 >> _GEN_0}) >>> _GEN_17);	// @[LoopConv.scala:257:{37,59}, :267:17, :272:26, :283:{153,216}, :310:14]
  wire [50:0] _GEN_20 = {{32{_spad_addr_T_52[18]}}, _spad_addr_T_52};	// @[LoopConv.scala:283:{200,216}]
  wire [27:0] _spad_addr_T_31 = {_GEN_4, ich[15:4]} * _GEN_12;	// @[LoopConv.scala:268:16, :278:54, :283:54, :284:{33,56}]
  wire [28:0] _spad_addr_T_33 = _GEN_13 + {_spad_addr_T_31[27], _spad_addr_T_31};	// @[LoopConv.scala:283:25, :284:{25,56}]
  wire [31:0] _spad_addr_T_37 = _GEN_11 * _GEN_15;	// @[LoopConv.scala:279:10, :283:81, :284:81]
  wire [47:0] _spad_addr_T_42 = {{16{_spad_addr_T_37[31]}}, _spad_addr_T_37} * _GEN_16;	// @[LoopConv.scala:283:109, :284:{81,109}]
  wire [48:0] _spad_addr_T_44 = {{20{_spad_addr_T_33[28]}}, _spad_addr_T_33} + {_spad_addr_T_42[47], _spad_addr_T_42};	// @[LoopConv.scala:284:{25,76,109}]
  wire [34:0] _spad_addr_T_49 = _GEN_18 * _GEN_19;	// @[LoopConv.scala:283:172, :284:172]
  wire [49:0] _spad_addr_T_51 = {_spad_addr_T_44[48], _spad_addr_T_44} + {{15{_spad_addr_T_49[34]}}, _spad_addr_T_49};	// @[LoopConv.scala:284:{76,137,172}]
  wire [17:0] _GEN_21 = {2'h0, req_derived_params_icols_unpadded};	// @[LoopConv.scala:252:16, :290:29, :310:14]
  wire [17:0] _GEN_22 = {{2{icol[15]}}, icol};	// @[LoopConv.scala:267:17, :272:26, :290:29]
  wire [17:0] _GEN_23 = {12'h0, 6'h10 << req_downsample};	// @[LoopConv.scala:252:16, :283:54, :287:46, :290:37]
  wire [17:0] _I_T_5 = $signed(_GEN_21 - _GEN_22) > $signed(_GEN_23) ? _GEN_23 : _GEN_21 - _GEN_22;	// @[LoopConv.scala:290:{8,29,37,107}]
  wire [16:0] _I_T_9 = 17'h0 - _GEN_3;	// @[LoopConv.scala:273:{23,82}, :292:31]
  wire [16:0] _I_T_10 = $signed(_I_T_9) > 17'sh10 ? 17'h10 : _I_T_9;	// @[LoopConv.scala:273:23, :292:{26,31,39}]
  wire [16:0] _next_icol_T_1 = {1'h0, req_inner_bounds_rpad} + _GEN_0;	// @[LoopConv.scala:250:22, :252:16, :257:37]
  wire [18:0] _GEN_24 = {3'h0, req_derived_params_icols_unpadded};	// @[LoopConv.scala:252:16, :293:64, :314:18]
  wire [18:0] _I_T_17 = _GEN_24 + {2'h0, _next_icol_T_1 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :293:64, :310:14]
  wire [19:0] _GEN_25 = {{4{icol[15]}}, icol};	// @[LoopConv.scala:267:17, :272:26, :293:88]
  wire [18:0] _I_T_24 = _GEN_24 + {2'h0, _next_icol_T_1 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :293:{64,146}, :310:14]
  wire [19:0] I = _I_T_6 ? {{3{_I_T_10[16]}}, _I_T_10} : $signed(_GEN_3) >= $signed(_I_T_20) ? ($signed({_I_T_17[18], _I_T_17} - _GEN_25) > 20'sh10 ? 20'h10 : {_I_T_24[18], _I_T_24} - _GEN_25) : {{2{_I_T_5[17]}}, _I_T_5};	// @[LoopConv.scala:273:{68,82,100}, :290:8, :292:26, :293:{13,43,64,88,96,146,170}, Mux.scala:101:16]
  wire [17:0] _GEN_26 = {2'h0, req_inner_bounds_batches};	// @[LoopConv.scala:252:16, :297:22, :310:14]
  wire [17:0] _GEN_27 = {{2{b[15]}}, b};	// @[LoopConv.scala:265:14, :278:106, :297:22]
  wire [17:0] _GEN_28 = {2'h0, _GEN};	// @[LoopConv.scala:262:29, :297:27, :310:14]
  wire [17:0] _GEN_29 = {2'h0, req_derived_params_ichs};	// @[LoopConv.scala:252:16, :298:19, :310:14]
  wire [17:0] _GEN_30 = {{2{ich[15]}}, ich};	// @[LoopConv.scala:268:16, :278:54, :298:19]
  wire        _io_idle_T = state == 2'h0;	// @[LoopConv.scala:250:22, :310:14, :332:25]
  wire        _io_req_ready_output = _io_idle_T & ~_command_p_io_busy;	// @[LoopConv.scala:307:25, :332:{25,34,37}]
  wire        _command_p_io_in_valid_T_2 = (|state) & ~io_wait_for_prev_loop;	// @[LoopConv.scala:250:22, :336:{34,43,46}]
  wire        _T_2 = state == 2'h1;	// @[LoopConv.scala:250:22, :278:112, :337:41]
  wire        _T = _command_p_io_out_bits_cmd_inst_funct == 7'h2;	// @[LoopConv.scala:307:25, :327:23, :346:46]
  wire [19:0] _mvin_cmd_rs2_num_rows_T = $signed($signed(_command_p_io_out_bits_I) >>> req_downsample);	// @[LoopConv.scala:252:16, :307:25, :351:35]
  wire [18:0] _state_T_10 = 19'h0 - {2'h0, _state_T_7 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :273:23, :310:14, :351:35, :378:98]
  wire [16:0] _GEN_31 = {16'h0, io_req_bits_input_dilated};	// @[LoopConv.scala:387:7, :388:52]
  wire [16:0] _irow_T_1 = {1'h0, io_req_bits_inner_bounds_upad} + _GEN_31 >> _GEN_31;	// @[LoopConv.scala:250:22, :388:{52,82}]
  wire [16:0] _icol_T_1 = {1'h0, io_req_bits_inner_bounds_lpad} + _GEN_31 >> _GEN_31;	// @[LoopConv.scala:250:22, :388:52, :389:{52,82}]
  wire [16:0] max_chs_per_mvin = {1'h0, _GEN};	// @[LoopConv.scala:250:22, :262:29]
  wire        _T_1 = _command_p_io_in_ready & _command_p_io_in_valid_T_2;	// @[Decoupled.scala:51:35, LoopConv.scala:307:25, :336:43]
  wire [16:0] b_it = req_trans_input_3120 ? max_chs_per_mvin : 17'h1;	// @[LoopConv.scala:252:16, :262:29, :362:21]
  wire [16:0] ich_it = req_trans_input_3120 ? 17'h1 : max_chs_per_mvin;	// @[LoopConv.scala:252:16, :262:29, :362:21, :363:23]
  wire [16:0] _next_ich_max_T_1 = {1'h0, req_derived_params_ichs} - 17'h1;	// @[LoopConv.scala:250:22, :252:16, :298:19, Util.scala:48:28]
  wire [17:0] next_ich = $signed({{3{ich[15]}}, ich} + {2'h0, ich_it}) > $signed({{2{_next_ich_max_T_1[16]}}, _next_ich_max_T_1}) ? 18'h0 : _GEN_30 + {1'h0, ich_it};	// @[LoopConv.scala:250:22, :268:16, :278:54, :298:19, :310:14, :363:23, Mux.scala:101:16, Util.scala:48:28, :50:15, :52:{11,22}]
  wire [18:0] _next_icol_T_8 = 19'h0 - {2'h0, _state_T_7 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :273:23, :310:14, :351:35, :366:94]
  wire [18:0] _next_icol_max_T_1 = {1'h0, _GEN_21 + {1'h0, _next_icol_T_1 >> _GEN_0}} - 19'h1;	// @[LoopConv.scala:250:22, :257:{37,59}, :290:29, :366:65, Util.scala:48:28]
  wire [20:0] _GEN_32 = {{5{icol[15]}}, icol};	// @[LoopConv.scala:267:17, :272:26, Util.scala:50:15]
  wire [20:0] next_icol = (|next_ich) ? _GEN_32 : $signed({{6{icol[15]}}, icol} + {2'h0, I}) > $signed({{3{_next_icol_max_T_1[18]}}, _next_icol_max_T_1}) ? {{2{_next_icol_T_8[18]}}, _next_icol_T_8} : _GEN_32 + {1'h0, I};	// @[LoopConv.scala:250:22, :267:17, :272:26, :273:23, :310:14, :366:94, :367:18, Mux.scala:101:16, Util.scala:48:28, :50:15, :52:{11,22}]
  wire [1:0]  _next_irow_T = 2'h1 << req_downsample;	// @[LoopConv.scala:252:16, :278:112, :368:43]
  wire [18:0] _next_irow_T_12 = 19'h0 - {2'h0, _state_T_7 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :273:23, :310:14, :351:35, :369:26]
  wire [15:0] _next_irow_T_18 = irow + {14'h0, _next_irow_T};	// @[LoopConv.scala:266:17, :368:43, Util.scala:50:15]
  wire [16:0] _next_irow_T_22 = _GEN_2 + {15'h0, _next_irow_T};	// @[LoopConv.scala:273:37, :283:90, :368:43, Util.scala:50:15, :52:11]
  wire [18:0] next_irow = next_icol == {{2{_next_irow_T_12[18]}}, _next_irow_T_12} & ~(|next_ich) ? ($signed({{2{_next_irow_T_22[16]}}, _next_irow_T_22}) > $signed({1'h0, {2'h0, req_derived_params_irows_unpadded} + {1'h0, {1'h0, req_inner_bounds_dpad} + _GEN_0 >> _GEN_0}} - 19'h1) ? 19'h0 - {2'h0, _state_T_1 >> _GEN_0} : {{3{_next_irow_T_18[15]}}, _next_irow_T_18}) : _GEN_1;	// @[LoopConv.scala:250:22, :252:16, :257:{37,59}, :271:26, :273:23, :310:14, :351:35, :367:18, :368:{78,107}, :369:{19,26,49}, Mux.scala:101:16, Util.scala:48:28, :50:15, :52:{11,22}]
  wire [18:0] _next_b_T_9 = 19'h0 - {2'h0, _state_T_7 >> _GEN_0};	// @[LoopConv.scala:257:{37,59}, :273:23, :310:14, :351:35, :371:69]
  wire [16:0] _next_b_max_T_1 = {1'h0, req_inner_bounds_batches} - 17'h1;	// @[LoopConv.scala:250:22, :252:16, :297:22, Util.scala:48:28]
  wire [17:0] next_b = next_irow == 19'h0 - {2'h0, _state_T_1 >> _GEN_0} & next_icol == {{2{_next_b_T_9[18]}}, _next_b_T_9} & ~(|next_ich) ? ($signed({{3{b[15]}}, b} + {2'h0, b_it}) > $signed({{2{_next_b_max_T_1[16]}}, _next_b_max_T_1}) ? 18'h0 : _GEN_27 + {1'h0, b_it}) : _GEN_27;	// @[LoopConv.scala:250:22, :257:{37,59}, :265:14, :273:23, :278:106, :297:22, :310:14, :351:35, :362:21, :367:18, :371:{19,26,62,69,92}, Mux.scala:101:16, Util.scala:48:28, :50:15, :52:{11,22}]
  wire        _T_3 = _io_req_ready_output & io_req_valid;	// @[Decoupled.scala:51:35, LoopConv.scala:332:34]
  always @(posedge clock) begin
    if (reset)
      state <= 2'h0;	// @[LoopConv.scala:250:22, :310:14]
    else if (_T_3)	// @[Decoupled.scala:51:35]
      state <= 2'h1;	// @[LoopConv.scala:250:22, :278:112]
    else if (_T_1) begin	// @[Decoupled.scala:51:35]
      if (_T_2)	// @[LoopConv.scala:337:41]
        state <= 2'h2;	// @[LoopConv.scala:250:22, :327:23]
      else	// @[LoopConv.scala:337:41]
        state <= {~(next_b == 18'h0 & next_irow == 19'h0 - {2'h0, _state_T_1 >> _GEN_0} & next_icol == {{2{_state_T_10[18]}}, _state_T_10} & ~(|next_ich)), 1'h0};	// @[LoopConv.scala:250:22, :257:{37,59}, :273:23, :310:14, :351:35, :367:18, :378:{19,27,48,55,91,98,121}, Mux.scala:101:16]
    end
    if (_T_3) begin	// @[Decoupled.scala:51:35]
      req_outer_bounds_batch_size <= io_req_bits_outer_bounds_batch_size;	// @[LoopConv.scala:252:16]
      req_outer_bounds_in_dim <= io_req_bits_outer_bounds_in_dim;	// @[LoopConv.scala:252:16]
      req_outer_bounds_in_channels <= io_req_bits_outer_bounds_in_channels;	// @[LoopConv.scala:252:16]
      req_inner_bounds_batches <= io_req_bits_inner_bounds_batches;	// @[LoopConv.scala:252:16]
      req_inner_bounds_lpad <= io_req_bits_inner_bounds_lpad;	// @[LoopConv.scala:252:16]
      req_inner_bounds_rpad <= io_req_bits_inner_bounds_rpad;	// @[LoopConv.scala:252:16]
      req_inner_bounds_upad <= io_req_bits_inner_bounds_upad;	// @[LoopConv.scala:252:16]
      req_inner_bounds_dpad <= io_req_bits_inner_bounds_dpad;	// @[LoopConv.scala:252:16]
      req_derived_params_irows <= io_req_bits_derived_params_irows;	// @[LoopConv.scala:252:16]
      req_derived_params_icols <= io_req_bits_derived_params_icols;	// @[LoopConv.scala:252:16]
      req_derived_params_irows_unpadded <= io_req_bits_derived_params_irows_unpadded;	// @[LoopConv.scala:252:16]
      req_derived_params_icols_unpadded <= io_req_bits_derived_params_icols_unpadded;	// @[LoopConv.scala:252:16]
      req_derived_params_ichs <= io_req_bits_derived_params_ichs;	// @[LoopConv.scala:252:16]
      req_derived_params_input_spad_stride <= io_req_bits_derived_params_input_spad_stride;	// @[LoopConv.scala:252:16]
      req_addr_start <= io_req_bits_addr_start;	// @[LoopConv.scala:252:16]
      req_dram_addr <= io_req_bits_dram_addr;	// @[LoopConv.scala:252:16]
      req_downsample <= io_req_bits_downsample;	// @[LoopConv.scala:252:16]
      req_max_pixels_per_row <= io_req_bits_max_pixels_per_row;	// @[LoopConv.scala:252:16]
      req_input_dilated <= io_req_bits_input_dilated;	// @[LoopConv.scala:252:16]
      req_trans_input_3120 <= io_req_bits_trans_input_3120;	// @[LoopConv.scala:252:16]
      req_loop_id <= io_req_bits_loop_id;	// @[LoopConv.scala:252:16]
      b <= 16'h0;	// @[LoopConv.scala:265:14, :387:7]
      irow <= 16'h0 - _irow_T_1[15:0];	// @[LoopConv.scala:266:17, :273:23, :387:7, :388:{17,82}]
      icol <= 16'h0 - _icol_T_1[15:0];	// @[LoopConv.scala:267:17, :273:23, :387:7, :389:{17,82}]
      ich <= 16'h0;	// @[LoopConv.scala:268:16, :387:7]
    end
    else if (~_T_1 | _T_2) begin	// @[Decoupled.scala:51:35, LoopConv.scala:268:16, :337:41, :358:30, :359:29]
    end
    else begin	// @[LoopConv.scala:268:16, :358:30, :359:29]
      b <= next_b[15:0];	// @[LoopConv.scala:265:14, :376:9, Mux.scala:101:16]
      irow <= next_irow[15:0];	// @[LoopConv.scala:266:17, :375:12, Mux.scala:101:16]
      icol <= next_icol[15:0];	// @[LoopConv.scala:267:17, :374:12, Mux.scala:101:16]
      ich <= next_ich[15:0];	// @[LoopConv.scala:268:16, :373:11, Mux.scala:101:16]
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
        state = _RANDOM_0[1:0];	// @[LoopConv.scala:250:22]
        req_outer_bounds_batch_size = _RANDOM_0[17:2];	// @[LoopConv.scala:250:22, :252:16]
        req_outer_bounds_in_dim = {_RANDOM_0[31:18], _RANDOM_1[1:0]};	// @[LoopConv.scala:250:22, :252:16]
        req_outer_bounds_in_channels = _RANDOM_1[17:2];	// @[LoopConv.scala:252:16]
        req_inner_bounds_batches = {_RANDOM_6[31:18], _RANDOM_7[1:0]};	// @[LoopConv.scala:252:16]
        req_inner_bounds_lpad = _RANDOM_10[17:2];	// @[LoopConv.scala:252:16]
        req_inner_bounds_rpad = {_RANDOM_10[31:18], _RANDOM_11[1:0]};	// @[LoopConv.scala:252:16]
        req_inner_bounds_upad = _RANDOM_11[17:2];	// @[LoopConv.scala:252:16]
        req_inner_bounds_dpad = {_RANDOM_11[31:18], _RANDOM_12[1:0]};	// @[LoopConv.scala:252:16]
        req_derived_params_irows = {_RANDOM_15[31:18], _RANDOM_16[1:0]};	// @[LoopConv.scala:252:16]
        req_derived_params_icols = _RANDOM_16[17:2];	// @[LoopConv.scala:252:16]
        req_derived_params_irows_unpadded = {_RANDOM_16[31:18], _RANDOM_17[1:0]};	// @[LoopConv.scala:252:16]
        req_derived_params_icols_unpadded = _RANDOM_17[17:2];	// @[LoopConv.scala:252:16]
        req_derived_params_ichs = {_RANDOM_17[31:18], _RANDOM_18[1:0]};	// @[LoopConv.scala:252:16]
        req_derived_params_input_spad_stride = {_RANDOM_19[31:18], _RANDOM_20[1:0]};	// @[LoopConv.scala:252:16]
        req_addr_start = _RANDOM_20[31:18];	// @[LoopConv.scala:252:16]
        req_dram_addr = {_RANDOM_21, _RANDOM_22[7:0]};	// @[LoopConv.scala:252:16]
        req_downsample = _RANDOM_22[8];	// @[LoopConv.scala:252:16]
        req_max_pixels_per_row = _RANDOM_22[24:9];	// @[LoopConv.scala:252:16]
        req_input_dilated = _RANDOM_22[25];	// @[LoopConv.scala:252:16]
        req_trans_input_3120 = _RANDOM_22[26];	// @[LoopConv.scala:252:16]
        req_loop_id = _RANDOM_22[27];	// @[LoopConv.scala:252:16]
        b = {_RANDOM_22[31:28], _RANDOM_23[11:0]};	// @[LoopConv.scala:252:16, :265:14]
        irow = _RANDOM_23[27:12];	// @[LoopConv.scala:265:14, :266:17]
        icol = {_RANDOM_23[31:28], _RANDOM_24[11:0]};	// @[LoopConv.scala:265:14, :267:17]
        ich = _RANDOM_24[27:12];	// @[LoopConv.scala:267:17, :268:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  Pipeline_11 command_p (	// @[LoopConv.scala:307:25]
    .clock                       (clock),
    .reset                       (reset),
    .io_in_valid                 (_command_p_io_in_valid_T_2),	// @[LoopConv.scala:336:43]
    .io_in_bits_cmd_inst_funct   ({5'h0, ~_T_2, 1'h0}),	// @[LoopConv.scala:250:22, :287:46, :337:{34,41}]
    .io_in_bits_cmd_rs1          (_T_2 ? {34'hFE000000, req_derived_params_input_spad_stride[13:0], 3'h0, req_max_pixels_per_row[4:0], 8'h1} : 64'h0),	// @[LoopConv.scala:252:16, :314:18, :316:25, :317:32, :321:36, :328:16, :337:{34,41}]
    .io_in_bits_cmd_rs2          (_T_2 ? {46'h0, {2'h0, req_trans_input_3120 ? req_outer_bounds_batch_size : req_outer_bounds_in_channels} << req_downsample} : 64'h0),	// @[LoopConv.scala:252:16, :275:24, :310:14, :323:{18,33}, :328:16, :337:{34,41}]
    .io_in_bits_dram_addr        ($signed(irow) < 16'sh0 | $signed(_GEN_2) >= $signed({1'h0, req_derived_params_irows_unpadded}) | _I_T_6 | $signed(_GEN_3) >= $signed(_I_T_20) ? 68'h0 : {28'h0, req_dram_addr} + ((req_trans_input_3120 ? {_dram_offset_T_18[66], _dram_offset_T_18} : {_dram_offset_T_42[66], _dram_offset_T_42}) & 68'hFFFFFFFF)),	// @[LoopConv.scala:250:22, :252:16, :266:17, :273:{23,37,55,68,74,82,100}, :278:{24,106,112}, :279:{66,74}, :280:{22,52}, :387:7, :1535:17]
    .io_in_bits_spad_addr        (req_trans_input_3120 ? {_spad_addr_T_24[49], _spad_addr_T_24} + _GEN_20 : {_spad_addr_T_51[49], _spad_addr_T_51} + _GEN_20),	// @[LoopConv.scala:252:16, :281:22, :283:{137,200}, :284:{137,200}]
    .io_in_bits_I                (I),	// @[Mux.scala:101:16]
    .io_in_bits_K                (req_trans_input_3120 ? ($signed(_GEN_26 - _GEN_27) > $signed(_GEN_28) ? _GEN_28 : _GEN_26 - _GEN_27) : $signed(_GEN_29 - _GEN_30) > $signed(_GEN_28) ? _GEN_28 : _GEN_29 - _GEN_30),	// @[LoopConv.scala:252:16, :296:14, :297:{8,22,27,78}, :298:{8,19,26,74}]
    .io_out_ready                (io_cmd_ready & ~io_rob_overloaded),	// @[LoopConv.scala:343:{42,45}]
    .io_in_ready                 (_command_p_io_in_ready),
    .io_out_valid                (_command_p_io_out_valid),
    .io_out_bits_cmd_inst_funct  (_command_p_io_out_bits_cmd_inst_funct),
    .io_out_bits_cmd_inst_rs2    (io_cmd_bits_inst_rs2),
    .io_out_bits_cmd_inst_rs1    (io_cmd_bits_inst_rs1),
    .io_out_bits_cmd_inst_xd     (io_cmd_bits_inst_xd),
    .io_out_bits_cmd_inst_xs1    (io_cmd_bits_inst_xs1),
    .io_out_bits_cmd_inst_xs2    (io_cmd_bits_inst_xs2),
    .io_out_bits_cmd_inst_rd     (io_cmd_bits_inst_rd),
    .io_out_bits_cmd_inst_opcode (io_cmd_bits_inst_opcode),
    .io_out_bits_cmd_rs1         (_command_p_io_out_bits_cmd_rs1),
    .io_out_bits_cmd_rs2         (_command_p_io_out_bits_cmd_rs2),
    .io_out_bits_dram_addr       (_command_p_io_out_bits_dram_addr),
    .io_out_bits_spad_addr       (_command_p_io_out_bits_spad_addr),
    .io_out_bits_I               (_command_p_io_out_bits_I),
    .io_out_bits_K               (_command_p_io_out_bits_K),
    .io_busy                     (_command_p_io_busy)
  );
  assign io_req_ready = _io_req_ready_output;	// @[LoopConv.scala:332:34]
  assign io_cmd_valid = _command_p_io_out_valid & ~io_rob_overloaded;	// @[LoopConv.scala:307:25, :343:45, :344:42]
  assign io_cmd_bits_inst_funct = _command_p_io_out_bits_cmd_inst_funct;	// @[LoopConv.scala:307:25]
  assign io_cmd_bits_rs1 = _T ? _command_p_io_out_bits_dram_addr[63:0] : _command_p_io_out_bits_cmd_rs1;	// @[LoopConv.scala:307:25, :345:15, :346:{46,60}, :348:21]
  assign io_cmd_bits_rs2 = _T ? {11'h0, _mvin_cmd_rs2_num_rows_T[4:0], 9'h0, _command_p_io_out_bits_K[6:0], 3'h0, _command_p_io_out_bits_spad_addr[28:26], 11'h0, _command_p_io_out_bits_spad_addr[14:0]} : _command_p_io_out_bits_cmd_rs2;	// @[LocalAddr.scala:108:37, LoopConv.scala:307:25, :314:18, :345:15, :346:{46,60}, :350:18, :351:{27,35}, :352:27, :354:{21,37}]
  assign io_idle = _io_idle_T & ~_command_p_io_busy;	// @[LoopConv.scala:307:25, :332:{25,37}, :333:29]
  assign io_loop_id = req_loop_id;	// @[LoopConv.scala:252:16]
endmodule

