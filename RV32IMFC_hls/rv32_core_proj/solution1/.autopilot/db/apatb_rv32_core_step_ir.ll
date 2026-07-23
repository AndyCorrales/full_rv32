; ModuleID = '/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/rv32_core_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_rv32_core_step_ir(%"struct.ap_uint<32>"* nocapture readonly %instr, %"struct.ap_uint<32>"* nocapture readonly %pc, %"struct.ap_uint<32>"* noalias nonnull readonly "fpga.decayed.dim.hint"="32" %regs_in, %"struct.ap_uint<32>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %regs_out, float* noalias nonnull readonly "fpga.decayed.dim.hint"="32" %fregs_in, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %fregs_out, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %mem, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %next_pc, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %instr_size, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %halted) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_uint<32>"* %regs_in to [32 x %"struct.ap_uint<32>"]*
  %regs_in_copy = alloca [32 x i32], align 512
  %1 = bitcast %"struct.ap_uint<32>"* %regs_out to [32 x %"struct.ap_uint<32>"]*
  %regs_out_copy = alloca [32 x i32], align 512
  %2 = bitcast float* %fregs_in to [32 x float]*
  %fregs_in_copy = alloca [32 x float], align 512
  %3 = bitcast float* %fregs_out to [32 x float]*
  %fregs_out_copy = alloca [32 x float], align 512
  %4 = bitcast %"struct.ap_uint<32>"* %mem to [16384 x %"struct.ap_uint<32>"]*
  %5 = call i8* @malloc(i64 65536)
  %mem_copy = bitcast i8* %5 to [16384 x i32]*
  %next_pc_copy = alloca i32, align 512
  %instr_size_copy = alloca i3, align 512
  %halted_copy = alloca i1, align 512
  call fastcc void @copy_in([32 x %"struct.ap_uint<32>"]* nonnull %0, [32 x i32]* nonnull align 512 %regs_in_copy, [32 x %"struct.ap_uint<32>"]* nonnull %1, [32 x i32]* nonnull align 512 %regs_out_copy, [32 x float]* nonnull %2, [32 x float]* nonnull align 512 %fregs_in_copy, [32 x float]* nonnull %3, [32 x float]* nonnull align 512 %fregs_out_copy, [16384 x %"struct.ap_uint<32>"]* nonnull %4, [16384 x i32]* %mem_copy, %"struct.ap_uint<32>"* nonnull %next_pc, i32* nonnull align 512 %next_pc_copy, %"struct.ap_uint<3>"* nonnull %instr_size, i3* nonnull align 512 %instr_size_copy, %"struct.ap_uint<1>"* nonnull %halted, i1* nonnull align 512 %halted_copy)
  call void @apatb_rv32_core_step_hw(%"struct.ap_uint<32>"* %instr, %"struct.ap_uint<32>"* %pc, [32 x i32]* %regs_in_copy, [32 x i32]* %regs_out_copy, [32 x float]* %fregs_in_copy, [32 x float]* %fregs_out_copy, [16384 x i32]* %mem_copy, i32* %next_pc_copy, i3* %instr_size_copy, i1* %halted_copy)
  call void @copy_back([32 x %"struct.ap_uint<32>"]* %0, [32 x i32]* %regs_in_copy, [32 x %"struct.ap_uint<32>"]* %1, [32 x i32]* %regs_out_copy, [32 x float]* %2, [32 x float]* %fregs_in_copy, [32 x float]* %3, [32 x float]* %fregs_out_copy, [16384 x %"struct.ap_uint<32>"]* %4, [16384 x i32]* %mem_copy, %"struct.ap_uint<32>"* %next_pc, i32* %next_pc_copy, %"struct.ap_uint<3>"* %instr_size, i3* %instr_size_copy, %"struct.ap_uint<1>"* %halted, i1* %halted_copy)
  call void @free(i8* %5)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([32 x %"struct.ap_uint<32>"]* readonly "unpacked"="0", [32 x i32]* nocapture align 512 "unpacked"="1.0", [32 x %"struct.ap_uint<32>"]* readonly "unpacked"="2", [32 x i32]* noalias nocapture align 512 "unpacked"="3.0", [32 x float]* readonly "unpacked"="4", [32 x float]* align 512 "unpacked"="5", [32 x float]* readonly "unpacked"="6", [32 x float]* align 512 "unpacked"="7", [16384 x %"struct.ap_uint<32>"]* readonly "unpacked"="8", [16384 x i32]* nocapture "unpacked"="9.0", %"struct.ap_uint<32>"* readonly "unpacked"="10", i32* noalias nocapture align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* readonly "unpacked"="12", i3* noalias nocapture align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* readonly "unpacked"="14", i1* noalias nocapture align 512 "unpacked"="15.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>.281"([32 x i32]* align 512 %1, [32 x %"struct.ap_uint<32>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>.281"([32 x i32]* align 512 %3, [32 x %"struct.ap_uint<32>"]* %2)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %5, [32 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %7, [32 x float]* %6)
  call fastcc void @"onebyonecpy_hls.p0a16384struct.ap_uint<32>.255"([16384 x i32]* %9, [16384 x %"struct.ap_uint<32>"]* %8)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %11, %"struct.ap_uint<32>"* %10)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.241"(i3* align 512 %13, %"struct.ap_uint<3>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %15, %"struct.ap_uint<1>"* %14)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %dst, [32 x float]* readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x float]* %dst, null
  %1 = icmp eq [32 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32f32([32 x float]* nonnull %dst, [32 x float]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32f32([32 x float]* %dst, [32 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x float]* %src, null
  %1 = icmp eq [32 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x float], [32 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x float], [32 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a16384struct.ap_uint<32>"([16384 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [16384 x i32]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [16384 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a16384struct.ap_uint<32>"([16384 x %"struct.ap_uint<32>"]* nonnull %dst, [16384 x i32]* %src, i64 16384)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a16384struct.ap_uint<32>"([16384 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [16384 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [16384 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [16384 x i32], [16384 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [16384 x %"struct.ap_uint<32>"], [16384 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<32>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* noalias "unpacked"="0" %dst, i3* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<3>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<3>", %"struct.ap_uint<3>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i3* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i3
  store i3 %3, i3* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<1>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
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
define internal fastcc void @copy_out([32 x %"struct.ap_uint<32>"]* "unpacked"="0", [32 x i32]* nocapture readonly align 512 "unpacked"="1.0", [32 x %"struct.ap_uint<32>"]* "unpacked"="2", [32 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [32 x float]* "unpacked"="4", [32 x float]* readonly align 512 "unpacked"="5", [32 x float]* "unpacked"="6", [32 x float]* readonly align 512 "unpacked"="7", [16384 x %"struct.ap_uint<32>"]* "unpacked"="8", [16384 x i32]* nocapture readonly "unpacked"="9.0", %"struct.ap_uint<32>"* "unpacked"="10", i32* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* "unpacked"="12", i3* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>"([32 x %"struct.ap_uint<32>"]* %0, [32 x i32]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>"([32 x %"struct.ap_uint<32>"]* %2, [32 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %4, [32 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %6, [32 x float]* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0a16384struct.ap_uint<32>"([16384 x %"struct.ap_uint<32>"]* %8, [16384 x i32]* %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.248"(%"struct.ap_uint<32>"* %10, i32* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %12, i3* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.234"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.234"(%"struct.ap_uint<1>"* noalias "unpacked"="0" %dst, i1* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.241"(i3* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<3>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<3>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<3>", %"struct.ap_uint<3>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i3* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i3
  store i3 %3, i3* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.248"(%"struct.ap_uint<32>"* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
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

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a16384struct.ap_uint<32>.255"([16384 x i32]* nocapture "unpacked"="0.0" %dst, [16384 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [16384 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a16384struct.ap_uint<32>.258"([16384 x i32]* %dst, [16384 x %"struct.ap_uint<32>"]* nonnull %src, i64 16384)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a16384struct.ap_uint<32>.258"([16384 x i32]* nocapture "unpacked"="0.0" %dst, [16384 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [16384 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [16384 x %"struct.ap_uint<32>"], [16384 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [16384 x i32], [16384 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>"([32 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [32 x i32]* nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32struct.ap_uint<32>.277"([32 x %"struct.ap_uint<32>"]* nonnull %dst, [32 x i32]* %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_uint<32>.277"([32 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [32 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x i32], [32 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_uint<32>"], [32 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>.281"([32 x i32]* nocapture align 512 "unpacked"="0.0" %dst, [32 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32struct.ap_uint<32>.284"([32 x i32]* %dst, [32 x %"struct.ap_uint<32>"]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_uint<32>.284"([32 x i32]* nocapture "unpacked"="0.0" %dst, [32 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_uint<32>"], [32 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [32 x i32], [32 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i32, i32* %src.addr.0.0.05, align 4
  store i32 %1, i32* %dst.addr.0.0.06, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_rv32_core_step_hw(%"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, [32 x i32]*, [32 x i32]*, [32 x float]*, [32 x float]*, [16384 x i32]*, i32*, i3*, i1*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([32 x %"struct.ap_uint<32>"]* "unpacked"="0", [32 x i32]* nocapture readonly align 512 "unpacked"="1.0", [32 x %"struct.ap_uint<32>"]* "unpacked"="2", [32 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [32 x float]* "unpacked"="4", [32 x float]* readonly align 512 "unpacked"="5", [32 x float]* "unpacked"="6", [32 x float]* readonly align 512 "unpacked"="7", [16384 x %"struct.ap_uint<32>"]* "unpacked"="8", [16384 x i32]* nocapture readonly "unpacked"="9.0", %"struct.ap_uint<32>"* "unpacked"="10", i32* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* "unpacked"="12", i3* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a32struct.ap_uint<32>"([32 x %"struct.ap_uint<32>"]* %2, [32 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %6, [32 x float]* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0a16384struct.ap_uint<32>"([16384 x %"struct.ap_uint<32>"]* %8, [16384 x i32]* %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.248"(%"struct.ap_uint<32>"* %10, i32* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %12, i3* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.234"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  ret void
}

declare void @rv32_core_step_hw_stub(%"struct.ap_uint<32>"* nocapture readonly, %"struct.ap_uint<32>"* nocapture readonly, %"struct.ap_uint<32>"* noalias nonnull readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, float* noalias nonnull readonly, float* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull)

define void @rv32_core_step_hw_stub_wrapper(%"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, [32 x i32]*, [32 x i32]*, [32 x float]*, [32 x float]*, [16384 x i32]*, i32*, i3*, i1*) #5 {
entry:
  %10 = call i8* @malloc(i64 128)
  %11 = bitcast i8* %10 to [32 x %"struct.ap_uint<32>"]*
  %12 = call i8* @malloc(i64 128)
  %13 = bitcast i8* %12 to [32 x %"struct.ap_uint<32>"]*
  %14 = call i8* @malloc(i64 65536)
  %15 = bitcast i8* %14 to [16384 x %"struct.ap_uint<32>"]*
  %16 = call i8* @malloc(i64 4)
  %17 = bitcast i8* %16 to %"struct.ap_uint<32>"*
  %18 = call i8* @malloc(i64 1)
  %19 = bitcast i8* %18 to %"struct.ap_uint<3>"*
  %20 = call i8* @malloc(i64 1)
  %21 = bitcast i8* %20 to %"struct.ap_uint<1>"*
  call void @copy_out([32 x %"struct.ap_uint<32>"]* %11, [32 x i32]* %2, [32 x %"struct.ap_uint<32>"]* %13, [32 x i32]* %3, [32 x float]* null, [32 x float]* %4, [32 x float]* null, [32 x float]* %5, [16384 x %"struct.ap_uint<32>"]* %15, [16384 x i32]* %6, %"struct.ap_uint<32>"* %17, i32* %7, %"struct.ap_uint<3>"* %19, i3* %8, %"struct.ap_uint<1>"* %21, i1* %9)
  %22 = bitcast [32 x %"struct.ap_uint<32>"]* %11 to %"struct.ap_uint<32>"*
  %23 = bitcast [32 x %"struct.ap_uint<32>"]* %13 to %"struct.ap_uint<32>"*
  %24 = bitcast [32 x float]* %4 to float*
  %25 = bitcast [32 x float]* %5 to float*
  %26 = bitcast [16384 x %"struct.ap_uint<32>"]* %15 to %"struct.ap_uint<32>"*
  call void @rv32_core_step_hw_stub(%"struct.ap_uint<32>"* %0, %"struct.ap_uint<32>"* %1, %"struct.ap_uint<32>"* %22, %"struct.ap_uint<32>"* %23, float* %24, float* %25, %"struct.ap_uint<32>"* %26, %"struct.ap_uint<32>"* %17, %"struct.ap_uint<3>"* %19, %"struct.ap_uint<1>"* %21)
  call void @copy_in([32 x %"struct.ap_uint<32>"]* %11, [32 x i32]* %2, [32 x %"struct.ap_uint<32>"]* %13, [32 x i32]* %3, [32 x float]* null, [32 x float]* %4, [32 x float]* null, [32 x float]* %5, [16384 x %"struct.ap_uint<32>"]* %15, [16384 x i32]* %6, %"struct.ap_uint<32>"* %17, i32* %7, %"struct.ap_uint<3>"* %19, i3* %8, %"struct.ap_uint<1>"* %21, i1* %9)
  call void @free(i8* %10)
  call void @free(i8* %12)
  call void @free(i8* %14)
  call void @free(i8* %16)
  call void @free(i8* %18)
  call void @free(i8* %20)
  ret void
}

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
