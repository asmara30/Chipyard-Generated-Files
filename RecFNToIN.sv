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

module RecFNToIN(
  input  [32:0] io_in,
  output [7:0]  io_out,
  output [2:0]  io_intExceptionFlags
);

  wire        rawIn_isNaN = (&(io_in[31:30])) & io_in[29];	// @[rawFloatFromRecFN.scala:50:21, :52:{29,54}, :55:{33,41}]
  wire [30:0] shiftedSig = {7'h0, io_in[31], io_in[22:0]} << (io_in[31] ? io_in[25:23] : 3'h0);	// @[RecFNToIN.scala:58:30, :80:50, :81:16, :82:27, :140:12, rawFloatFromRecFN.scala:60:51]
  wire [1:0]  _roundIncr_near_even_T_6 = {shiftedSig[22], |(shiftedSig[21:0])};	// @[RecFNToIN.scala:80:50, :86:{51,69}, :89:50]
  wire        roundIncr_near_even = io_in[31] & ((&(shiftedSig[23:22])) | (&_roundIncr_near_even_T_6)) | ~(io_in[31]) & (&(io_in[30:23])) & (|_roundIncr_near_even_T_6);	// @[RecFNToIN.scala:58:30, :59:28, :60:{27,47}, :80:50, :89:50, :91:{25,39,46,51,71,78}, :92:{26,46}]
  wire [7:0]  complUnroundedInt = {8{io_in[32]}} ^ shiftedSig[30:23];	// @[RecFNToIN.scala:80:50, :87:54, :100:32, rawFloatFromRecFN.scala:58:25]
  wire        magGeOne_atOverflowEdge = io_in[30:23] == 8'h7;	// @[RecFNToIN.scala:59:28, :107:43]
  wire        common_overflow = io_in[31] & ((|(io_in[30:26])) | (io_in[32] ? magGeOne_atOverflowEdge & ((|(shiftedSig[29:23])) | roundIncr_near_even) : magGeOne_atOverflowEdge | io_in[30:23] == 8'h6 & (&(shiftedSig[28:23])) & roundIncr_near_even));	// @[RecFNToIN.scala:58:30, :59:28, :80:50, :87:54, :91:78, :107:43, :110:{38,56}, :112:12, :113:{21,40}, :115:24, :116:49, :117:{42,60,64}, :118:49, :119:{38,62}, rawFloatFromRecFN.scala:58:25]
  wire        invalidExc = rawIn_isNaN | (&(io_in[31:30])) & ~(io_in[29]);	// @[RecFNToIN.scala:130:34, rawFloatFromRecFN.scala:50:21, :52:{29,54}, :55:{33,41}, :56:{33,36}]
  wire        excSign = ~rawIn_isNaN & io_in[32];	// @[RecFNToIN.scala:134:{19,32}, rawFloatFromRecFN.scala:55:33, :58:25]
  assign io_out = invalidExc | common_overflow ? {excSign, {7{~excSign}}} : roundIncr_near_even ^ io_in[32] ? complUnroundedInt + 8'h1 : complUnroundedInt;	// @[RecFNToIN.scala:91:78, :100:32, :102:{12,23}, :103:31, :112:12, :130:34, :134:32, :139:11, :140:{12,13}, :142:{18,30}, rawFloatFromRecFN.scala:58:25]
  assign io_intExceptionFlags = {invalidExc, ~invalidExc & common_overflow, ~invalidExc & ~common_overflow & (io_in[31] ? (|_roundIncr_near_even_T_6) : (|(io_in[31:29])))};	// @[Cat.scala:33:92, RecFNToIN.scala:58:30, :89:{29,50,57}, :112:12, :130:34, :131:{20,32}, :132:{35,52}, rawFloatFromRecFN.scala:50:21, :51:{29,54}]
endmodule

