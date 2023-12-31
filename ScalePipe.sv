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

module ScalePipe(
  input         clock,
                reset,
                io_in_valid,
  input  [7:0]  io_in_bits_data,
  input  [31:0] io_in_bits_scale_bits,
  input  [1:0]  io_in_bits_id,
  input  [3:0]  io_in_bits_index,
  output        io_out_valid,
  output [7:0]  io_out_bits_data,
  output [1:0]  io_out_bits_id,
  output [3:0]  io_out_bits_index
);

  wire [7:0]  _out_bits_data_rec_fn_to_in_io_out;	// @[Configs.scala:93:34]
  wire [2:0]  _out_bits_data_rec_fn_to_in_io_intExceptionFlags;	// @[Configs.scala:93:34]
  wire [32:0] _out_bits_data_muladder_io_out;	// @[Configs.scala:84:30]
  wire [32:0] _out_bits_data_in_to_rec_fn_io_out;	// @[Configs.scala:76:34]
  wire        out_bits_data_f_rec_rawIn_isZeroExpIn = io_in_bits_scale_bits[30:23] == 8'h0;	// @[rawFloatFromFN.scala:47:23, :50:34]
  wire [4:0]  out_bits_data_f_rec_rawIn_normDist = io_in_bits_scale_bits[22] ? 5'h0 : io_in_bits_scale_bits[21] ? 5'h1 : io_in_bits_scale_bits[20] ? 5'h2 : io_in_bits_scale_bits[19] ? 5'h3 : io_in_bits_scale_bits[18] ? 5'h4 : io_in_bits_scale_bits[17] ? 5'h5 : io_in_bits_scale_bits[16] ? 5'h6 : io_in_bits_scale_bits[15] ? 5'h7 : io_in_bits_scale_bits[14] ? 5'h8 : io_in_bits_scale_bits[13] ? 5'h9 : io_in_bits_scale_bits[12] ? 5'hA : io_in_bits_scale_bits[11] ? 5'hB : io_in_bits_scale_bits[10] ? 5'hC : io_in_bits_scale_bits[9] ? 5'hD : io_in_bits_scale_bits[8] ? 5'hE : io_in_bits_scale_bits[7] ? 5'hF : io_in_bits_scale_bits[6] ? 5'h10 : io_in_bits_scale_bits[5] ? 5'h11 : io_in_bits_scale_bits[4] ? 5'h12 : io_in_bits_scale_bits[3] ? 5'h13 : io_in_bits_scale_bits[2] ? 5'h14 : io_in_bits_scale_bits[1] ? 5'h15 : 5'h16;	// @[Mux.scala:47:70, primitives.scala:92:52, rawFloatFromFN.scala:48:25]
  wire [53:0] _out_bits_data_f_rec_rawIn_subnormFract_T = {31'h0, io_in_bits_scale_bits[22:0]} << out_bits_data_f_rec_rawIn_normDist;	// @[Mux.scala:47:70, rawFloatFromFN.scala:48:25, :54:36]
  wire [8:0]  out_bits_data_f_rec_rawIn_adjustedExp = (out_bits_data_f_rec_rawIn_isZeroExpIn ? {4'hF, ~out_bits_data_f_rec_rawIn_normDist} : {1'h0, io_in_bits_scale_bits[30:23]}) + {7'h20, out_bits_data_f_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1};	// @[Mux.scala:47:70, rawFloatFromFN.scala:47:23, :50:34, :56:16, :57:26, :59:15, :60:27]
  reg         io_out_v;	// @[Valid.scala:130:22]
  reg  [7:0]  io_out_b_data;	// @[Reg.scala:19:16]
  reg  [1:0]  io_out_b_id;	// @[Reg.scala:19:16]
  reg  [3:0]  io_out_b_index;	// @[Reg.scala:19:16]
  reg         io_out_outPipe_valid;	// @[Valid.scala:130:22]
  reg  [7:0]  io_out_outPipe_bits_data;	// @[Reg.scala:19:16]
  reg  [1:0]  io_out_outPipe_bits_id;	// @[Reg.scala:19:16]
  reg  [3:0]  io_out_outPipe_bits_index;	// @[Reg.scala:19:16]
  reg         io_out_outPipe_valid_1;	// @[Valid.scala:130:22]
  reg  [7:0]  io_out_outPipe_bits_1_data;	// @[Reg.scala:19:16]
  reg  [1:0]  io_out_outPipe_bits_1_id;	// @[Reg.scala:19:16]
  reg  [3:0]  io_out_outPipe_bits_1_index;	// @[Reg.scala:19:16]
  reg         io_out_outPipe_valid_2;	// @[Valid.scala:130:22]
  reg  [7:0]  io_out_outPipe_bits_2_data;	// @[Reg.scala:19:16]
  reg  [1:0]  io_out_outPipe_bits_2_id;	// @[Reg.scala:19:16]
  reg  [3:0]  io_out_outPipe_bits_2_index;	// @[Reg.scala:19:16]
  always @(posedge clock) begin
    if (reset) begin
      io_out_v <= 1'h0;	// @[Valid.scala:130:22, rawFloatFromFN.scala:50:34]
      io_out_outPipe_valid <= 1'h0;	// @[Valid.scala:130:22, rawFloatFromFN.scala:50:34]
      io_out_outPipe_valid_1 <= 1'h0;	// @[Valid.scala:130:22, rawFloatFromFN.scala:50:34]
      io_out_outPipe_valid_2 <= 1'h0;	// @[Valid.scala:130:22, rawFloatFromFN.scala:50:34]
    end
    else begin
      io_out_v <= io_in_valid;	// @[Valid.scala:130:22]
      io_out_outPipe_valid <= io_out_v;	// @[Valid.scala:130:22]
      io_out_outPipe_valid_1 <= io_out_outPipe_valid;	// @[Valid.scala:130:22]
      io_out_outPipe_valid_2 <= io_out_outPipe_valid_1;	// @[Valid.scala:130:22]
    end
    if (io_in_valid) begin
      if (_out_bits_data_rec_fn_to_in_io_intExceptionFlags[1]) begin	// @[Configs.scala:93:34, :98:57]
        if (_out_bits_data_muladder_io_out[32])	// @[Configs.scala:84:30, rawFloatFromRecFN.scala:58:25]
          io_out_b_data <= 8'h80;	// @[Configs.scala:102:22, Reg.scala:19:16]
        else	// @[rawFloatFromRecFN.scala:58:25]
          io_out_b_data <= 8'h7F;	// @[Configs.scala:102:22, Reg.scala:19:16]
      end
      else	// @[Configs.scala:98:57]
        io_out_b_data <= _out_bits_data_rec_fn_to_in_io_out;	// @[Configs.scala:93:34, Reg.scala:19:16]
      io_out_b_id <= io_in_bits_id;	// @[Reg.scala:19:16]
      io_out_b_index <= io_in_bits_index;	// @[Reg.scala:19:16]
    end
    if (io_out_v) begin	// @[Valid.scala:130:22]
      io_out_outPipe_bits_data <= io_out_b_data;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_id <= io_out_b_id;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_index <= io_out_b_index;	// @[Reg.scala:19:16]
    end
    if (io_out_outPipe_valid) begin	// @[Valid.scala:130:22]
      io_out_outPipe_bits_1_data <= io_out_outPipe_bits_data;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_1_id <= io_out_outPipe_bits_id;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_1_index <= io_out_outPipe_bits_index;	// @[Reg.scala:19:16]
    end
    if (io_out_outPipe_valid_1) begin	// @[Valid.scala:130:22]
      io_out_outPipe_bits_2_data <= io_out_outPipe_bits_1_data;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_2_id <= io_out_outPipe_bits_1_id;	// @[Reg.scala:19:16]
      io_out_outPipe_bits_2_index <= io_out_outPipe_bits_1_index;	// @[Reg.scala:19:16]
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
        io_out_v = _RANDOM_0[0];	// @[Valid.scala:130:22]
        io_out_b_data = _RANDOM_0[8:1];	// @[Reg.scala:19:16, Valid.scala:130:22]
        io_out_b_id = _RANDOM_1[10:9];	// @[Reg.scala:19:16]
        io_out_b_index = _RANDOM_1[14:11];	// @[Reg.scala:19:16]
        io_out_outPipe_valid = _RANDOM_1[15];	// @[Reg.scala:19:16, Valid.scala:130:22]
        io_out_outPipe_bits_data = _RANDOM_1[23:16];	// @[Reg.scala:19:16]
        io_out_outPipe_bits_id = _RANDOM_2[25:24];	// @[Reg.scala:19:16]
        io_out_outPipe_bits_index = _RANDOM_2[29:26];	// @[Reg.scala:19:16]
        io_out_outPipe_valid_1 = _RANDOM_2[30];	// @[Reg.scala:19:16, Valid.scala:130:22]
        io_out_outPipe_bits_1_data = {_RANDOM_2[31], _RANDOM_3[6:0]};	// @[Reg.scala:19:16]
        io_out_outPipe_bits_1_id = _RANDOM_4[8:7];	// @[Reg.scala:19:16]
        io_out_outPipe_bits_1_index = _RANDOM_4[12:9];	// @[Reg.scala:19:16]
        io_out_outPipe_valid_2 = _RANDOM_4[13];	// @[Reg.scala:19:16, Valid.scala:130:22]
        io_out_outPipe_bits_2_data = _RANDOM_4[21:14];	// @[Reg.scala:19:16]
        io_out_outPipe_bits_2_id = _RANDOM_5[23:22];	// @[Reg.scala:19:16]
        io_out_outPipe_bits_2_index = _RANDOM_5[27:24];	// @[Reg.scala:19:16]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  INToRecFN out_bits_data_in_to_rec_fn (	// @[Configs.scala:76:34]
    .io_in  (io_in_bits_data),
    .io_out (_out_bits_data_in_to_rec_fn_io_out)
  );
  MulAddRecFN out_bits_data_muladder (	// @[Configs.scala:84:30]
    .io_a   (_out_bits_data_in_to_rec_fn_io_out),	// @[Configs.scala:76:34]
    .io_b   ({io_in_bits_scale_bits[31], (out_bits_data_f_rec_rawIn_isZeroExpIn & ~(|(io_in_bits_scale_bits[22:0])) ? 3'h0 : out_bits_data_f_rec_rawIn_adjustedExp[8:6]) | {2'h0, (&(out_bits_data_f_rec_rawIn_adjustedExp[8:7])) & (|(io_in_bits_scale_bits[22:0]))}, out_bits_data_f_rec_rawIn_adjustedExp[5:0], out_bits_data_f_rec_rawIn_isZeroExpIn ? {_out_bits_data_f_rec_rawIn_subnormFract_T[21:0], 1'h0} : io_in_bits_scale_bits[22:0]}),	// @[Cat.scala:33:92, rawFloatFromFN.scala:46:22, :48:25, :50:34, :51:38, :54:{36,47,64}, :59:15, :62:34, :63:{37,62}, :66:33, :72:42, recFNFromFN.scala:48:{16,53,79}, :50:23]
    .io_out (_out_bits_data_muladder_io_out)
  );
  RecFNToIN out_bits_data_rec_fn_to_in (	// @[Configs.scala:93:34]
    .io_in                (_out_bits_data_muladder_io_out),	// @[Configs.scala:84:30]
    .io_out               (_out_bits_data_rec_fn_to_in_io_out),
    .io_intExceptionFlags (_out_bits_data_rec_fn_to_in_io_intExceptionFlags)
  );
  assign io_out_valid = io_out_outPipe_valid_2;	// @[Valid.scala:130:22]
  assign io_out_bits_data = io_out_outPipe_bits_2_data;	// @[Reg.scala:19:16]
  assign io_out_bits_id = io_out_outPipe_bits_2_id;	// @[Reg.scala:19:16]
  assign io_out_bits_index = io_out_outPipe_bits_2_index;	// @[Reg.scala:19:16]
endmodule

