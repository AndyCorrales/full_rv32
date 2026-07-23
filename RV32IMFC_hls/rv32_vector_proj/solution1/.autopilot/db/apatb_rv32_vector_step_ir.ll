; ModuleID = '/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/rv32_vector_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_rv32_vector_step_ir(%"struct.ap_uint<32>"* nocapture readonly %instr, %"struct.ap_uint<32>"* nocapture readonly %rs1_val, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="128" %vregs_in, %"struct.ap_uint<32>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="128" %vregs_out, %"struct.ap_uint<32>"* noalias nocapture nonnull "maxi" %mem, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %halted) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_uint<32>"* %vregs_in to [128 x %"struct.ap_uint<32>"]*
  %vregs_in_copy = alloca [128 x i32], align 512
  %1 = bitcast %"struct.ap_uint<32>"* %vregs_out to [128 x %"struct.ap_uint<32>"]*
  %vregs_out_copy = alloca [128 x i32], align 512
  %2 = bitcast %"struct.ap_uint<32>"* %mem to [64 x %"struct.ap_uint<32>"]*
  %mem_copy = alloca [64 x i32], align 512
  %halted_copy = alloca i1, align 512
  call fastcc void @copy_in([128 x %"struct.ap_uint<32>"]* nonnull %0, [128 x i32]* nonnull align 512 %vregs_in_copy, [128 x %"struct.ap_uint<32>"]* nonnull %1, [128 x i32]* nonnull align 512 %vregs_out_copy, [64 x %"struct.ap_uint<32>"]* nonnull %2, [64 x i32]* nonnull align 512 %mem_copy, %"struct.ap_uint<1>"* nonnull %halted, i1* nonnull align 512 %halted_copy)
  call void @apatb_rv32_vector_step_hw(%"struct.ap_uint<32>"* %instr, %"struct.ap_uint<32>"* %rs1_val, [128 x i32]* %vregs_in_copy, [128 x i32]* %vregs_out_copy, [64 x i32]* %mem_copy, i1* %halted_copy)
  call void @copy_back([128 x %"struct.ap_uint<32>"]* %0, [128 x i32]* %vregs_in_copy, [128 x %"struct.ap_uint<32>"]* %1, [128 x i32]* %vregs_out_copy, [64 x %"struct.ap_uint<32>"]* %2, [64 x i32]* %mem_copy, %"struct.ap_uint<1>"* %halted, i1* %halted_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([128 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="0", [128 x i32]* noalias nocapture align 512 "unpacked"="1.0", [128 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="2", [128 x i32]* noalias nocapture align 512 "unpacked"="3.0", [64 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="4", [64 x i32]* noalias nocapture align 512 "unpacked"="5.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="6", i1* noalias nocapture align 512 "unpacked"="7.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>.53"([128 x i32]* align 512 %1, [128 x %"struct.ap_uint<32>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>.53"([128 x i32]* align 512 %3, [128 x %"struct.ap_uint<32>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.35"([64 x i32]* align 512 %5, [64 x %"struct.ap_uint<32>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %7, %"struct.ap_uint<1>"* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x %"struct.ap_uint<32>"]* noalias "unpacked"="0" %dst, [64 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<32>"([64 x %"struct.ap_uint<32>"]* nonnull %dst, [64 x i32]* %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<32>"([64 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [64 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x i32], [64 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [64 x %"struct.ap_uint<32>"], [64 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
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
define internal fastcc void @copy_out([128 x %"struct.ap_uint<32>"]* noalias "unpacked"="0", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0", [128 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [64 x %"struct.ap_uint<32>"]* noalias "unpacked"="4", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<1>"* noalias "unpacked"="6", i1* noalias nocapture readonly align 512 "unpacked"="7.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* %0, [128 x i32]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* %2, [128 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x %"struct.ap_uint<32>"]* %4, [64 x i32]* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.28"(%"struct.ap_uint<1>"* %6, i1* align 512 %7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.28"(%"struct.ap_uint<1>"* noalias "unpacked"="0" %dst, i1* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.35"([64 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<32>.38"([64 x i32]* %dst, [64 x %"struct.ap_uint<32>"]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<32>.38"([64 x i32]* nocapture "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [64 x %"struct.ap_uint<32>"], [64 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [64 x i32], [64 x i32]* %dst, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* noalias "unpacked"="0" %dst, [128 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a128struct.ap_uint<32>.49"([128 x %"struct.ap_uint<32>"]* nonnull %dst, [128 x i32]* %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a128struct.ap_uint<32>.49"([128 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [128 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [128 x i32], [128 x i32]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [128 x %"struct.ap_uint<32>"], [128 x %"struct.ap_uint<32>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
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
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>.53"([128 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [128 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a128struct.ap_uint<32>.56"([128 x i32]* %dst, [128 x %"struct.ap_uint<32>"]* nonnull %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a128struct.ap_uint<32>.56"([128 x i32]* nocapture "unpacked"="0.0" %dst, [128 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [128 x %"struct.ap_uint<32>"], [128 x %"struct.ap_uint<32>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [128 x i32], [128 x i32]* %dst, i64 0, i64 %for.loop.idx2
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

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_rv32_vector_step_hw(%"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, [128 x i32]*, [128 x i32]*, [64 x i32]*, i1*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([128 x %"struct.ap_uint<32>"]* noalias "unpacked"="0", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0", [128 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", [64 x %"struct.ap_uint<32>"]* noalias "unpacked"="4", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<1>"* noalias "unpacked"="6", i1* noalias nocapture readonly align 512 "unpacked"="7.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* %2, [128 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x %"struct.ap_uint<32>"]* %4, [64 x i32]* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.28"(%"struct.ap_uint<1>"* %6, i1* align 512 %7)
  ret void
}

declare void @rv32_vector_step_hw_stub(%"struct.ap_uint<32>"* nocapture readonly, %"struct.ap_uint<32>"* nocapture readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull)

define void @rv32_vector_step_hw_stub_wrapper(%"struct.ap_uint<32>"*, %"struct.ap_uint<32>"*, [128 x i32]*, [128 x i32]*, [64 x i32]*, i1*) #5 {
entry:
  %6 = call i8* @malloc(i64 512)
  %7 = bitcast i8* %6 to [128 x %"struct.ap_uint<32>"]*
  %8 = call i8* @malloc(i64 512)
  %9 = bitcast i8* %8 to [128 x %"struct.ap_uint<32>"]*
  %10 = call i8* @malloc(i64 256)
  %11 = bitcast i8* %10 to [64 x %"struct.ap_uint<32>"]*
  %12 = call i8* @malloc(i64 1)
  %13 = bitcast i8* %12 to %"struct.ap_uint<1>"*
  call void @copy_out([128 x %"struct.ap_uint<32>"]* %7, [128 x i32]* %2, [128 x %"struct.ap_uint<32>"]* %9, [128 x i32]* %3, [64 x %"struct.ap_uint<32>"]* %11, [64 x i32]* %4, %"struct.ap_uint<1>"* %13, i1* %5)
  %14 = bitcast [128 x %"struct.ap_uint<32>"]* %7 to %"struct.ap_uint<32>"*
  %15 = bitcast [128 x %"struct.ap_uint<32>"]* %9 to %"struct.ap_uint<32>"*
  %16 = bitcast [64 x %"struct.ap_uint<32>"]* %11 to %"struct.ap_uint<32>"*
  call void @rv32_vector_step_hw_stub(%"struct.ap_uint<32>"* %0, %"struct.ap_uint<32>"* %1, %"struct.ap_uint<32>"* %14, %"struct.ap_uint<32>"* %15, %"struct.ap_uint<32>"* %16, %"struct.ap_uint<1>"* %13)
  call void @copy_in([128 x %"struct.ap_uint<32>"]* %7, [128 x i32]* %2, [128 x %"struct.ap_uint<32>"]* %9, [128 x i32]* %3, [64 x %"struct.ap_uint<32>"]* %11, [64 x i32]* %4, %"struct.ap_uint<1>"* %13, i1* %5)
  call void @free(i8* %6)
  call void @free(i8* %8)
  call void @free(i8* %10)
  call void @free(i8* %12)
  ret void
}

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
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
