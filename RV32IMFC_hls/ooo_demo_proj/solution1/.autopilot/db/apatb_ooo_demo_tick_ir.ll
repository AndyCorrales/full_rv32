; ModuleID = '/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/ooo_demo_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline willreturn
define void @apatb_ooo_demo_tick_ir(%"struct.ap_uint<1>"* nocapture readonly %reset, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %r0_out, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %r1_out, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %r2_out, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %r3_out, %"struct.ap_uint<2>"* noalias nocapture nonnull dereferenceable(1) %commit_reg, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %commit_valid, %"struct.ap_uint<2>"* noalias nocapture nonnull dereferenceable(1) %alu_complete_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %alu_complete_valid, %"struct.ap_uint<2>"* noalias nocapture nonnull dereferenceable(1) %mul_complete_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %mul_complete_valid, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %halted) local_unnamed_addr #0 {
entry:
  %r0_out_copy = alloca i32, align 512
  %r1_out_copy = alloca i32, align 512
  %r2_out_copy = alloca i32, align 512
  %r3_out_copy = alloca i32, align 512
  %commit_reg_copy = alloca i2, align 512
  %commit_valid_copy = alloca i1, align 512
  %alu_complete_tag_copy = alloca i2, align 512
  %alu_complete_valid_copy = alloca i1, align 512
  %mul_complete_tag_copy = alloca i2, align 512
  %mul_complete_valid_copy = alloca i1, align 512
  %halted_copy = alloca i1, align 512
  call fastcc void @copy_in(%"struct.ap_uint<32>"* nonnull %r0_out, i32* nonnull align 512 %r0_out_copy, %"struct.ap_uint<32>"* nonnull %r1_out, i32* nonnull align 512 %r1_out_copy, %"struct.ap_uint<32>"* nonnull %r2_out, i32* nonnull align 512 %r2_out_copy, %"struct.ap_uint<32>"* nonnull %r3_out, i32* nonnull align 512 %r3_out_copy, %"struct.ap_uint<2>"* nonnull %commit_reg, i2* nonnull align 512 %commit_reg_copy, %"struct.ap_uint<1>"* nonnull %commit_valid, i1* nonnull align 512 %commit_valid_copy, %"struct.ap_uint<2>"* nonnull %alu_complete_tag, i2* nonnull align 512 %alu_complete_tag_copy, %"struct.ap_uint<1>"* nonnull %alu_complete_valid, i1* nonnull align 512 %alu_complete_valid_copy, %"struct.ap_uint<2>"* nonnull %mul_complete_tag, i2* nonnull align 512 %mul_complete_tag_copy, %"struct.ap_uint<1>"* nonnull %mul_complete_valid, i1* nonnull align 512 %mul_complete_valid_copy, %"struct.ap_uint<1>"* nonnull %halted, i1* nonnull align 512 %halted_copy)
  call void @apatb_ooo_demo_tick_hw(%"struct.ap_uint<1>"* %reset, i32* %r0_out_copy, i32* %r1_out_copy, i32* %r2_out_copy, i32* %r3_out_copy, i2* %commit_reg_copy, i1* %commit_valid_copy, i2* %alu_complete_tag_copy, i1* %alu_complete_valid_copy, i2* %mul_complete_tag_copy, i1* %mul_complete_valid_copy, i1* %halted_copy)
  call void @copy_back(%"struct.ap_uint<32>"* %r0_out, i32* %r0_out_copy, %"struct.ap_uint<32>"* %r1_out, i32* %r1_out_copy, %"struct.ap_uint<32>"* %r2_out, i32* %r2_out_copy, %"struct.ap_uint<32>"* %r3_out, i32* %r3_out_copy, %"struct.ap_uint<2>"* %commit_reg, i2* %commit_reg_copy, %"struct.ap_uint<1>"* %commit_valid, i1* %commit_valid_copy, %"struct.ap_uint<2>"* %alu_complete_tag, i2* %alu_complete_tag_copy, %"struct.ap_uint<1>"* %alu_complete_valid, i1* %alu_complete_valid_copy, %"struct.ap_uint<2>"* %mul_complete_tag, i2* %mul_complete_tag_copy, %"struct.ap_uint<1>"* %mul_complete_valid, i1* %mul_complete_valid_copy, %"struct.ap_uint<1>"* %halted, i1* %halted_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%"struct.ap_uint<32>"* noalias readonly "unpacked"="0", i32* noalias nocapture align 512 "unpacked"="1.0", %"struct.ap_uint<32>"* noalias readonly "unpacked"="2", i32* noalias nocapture align 512 "unpacked"="3.0", %"struct.ap_uint<32>"* noalias readonly "unpacked"="4", i32* noalias nocapture align 512 "unpacked"="5.0", %"struct.ap_uint<32>"* noalias readonly "unpacked"="6", i32* noalias nocapture align 512 "unpacked"="7.0", %"struct.ap_uint<2>"* noalias readonly "unpacked"="8", i2* noalias nocapture align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="10", i1* noalias nocapture align 512 "unpacked"="11.0", %"struct.ap_uint<2>"* noalias readonly "unpacked"="12", i2* noalias nocapture align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="14", i1* noalias nocapture align 512 "unpacked"="15.0", %"struct.ap_uint<2>"* noalias readonly "unpacked"="16", i2* noalias nocapture align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="18", i1* noalias nocapture align 512 "unpacked"="19.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="20", i1* noalias nocapture align 512 "unpacked"="21.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %1, %"struct.ap_uint<32>"* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %3, %"struct.ap_uint<32>"* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %5, %"struct.ap_uint<32>"* %4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %7, %"struct.ap_uint<32>"* %6)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* align 512 %9, %"struct.ap_uint<2>"* %8)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.60"(i1* align 512 %11, %"struct.ap_uint<1>"* %10)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* align 512 %13, %"struct.ap_uint<2>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.60"(i1* align 512 %15, %"struct.ap_uint<1>"* %14)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* align 512 %17, %"struct.ap_uint<2>"* %16)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.60"(i1* align 512 %19, %"struct.ap_uint<1>"* %18)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.60"(i1* align 512 %21, %"struct.ap_uint<1>"* %20)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(%"struct.ap_uint<32>"* noalias "unpacked"="0", i32* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_uint<32>"* noalias "unpacked"="2", i32* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<32>"* noalias "unpacked"="4", i32* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<32>"* noalias "unpacked"="6", i32* noalias nocapture readonly align 512 "unpacked"="7.0", %"struct.ap_uint<2>"* noalias "unpacked"="8", i2* noalias nocapture readonly align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias "unpacked"="10", i1* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<2>"* noalias "unpacked"="12", i2* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0", %"struct.ap_uint<2>"* noalias "unpacked"="16", i2* noalias nocapture readonly align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias "unpacked"="18", i1* noalias nocapture readonly align 512 "unpacked"="19.0", %"struct.ap_uint<1>"* noalias "unpacked"="20", i1* noalias nocapture readonly align 512 "unpacked"="21.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %0, i32* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %2, i32* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %4, i32* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %6, i32* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %8, i2* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %10, i1* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %12, i2* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %16, i2* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %18, i1* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %20, i1* align 512 %21)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* noalias "unpacked"="0" %dst, i1* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<1>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i1* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i1
  store i1 %3, i1* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.60"(i1* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<1>"* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<1>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i1* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i1
  store i1 %3, i1* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* noalias "unpacked"="0" %dst, i2* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<2>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i2* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i2
  store i2 %3, i2* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<2>"* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<2>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i2* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i2
  store i2 %3, i2* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<32>"* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<32>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.0.0.03, align 4
  store i32 %1, i32* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %"struct.ap_uint<32>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<32>", %"struct.ap_uint<32>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src, align 512
  store i32 %1, i32* %dst.0.0.04, align 4
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_ooo_demo_tick_hw(%"struct.ap_uint<1>"*, i32*, i32*, i32*, i32*, i2*, i1*, i2*, i1*, i2*, i1*, i1*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%"struct.ap_uint<32>"* noalias "unpacked"="0", i32* noalias nocapture readonly align 512 "unpacked"="1.0", %"struct.ap_uint<32>"* noalias "unpacked"="2", i32* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<32>"* noalias "unpacked"="4", i32* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<32>"* noalias "unpacked"="6", i32* noalias nocapture readonly align 512 "unpacked"="7.0", %"struct.ap_uint<2>"* noalias "unpacked"="8", i2* noalias nocapture readonly align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias "unpacked"="10", i1* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<2>"* noalias "unpacked"="12", i2* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0", %"struct.ap_uint<2>"* noalias "unpacked"="16", i2* noalias nocapture readonly align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias "unpacked"="18", i1* noalias nocapture readonly align 512 "unpacked"="19.0", %"struct.ap_uint<1>"* noalias "unpacked"="20", i1* noalias nocapture readonly align 512 "unpacked"="21.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %0, i32* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %2, i32* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %4, i32* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.95"(%"struct.ap_uint<32>"* %6, i32* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %8, i2* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %10, i1* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %12, i2* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.67"(%"struct.ap_uint<2>"* %16, i2* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %18, i1* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %20, i1* align 512 %21)
  ret void
}

declare void @ooo_demo_tick_hw_stub(%"struct.ap_uint<1>"* nocapture readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<2>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<2>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<2>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull)

define void @ooo_demo_tick_hw_stub_wrapper(%"struct.ap_uint<1>"*, i32*, i32*, i32*, i32*, i2*, i1*, i2*, i1*, i2*, i1*, i1*) #4 {
entry:
  %12 = call i8* @malloc(i64 4)
  %13 = bitcast i8* %12 to %"struct.ap_uint<32>"*
  %14 = call i8* @malloc(i64 4)
  %15 = bitcast i8* %14 to %"struct.ap_uint<32>"*
  %16 = call i8* @malloc(i64 4)
  %17 = bitcast i8* %16 to %"struct.ap_uint<32>"*
  %18 = call i8* @malloc(i64 4)
  %19 = bitcast i8* %18 to %"struct.ap_uint<32>"*
  %20 = call i8* @malloc(i64 1)
  %21 = bitcast i8* %20 to %"struct.ap_uint<2>"*
  %22 = call i8* @malloc(i64 1)
  %23 = bitcast i8* %22 to %"struct.ap_uint<1>"*
  %24 = call i8* @malloc(i64 1)
  %25 = bitcast i8* %24 to %"struct.ap_uint<2>"*
  %26 = call i8* @malloc(i64 1)
  %27 = bitcast i8* %26 to %"struct.ap_uint<1>"*
  %28 = call i8* @malloc(i64 1)
  %29 = bitcast i8* %28 to %"struct.ap_uint<2>"*
  %30 = call i8* @malloc(i64 1)
  %31 = bitcast i8* %30 to %"struct.ap_uint<1>"*
  %32 = call i8* @malloc(i64 1)
  %33 = bitcast i8* %32 to %"struct.ap_uint<1>"*
  call void @copy_out(%"struct.ap_uint<32>"* %13, i32* %1, %"struct.ap_uint<32>"* %15, i32* %2, %"struct.ap_uint<32>"* %17, i32* %3, %"struct.ap_uint<32>"* %19, i32* %4, %"struct.ap_uint<2>"* %21, i2* %5, %"struct.ap_uint<1>"* %23, i1* %6, %"struct.ap_uint<2>"* %25, i2* %7, %"struct.ap_uint<1>"* %27, i1* %8, %"struct.ap_uint<2>"* %29, i2* %9, %"struct.ap_uint<1>"* %31, i1* %10, %"struct.ap_uint<1>"* %33, i1* %11)
  call void @ooo_demo_tick_hw_stub(%"struct.ap_uint<1>"* %0, %"struct.ap_uint<32>"* %13, %"struct.ap_uint<32>"* %15, %"struct.ap_uint<32>"* %17, %"struct.ap_uint<32>"* %19, %"struct.ap_uint<2>"* %21, %"struct.ap_uint<1>"* %23, %"struct.ap_uint<2>"* %25, %"struct.ap_uint<1>"* %27, %"struct.ap_uint<2>"* %29, %"struct.ap_uint<1>"* %31, %"struct.ap_uint<1>"* %33)
  call void @copy_in(%"struct.ap_uint<32>"* %13, i32* %1, %"struct.ap_uint<32>"* %15, i32* %2, %"struct.ap_uint<32>"* %17, i32* %3, %"struct.ap_uint<32>"* %19, i32* %4, %"struct.ap_uint<2>"* %21, i2* %5, %"struct.ap_uint<1>"* %23, i1* %6, %"struct.ap_uint<2>"* %25, i2* %7, %"struct.ap_uint<1>"* %27, i1* %8, %"struct.ap_uint<2>"* %29, i2* %9, %"struct.ap_uint<1>"* %31, i1* %10, %"struct.ap_uint<1>"* %33, i1* %11)
  call void @free(i8* %12)
  call void @free(i8* %14)
  call void @free(i8* %16)
  call void @free(i8* %18)
  call void @free(i8* %20)
  call void @free(i8* %22)
  call void @free(i8* %24)
  call void @free(i8* %26)
  call void @free(i8* %28)
  call void @free(i8* %30)
  call void @free(i8* %32)
  ret void
}

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
