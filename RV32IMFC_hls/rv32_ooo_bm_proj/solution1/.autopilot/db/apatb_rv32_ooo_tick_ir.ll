; ModuleID = '/media/andy/9cf23886-b985-4f84-a422-2da06e76f300/home/byovsh/Documents/Vscode/Proyecto/RV32IMFC_hls/rv32_ooo_bm_proj/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.ap_uint<5>" = type { %"struct.ap_int_base<5, false>" }
%"struct.ap_int_base<5, false>" = type { %"struct.ssdm_int<5, false>" }
%"struct.ssdm_int<5, false>" = type { i5 }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline willreturn
define void @apatb_rv32_ooo_tick_ir(%"struct.ap_uint<1>"* nocapture readonly %reset, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %imem, %"struct.ap_uint<32>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="64" %dmem, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %disp_valid, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %disp_tag, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %disp_pc, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %alu0_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %alu0_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %alu1_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %alu1_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %md_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %md_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %fpu_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %fpu_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %lsu_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %lsu_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %br_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %br_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %vec_done, %"struct.ap_uint<3>"* noalias nocapture nonnull dereferenceable(1) %vec_tag, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %commit_valid, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %commit_is_fp, %"struct.ap_uint<5>"* noalias nocapture nonnull dereferenceable(1) %commit_rd, %"struct.ap_uint<32>"* noalias nocapture nonnull dereferenceable(4) %commit_value, %"struct.ap_uint<32>"* noalias nocapture nonnull "fpga.decayed.dim.hint"="128" %vregs_out, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %halted) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_uint<32>"* %imem to [64 x %"struct.ap_uint<32>"]*
  %imem_copy = alloca [64 x i32], align 512
  %1 = bitcast %"struct.ap_uint<32>"* %dmem to [64 x %"struct.ap_uint<32>"]*
  %dmem_copy = alloca [64 x i32], align 512
  %disp_valid_copy = alloca i1, align 512
  %disp_tag_copy = alloca i3, align 512
  %disp_pc_copy = alloca i32, align 512
  %alu0_done_copy = alloca i1, align 512
  %alu0_tag_copy = alloca i3, align 512
  %alu1_done_copy = alloca i1, align 512
  %alu1_tag_copy = alloca i3, align 512
  %md_done_copy = alloca i1, align 512
  %md_tag_copy = alloca i3, align 512
  %fpu_done_copy = alloca i1, align 512
  %fpu_tag_copy = alloca i3, align 512
  %lsu_done_copy = alloca i1, align 512
  %lsu_tag_copy = alloca i3, align 512
  %br_done_copy = alloca i1, align 512
  %br_tag_copy = alloca i3, align 512
  %vec_done_copy = alloca i1, align 512
  %vec_tag_copy = alloca i3, align 512
  %commit_valid_copy = alloca i1, align 512
  %commit_is_fp_copy = alloca i1, align 512
  %commit_rd_copy = alloca i5, align 512
  %commit_value_copy = alloca i32, align 512
  %2 = bitcast %"struct.ap_uint<32>"* %vregs_out to [128 x %"struct.ap_uint<32>"]*
  %vregs_out_copy = alloca [128 x i32], align 512
  %halted_copy = alloca i1, align 512
  call fastcc void @copy_in([64 x %"struct.ap_uint<32>"]* nonnull %0, [64 x i32]* nonnull align 512 %imem_copy, [64 x %"struct.ap_uint<32>"]* nonnull %1, [64 x i32]* nonnull align 512 %dmem_copy, %"struct.ap_uint<1>"* nonnull %disp_valid, i1* nonnull align 512 %disp_valid_copy, %"struct.ap_uint<3>"* nonnull %disp_tag, i3* nonnull align 512 %disp_tag_copy, %"struct.ap_uint<32>"* nonnull %disp_pc, i32* nonnull align 512 %disp_pc_copy, %"struct.ap_uint<1>"* nonnull %alu0_done, i1* nonnull align 512 %alu0_done_copy, %"struct.ap_uint<3>"* nonnull %alu0_tag, i3* nonnull align 512 %alu0_tag_copy, %"struct.ap_uint<1>"* nonnull %alu1_done, i1* nonnull align 512 %alu1_done_copy, %"struct.ap_uint<3>"* nonnull %alu1_tag, i3* nonnull align 512 %alu1_tag_copy, %"struct.ap_uint<1>"* nonnull %md_done, i1* nonnull align 512 %md_done_copy, %"struct.ap_uint<3>"* nonnull %md_tag, i3* nonnull align 512 %md_tag_copy, %"struct.ap_uint<1>"* nonnull %fpu_done, i1* nonnull align 512 %fpu_done_copy, %"struct.ap_uint<3>"* nonnull %fpu_tag, i3* nonnull align 512 %fpu_tag_copy, %"struct.ap_uint<1>"* nonnull %lsu_done, i1* nonnull align 512 %lsu_done_copy, %"struct.ap_uint<3>"* nonnull %lsu_tag, i3* nonnull align 512 %lsu_tag_copy, %"struct.ap_uint<1>"* nonnull %br_done, i1* nonnull align 512 %br_done_copy, %"struct.ap_uint<3>"* nonnull %br_tag, i3* nonnull align 512 %br_tag_copy, %"struct.ap_uint<1>"* nonnull %vec_done, i1* nonnull align 512 %vec_done_copy, %"struct.ap_uint<3>"* nonnull %vec_tag, i3* nonnull align 512 %vec_tag_copy, %"struct.ap_uint<1>"* nonnull %commit_valid, i1* nonnull align 512 %commit_valid_copy, %"struct.ap_uint<1>"* nonnull %commit_is_fp, i1* nonnull align 512 %commit_is_fp_copy, %"struct.ap_uint<5>"* nonnull %commit_rd, i5* nonnull align 512 %commit_rd_copy, %"struct.ap_uint<32>"* nonnull %commit_value, i32* nonnull align 512 %commit_value_copy, [128 x %"struct.ap_uint<32>"]* nonnull %2, [128 x i32]* nonnull align 512 %vregs_out_copy, %"struct.ap_uint<1>"* nonnull %halted, i1* nonnull align 512 %halted_copy)
  call void @apatb_rv32_ooo_tick_hw(%"struct.ap_uint<1>"* %reset, [64 x i32]* %imem_copy, [64 x i32]* %dmem_copy, i1* %disp_valid_copy, i3* %disp_tag_copy, i32* %disp_pc_copy, i1* %alu0_done_copy, i3* %alu0_tag_copy, i1* %alu1_done_copy, i3* %alu1_tag_copy, i1* %md_done_copy, i3* %md_tag_copy, i1* %fpu_done_copy, i3* %fpu_tag_copy, i1* %lsu_done_copy, i3* %lsu_tag_copy, i1* %br_done_copy, i3* %br_tag_copy, i1* %vec_done_copy, i3* %vec_tag_copy, i1* %commit_valid_copy, i1* %commit_is_fp_copy, i5* %commit_rd_copy, i32* %commit_value_copy, [128 x i32]* %vregs_out_copy, i1* %halted_copy)
  call void @copy_back([64 x %"struct.ap_uint<32>"]* %0, [64 x i32]* %imem_copy, [64 x %"struct.ap_uint<32>"]* %1, [64 x i32]* %dmem_copy, %"struct.ap_uint<1>"* %disp_valid, i1* %disp_valid_copy, %"struct.ap_uint<3>"* %disp_tag, i3* %disp_tag_copy, %"struct.ap_uint<32>"* %disp_pc, i32* %disp_pc_copy, %"struct.ap_uint<1>"* %alu0_done, i1* %alu0_done_copy, %"struct.ap_uint<3>"* %alu0_tag, i3* %alu0_tag_copy, %"struct.ap_uint<1>"* %alu1_done, i1* %alu1_done_copy, %"struct.ap_uint<3>"* %alu1_tag, i3* %alu1_tag_copy, %"struct.ap_uint<1>"* %md_done, i1* %md_done_copy, %"struct.ap_uint<3>"* %md_tag, i3* %md_tag_copy, %"struct.ap_uint<1>"* %fpu_done, i1* %fpu_done_copy, %"struct.ap_uint<3>"* %fpu_tag, i3* %fpu_tag_copy, %"struct.ap_uint<1>"* %lsu_done, i1* %lsu_done_copy, %"struct.ap_uint<3>"* %lsu_tag, i3* %lsu_tag_copy, %"struct.ap_uint<1>"* %br_done, i1* %br_done_copy, %"struct.ap_uint<3>"* %br_tag, i3* %br_tag_copy, %"struct.ap_uint<1>"* %vec_done, i1* %vec_done_copy, %"struct.ap_uint<3>"* %vec_tag, i3* %vec_tag_copy, %"struct.ap_uint<1>"* %commit_valid, i1* %commit_valid_copy, %"struct.ap_uint<1>"* %commit_is_fp, i1* %commit_is_fp_copy, %"struct.ap_uint<5>"* %commit_rd, i5* %commit_rd_copy, %"struct.ap_uint<32>"* %commit_value, i32* %commit_value_copy, [128 x %"struct.ap_uint<32>"]* %2, [128 x i32]* %vregs_out_copy, %"struct.ap_uint<1>"* %halted, i1* %halted_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([64 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="0", [64 x i32]* noalias nocapture align 512 "unpacked"="1.0", [64 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="2", [64 x i32]* noalias nocapture align 512 "unpacked"="3.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="4", i1* noalias nocapture align 512 "unpacked"="5.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="6", i3* noalias nocapture align 512 "unpacked"="7.0", %"struct.ap_uint<32>"* noalias readonly "unpacked"="8", i32* noalias nocapture align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="10", i1* noalias nocapture align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="12", i3* noalias nocapture align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="14", i1* noalias nocapture align 512 "unpacked"="15.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="16", i3* noalias nocapture align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="18", i1* noalias nocapture align 512 "unpacked"="19.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="20", i3* noalias nocapture align 512 "unpacked"="21.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="22", i1* noalias nocapture align 512 "unpacked"="23.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="24", i3* noalias nocapture align 512 "unpacked"="25.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="26", i1* noalias nocapture align 512 "unpacked"="27.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="28", i3* noalias nocapture align 512 "unpacked"="29.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="30", i1* noalias nocapture align 512 "unpacked"="31.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="32", i3* noalias nocapture align 512 "unpacked"="33.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="34", i1* noalias nocapture align 512 "unpacked"="35.0", %"struct.ap_uint<3>"* noalias readonly "unpacked"="36", i3* noalias nocapture align 512 "unpacked"="37.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="38", i1* noalias nocapture align 512 "unpacked"="39.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="40", i1* noalias nocapture align 512 "unpacked"="41.0", %"struct.ap_uint<5>"* noalias readonly "unpacked"="42", i5* noalias nocapture align 512 "unpacked"="43.0", %"struct.ap_uint<32>"* noalias readonly "unpacked"="44", i32* noalias nocapture align 512 "unpacked"="45.0", [128 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="46", [128 x i32]* noalias nocapture align 512 "unpacked"="47.0", %"struct.ap_uint<1>"* noalias readonly "unpacked"="48", i1* noalias nocapture align 512 "unpacked"="49.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x i32]* align 512 %1, [64 x %"struct.ap_uint<32>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x i32]* align 512 %3, [64 x %"struct.ap_uint<32>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %5, %"struct.ap_uint<1>"* %4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %7, %"struct.ap_uint<3>"* %6)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %9, %"struct.ap_uint<32>"* %8)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %11, %"struct.ap_uint<1>"* %10)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %13, %"struct.ap_uint<3>"* %12)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %15, %"struct.ap_uint<1>"* %14)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %17, %"struct.ap_uint<3>"* %16)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %19, %"struct.ap_uint<1>"* %18)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %21, %"struct.ap_uint<3>"* %20)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %23, %"struct.ap_uint<1>"* %22)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %25, %"struct.ap_uint<3>"* %24)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %27, %"struct.ap_uint<1>"* %26)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %29, %"struct.ap_uint<3>"* %28)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %31, %"struct.ap_uint<1>"* %30)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %33, %"struct.ap_uint<3>"* %32)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %35, %"struct.ap_uint<1>"* %34)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* align 512 %37, %"struct.ap_uint<3>"* %36)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %39, %"struct.ap_uint<1>"* %38)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %41, %"struct.ap_uint<1>"* %40)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>.458"(i5* align 512 %43, %"struct.ap_uint<5>"* %42)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>"(i32* align 512 %45, %"struct.ap_uint<32>"* %44)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>.438"([128 x i32]* align 512 %47, [128 x %"struct.ap_uint<32>"]* %46)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(i1* align 512 %49, %"struct.ap_uint<1>"* %48)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>"(%"struct.ap_uint<5>"* noalias "unpacked"="0" %dst, i5* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<5>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<5>", %"struct.ap_uint<5>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i5* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* noalias "unpacked"="0" %dst, [128 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* nonnull %dst, [128 x i32]* %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [128 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
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
define internal fastcc void @copy_out([64 x %"struct.ap_uint<32>"]* noalias "unpacked"="0", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0", [64 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<1>"* noalias "unpacked"="4", i1* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<3>"* noalias "unpacked"="6", i3* noalias nocapture readonly align 512 "unpacked"="7.0", %"struct.ap_uint<32>"* noalias "unpacked"="8", i32* noalias nocapture readonly align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias "unpacked"="10", i1* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* noalias "unpacked"="12", i3* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0", %"struct.ap_uint<3>"* noalias "unpacked"="16", i3* noalias nocapture readonly align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias "unpacked"="18", i1* noalias nocapture readonly align 512 "unpacked"="19.0", %"struct.ap_uint<3>"* noalias "unpacked"="20", i3* noalias nocapture readonly align 512 "unpacked"="21.0", %"struct.ap_uint<1>"* noalias "unpacked"="22", i1* noalias nocapture readonly align 512 "unpacked"="23.0", %"struct.ap_uint<3>"* noalias "unpacked"="24", i3* noalias nocapture readonly align 512 "unpacked"="25.0", %"struct.ap_uint<1>"* noalias "unpacked"="26", i1* noalias nocapture readonly align 512 "unpacked"="27.0", %"struct.ap_uint<3>"* noalias "unpacked"="28", i3* noalias nocapture readonly align 512 "unpacked"="29.0", %"struct.ap_uint<1>"* noalias "unpacked"="30", i1* noalias nocapture readonly align 512 "unpacked"="31.0", %"struct.ap_uint<3>"* noalias "unpacked"="32", i3* noalias nocapture readonly align 512 "unpacked"="33.0", %"struct.ap_uint<1>"* noalias "unpacked"="34", i1* noalias nocapture readonly align 512 "unpacked"="35.0", %"struct.ap_uint<3>"* noalias "unpacked"="36", i3* noalias nocapture readonly align 512 "unpacked"="37.0", %"struct.ap_uint<1>"* noalias "unpacked"="38", i1* noalias nocapture readonly align 512 "unpacked"="39.0", %"struct.ap_uint<1>"* noalias "unpacked"="40", i1* noalias nocapture readonly align 512 "unpacked"="41.0", %"struct.ap_uint<5>"* noalias "unpacked"="42", i5* noalias nocapture readonly align 512 "unpacked"="43.0", %"struct.ap_uint<32>"* noalias "unpacked"="44", i32* noalias nocapture readonly align 512 "unpacked"="45.0", [128 x %"struct.ap_uint<32>"]* noalias "unpacked"="46", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="47.0", %"struct.ap_uint<1>"* noalias "unpacked"="48", i1* noalias nocapture readonly align 512 "unpacked"="49.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.538"([64 x %"struct.ap_uint<32>"]* %0, [64 x i32]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.538"([64 x %"struct.ap_uint<32>"]* %2, [64 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %4, i1* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %6, i3* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.450"(%"struct.ap_uint<32>"* %8, i32* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %10, i1* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %12, i3* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %16, i3* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %18, i1* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %20, i3* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %22, i1* align 512 %23)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %24, i3* align 512 %25)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %26, i1* align 512 %27)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %28, i3* align 512 %29)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %30, i1* align 512 %31)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %32, i3* align 512 %33)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %34, i1* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %36, i3* align 512 %37)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %38, i1* align 512 %39)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %40, i1* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>"(%"struct.ap_uint<5>"* %42, i5* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.450"(%"struct.ap_uint<32>"* %44, i32* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* %46, [128 x i32]* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %48, i1* align 512 %49)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* noalias "unpacked"="0" %dst, i1* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>.438"([128 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [128 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a128struct.ap_uint<32>.441"([128 x i32]* %dst, [128 x %"struct.ap_uint<32>"]* nonnull %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a128struct.ap_uint<32>.441"([128 x i32]* nocapture "unpacked"="0.0" %dst, [128 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
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

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.450"(%"struct.ap_uint<32>"* noalias "unpacked"="0" %dst, i32* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>.458"(i5* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<5>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<5>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<5>", %"struct.ap_uint<5>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i5* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst, align 512
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
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>.476"(i3* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<3>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
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
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>"([64 x i32]* noalias nocapture align 512 "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<32>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<32>.534"([64 x i32]* %dst, [64 x %"struct.ap_uint<32>"]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<32>.534"([64 x i32]* nocapture "unpacked"="0.0" %dst, [64 x %"struct.ap_uint<32>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
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
define internal fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.538"([64 x %"struct.ap_uint<32>"]* noalias "unpacked"="0" %dst, [64 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x %"struct.ap_uint<32>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a64struct.ap_uint<32>.541"([64 x %"struct.ap_uint<32>"]* nonnull %dst, [64 x i32]* %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a64struct.ap_uint<32>.541"([64 x %"struct.ap_uint<32>"]* "unpacked"="0" %dst, [64 x i32]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #3 {
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

declare i8* @malloc(i64)

declare void @free(i8*)

declare void @apatb_rv32_ooo_tick_hw(%"struct.ap_uint<1>"*, [64 x i32]*, [64 x i32]*, i1*, i3*, i32*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i1*, i5*, i32*, [128 x i32]*, i1*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([64 x %"struct.ap_uint<32>"]* noalias "unpacked"="0", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="1.0", [64 x %"struct.ap_uint<32>"]* noalias "unpacked"="2", [64 x i32]* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<1>"* noalias "unpacked"="4", i1* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<3>"* noalias "unpacked"="6", i3* noalias nocapture readonly align 512 "unpacked"="7.0", %"struct.ap_uint<32>"* noalias "unpacked"="8", i32* noalias nocapture readonly align 512 "unpacked"="9.0", %"struct.ap_uint<1>"* noalias "unpacked"="10", i1* noalias nocapture readonly align 512 "unpacked"="11.0", %"struct.ap_uint<3>"* noalias "unpacked"="12", i3* noalias nocapture readonly align 512 "unpacked"="13.0", %"struct.ap_uint<1>"* noalias "unpacked"="14", i1* noalias nocapture readonly align 512 "unpacked"="15.0", %"struct.ap_uint<3>"* noalias "unpacked"="16", i3* noalias nocapture readonly align 512 "unpacked"="17.0", %"struct.ap_uint<1>"* noalias "unpacked"="18", i1* noalias nocapture readonly align 512 "unpacked"="19.0", %"struct.ap_uint<3>"* noalias "unpacked"="20", i3* noalias nocapture readonly align 512 "unpacked"="21.0", %"struct.ap_uint<1>"* noalias "unpacked"="22", i1* noalias nocapture readonly align 512 "unpacked"="23.0", %"struct.ap_uint<3>"* noalias "unpacked"="24", i3* noalias nocapture readonly align 512 "unpacked"="25.0", %"struct.ap_uint<1>"* noalias "unpacked"="26", i1* noalias nocapture readonly align 512 "unpacked"="27.0", %"struct.ap_uint<3>"* noalias "unpacked"="28", i3* noalias nocapture readonly align 512 "unpacked"="29.0", %"struct.ap_uint<1>"* noalias "unpacked"="30", i1* noalias nocapture readonly align 512 "unpacked"="31.0", %"struct.ap_uint<3>"* noalias "unpacked"="32", i3* noalias nocapture readonly align 512 "unpacked"="33.0", %"struct.ap_uint<1>"* noalias "unpacked"="34", i1* noalias nocapture readonly align 512 "unpacked"="35.0", %"struct.ap_uint<3>"* noalias "unpacked"="36", i3* noalias nocapture readonly align 512 "unpacked"="37.0", %"struct.ap_uint<1>"* noalias "unpacked"="38", i1* noalias nocapture readonly align 512 "unpacked"="39.0", %"struct.ap_uint<1>"* noalias "unpacked"="40", i1* noalias nocapture readonly align 512 "unpacked"="41.0", %"struct.ap_uint<5>"* noalias "unpacked"="42", i5* noalias nocapture readonly align 512 "unpacked"="43.0", %"struct.ap_uint<32>"* noalias "unpacked"="44", i32* noalias nocapture readonly align 512 "unpacked"="45.0", [128 x %"struct.ap_uint<32>"]* noalias "unpacked"="46", [128 x i32]* noalias nocapture readonly align 512 "unpacked"="47.0", %"struct.ap_uint<1>"* noalias "unpacked"="48", i1* noalias nocapture readonly align 512 "unpacked"="49.0") unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a64struct.ap_uint<32>.538"([64 x %"struct.ap_uint<32>"]* %2, [64 x i32]* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %4, i1* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %6, i3* align 512 %7)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.450"(%"struct.ap_uint<32>"* %8, i32* align 512 %9)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %10, i1* align 512 %11)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %12, i3* align 512 %13)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %14, i1* align 512 %15)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %16, i3* align 512 %17)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %18, i1* align 512 %19)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %20, i3* align 512 %21)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %22, i1* align 512 %23)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %24, i3* align 512 %25)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %26, i1* align 512 %27)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %28, i3* align 512 %29)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %30, i1* align 512 %31)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %32, i3* align 512 %33)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %34, i1* align 512 %35)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<3>"(%"struct.ap_uint<3>"* %36, i3* align 512 %37)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %38, i1* align 512 %39)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %40, i1* align 512 %41)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>"(%"struct.ap_uint<5>"* %42, i5* align 512 %43)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<32>.450"(%"struct.ap_uint<32>"* %44, i32* align 512 %45)
  call fastcc void @"onebyonecpy_hls.p0a128struct.ap_uint<32>"([128 x %"struct.ap_uint<32>"]* %46, [128 x i32]* align 512 %47)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>.429"(%"struct.ap_uint<1>"* %48, i1* align 512 %49)
  ret void
}

declare void @rv32_ooo_tick_hw_stub(%"struct.ap_uint<1>"* nocapture readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull readonly, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<3>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull, %"struct.ap_uint<5>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<32>"* noalias nocapture nonnull, %"struct.ap_uint<1>"* noalias nocapture nonnull)

define void @rv32_ooo_tick_hw_stub_wrapper(%"struct.ap_uint<1>"*, [64 x i32]*, [64 x i32]*, i1*, i3*, i32*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i3*, i1*, i1*, i5*, i32*, [128 x i32]*, i1*) #5 {
entry:
  %26 = call i8* @malloc(i64 256)
  %27 = bitcast i8* %26 to [64 x %"struct.ap_uint<32>"]*
  %28 = call i8* @malloc(i64 256)
  %29 = bitcast i8* %28 to [64 x %"struct.ap_uint<32>"]*
  %30 = call i8* @malloc(i64 1)
  %31 = bitcast i8* %30 to %"struct.ap_uint<1>"*
  %32 = call i8* @malloc(i64 1)
  %33 = bitcast i8* %32 to %"struct.ap_uint<3>"*
  %34 = call i8* @malloc(i64 4)
  %35 = bitcast i8* %34 to %"struct.ap_uint<32>"*
  %36 = call i8* @malloc(i64 1)
  %37 = bitcast i8* %36 to %"struct.ap_uint<1>"*
  %38 = call i8* @malloc(i64 1)
  %39 = bitcast i8* %38 to %"struct.ap_uint<3>"*
  %40 = call i8* @malloc(i64 1)
  %41 = bitcast i8* %40 to %"struct.ap_uint<1>"*
  %42 = call i8* @malloc(i64 1)
  %43 = bitcast i8* %42 to %"struct.ap_uint<3>"*
  %44 = call i8* @malloc(i64 1)
  %45 = bitcast i8* %44 to %"struct.ap_uint<1>"*
  %46 = call i8* @malloc(i64 1)
  %47 = bitcast i8* %46 to %"struct.ap_uint<3>"*
  %48 = call i8* @malloc(i64 1)
  %49 = bitcast i8* %48 to %"struct.ap_uint<1>"*
  %50 = call i8* @malloc(i64 1)
  %51 = bitcast i8* %50 to %"struct.ap_uint<3>"*
  %52 = call i8* @malloc(i64 1)
  %53 = bitcast i8* %52 to %"struct.ap_uint<1>"*
  %54 = call i8* @malloc(i64 1)
  %55 = bitcast i8* %54 to %"struct.ap_uint<3>"*
  %56 = call i8* @malloc(i64 1)
  %57 = bitcast i8* %56 to %"struct.ap_uint<1>"*
  %58 = call i8* @malloc(i64 1)
  %59 = bitcast i8* %58 to %"struct.ap_uint<3>"*
  %60 = call i8* @malloc(i64 1)
  %61 = bitcast i8* %60 to %"struct.ap_uint<1>"*
  %62 = call i8* @malloc(i64 1)
  %63 = bitcast i8* %62 to %"struct.ap_uint<3>"*
  %64 = call i8* @malloc(i64 1)
  %65 = bitcast i8* %64 to %"struct.ap_uint<1>"*
  %66 = call i8* @malloc(i64 1)
  %67 = bitcast i8* %66 to %"struct.ap_uint<1>"*
  %68 = call i8* @malloc(i64 1)
  %69 = bitcast i8* %68 to %"struct.ap_uint<5>"*
  %70 = call i8* @malloc(i64 4)
  %71 = bitcast i8* %70 to %"struct.ap_uint<32>"*
  %72 = call i8* @malloc(i64 512)
  %73 = bitcast i8* %72 to [128 x %"struct.ap_uint<32>"]*
  %74 = call i8* @malloc(i64 1)
  %75 = bitcast i8* %74 to %"struct.ap_uint<1>"*
  call void @copy_out([64 x %"struct.ap_uint<32>"]* %27, [64 x i32]* %1, [64 x %"struct.ap_uint<32>"]* %29, [64 x i32]* %2, %"struct.ap_uint<1>"* %31, i1* %3, %"struct.ap_uint<3>"* %33, i3* %4, %"struct.ap_uint<32>"* %35, i32* %5, %"struct.ap_uint<1>"* %37, i1* %6, %"struct.ap_uint<3>"* %39, i3* %7, %"struct.ap_uint<1>"* %41, i1* %8, %"struct.ap_uint<3>"* %43, i3* %9, %"struct.ap_uint<1>"* %45, i1* %10, %"struct.ap_uint<3>"* %47, i3* %11, %"struct.ap_uint<1>"* %49, i1* %12, %"struct.ap_uint<3>"* %51, i3* %13, %"struct.ap_uint<1>"* %53, i1* %14, %"struct.ap_uint<3>"* %55, i3* %15, %"struct.ap_uint<1>"* %57, i1* %16, %"struct.ap_uint<3>"* %59, i3* %17, %"struct.ap_uint<1>"* %61, i1* %18, %"struct.ap_uint<3>"* %63, i3* %19, %"struct.ap_uint<1>"* %65, i1* %20, %"struct.ap_uint<1>"* %67, i1* %21, %"struct.ap_uint<5>"* %69, i5* %22, %"struct.ap_uint<32>"* %71, i32* %23, [128 x %"struct.ap_uint<32>"]* %73, [128 x i32]* %24, %"struct.ap_uint<1>"* %75, i1* %25)
  %76 = bitcast [64 x %"struct.ap_uint<32>"]* %27 to %"struct.ap_uint<32>"*
  %77 = bitcast [64 x %"struct.ap_uint<32>"]* %29 to %"struct.ap_uint<32>"*
  %78 = bitcast [128 x %"struct.ap_uint<32>"]* %73 to %"struct.ap_uint<32>"*
  call void @rv32_ooo_tick_hw_stub(%"struct.ap_uint<1>"* %0, %"struct.ap_uint<32>"* %76, %"struct.ap_uint<32>"* %77, %"struct.ap_uint<1>"* %31, %"struct.ap_uint<3>"* %33, %"struct.ap_uint<32>"* %35, %"struct.ap_uint<1>"* %37, %"struct.ap_uint<3>"* %39, %"struct.ap_uint<1>"* %41, %"struct.ap_uint<3>"* %43, %"struct.ap_uint<1>"* %45, %"struct.ap_uint<3>"* %47, %"struct.ap_uint<1>"* %49, %"struct.ap_uint<3>"* %51, %"struct.ap_uint<1>"* %53, %"struct.ap_uint<3>"* %55, %"struct.ap_uint<1>"* %57, %"struct.ap_uint<3>"* %59, %"struct.ap_uint<1>"* %61, %"struct.ap_uint<3>"* %63, %"struct.ap_uint<1>"* %65, %"struct.ap_uint<1>"* %67, %"struct.ap_uint<5>"* %69, %"struct.ap_uint<32>"* %71, %"struct.ap_uint<32>"* %78, %"struct.ap_uint<1>"* %75)
  call void @copy_in([64 x %"struct.ap_uint<32>"]* %27, [64 x i32]* %1, [64 x %"struct.ap_uint<32>"]* %29, [64 x i32]* %2, %"struct.ap_uint<1>"* %31, i1* %3, %"struct.ap_uint<3>"* %33, i3* %4, %"struct.ap_uint<32>"* %35, i32* %5, %"struct.ap_uint<1>"* %37, i1* %6, %"struct.ap_uint<3>"* %39, i3* %7, %"struct.ap_uint<1>"* %41, i1* %8, %"struct.ap_uint<3>"* %43, i3* %9, %"struct.ap_uint<1>"* %45, i1* %10, %"struct.ap_uint<3>"* %47, i3* %11, %"struct.ap_uint<1>"* %49, i1* %12, %"struct.ap_uint<3>"* %51, i3* %13, %"struct.ap_uint<1>"* %53, i1* %14, %"struct.ap_uint<3>"* %55, i3* %15, %"struct.ap_uint<1>"* %57, i1* %16, %"struct.ap_uint<3>"* %59, i3* %17, %"struct.ap_uint<1>"* %61, i1* %18, %"struct.ap_uint<3>"* %63, i3* %19, %"struct.ap_uint<1>"* %65, i1* %20, %"struct.ap_uint<1>"* %67, i1* %21, %"struct.ap_uint<5>"* %69, i5* %22, %"struct.ap_uint<32>"* %71, i32* %23, [128 x %"struct.ap_uint<32>"]* %73, [128 x i32]* %24, %"struct.ap_uint<1>"* %75, i1* %25)
  call void @free(i8* %26)
  call void @free(i8* %28)
  call void @free(i8* %30)
  call void @free(i8* %32)
  call void @free(i8* %34)
  call void @free(i8* %36)
  call void @free(i8* %38)
  call void @free(i8* %40)
  call void @free(i8* %42)
  call void @free(i8* %44)
  call void @free(i8* %46)
  call void @free(i8* %48)
  call void @free(i8* %50)
  call void @free(i8* %52)
  call void @free(i8* %54)
  call void @free(i8* %56)
  call void @free(i8* %58)
  call void @free(i8* %60)
  call void @free(i8* %62)
  call void @free(i8* %64)
  call void @free(i8* %66)
  call void @free(i8* %68)
  call void @free(i8* %70)
  call void @free(i8* %72)
  call void @free(i8* %74)
  ret void
}

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
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
