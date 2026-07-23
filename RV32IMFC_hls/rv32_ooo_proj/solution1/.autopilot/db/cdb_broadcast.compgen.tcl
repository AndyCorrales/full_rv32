# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 1 \
    name tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tag \
    op interface \
    ports { tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name value_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_value_r \
    op interface \
    ports { value_r { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name alu_rs_busy_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_busy_0 \
    op interface \
    ports { alu_rs_busy_0 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name alu_rs_s1_ready_0 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_ready_0 \
    op interface \
    ports { alu_rs_s1_ready_0_i { I 1 vector } alu_rs_s1_ready_0_o { O 1 vector } alu_rs_s1_ready_0_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name alu_rs_s1_tag_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_tag_0 \
    op interface \
    ports { alu_rs_s1_tag_0 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name alu_rs_s1_val_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_val_0 \
    op interface \
    ports { alu_rs_s1_val_0 { O 32 vector } alu_rs_s1_val_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name alu_rs_s2_ready_0 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_ready_0 \
    op interface \
    ports { alu_rs_s2_ready_0_i { I 1 vector } alu_rs_s2_ready_0_o { O 1 vector } alu_rs_s2_ready_0_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name alu_rs_s2_tag_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_tag_0 \
    op interface \
    ports { alu_rs_s2_tag_0 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name alu_rs_s2_val_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_val_0 \
    op interface \
    ports { alu_rs_s2_val_0 { O 32 vector } alu_rs_s2_val_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name alu_rs_busy_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_busy_1 \
    op interface \
    ports { alu_rs_busy_1 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name md_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_busy \
    op interface \
    ports { md_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name md_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s1_ready \
    op interface \
    ports { md_rs_s1_ready_i { I 1 vector } md_rs_s1_ready_o { O 1 vector } md_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name md_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s1_tag \
    op interface \
    ports { md_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name md_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s1_val \
    op interface \
    ports { md_rs_s1_val { O 32 vector } md_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name md_rs_s2_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s2_ready \
    op interface \
    ports { md_rs_s2_ready_i { I 1 vector } md_rs_s2_ready_o { O 1 vector } md_rs_s2_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name md_rs_s2_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s2_tag \
    op interface \
    ports { md_rs_s2_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name md_rs_s2_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_md_rs_s2_val \
    op interface \
    ports { md_rs_s2_val { O 32 vector } md_rs_s2_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name lsu_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_busy \
    op interface \
    ports { lsu_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name lsu_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s1_ready \
    op interface \
    ports { lsu_rs_s1_ready_i { I 1 vector } lsu_rs_s1_ready_o { O 1 vector } lsu_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name lsu_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s1_tag \
    op interface \
    ports { lsu_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name lsu_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s1_val \
    op interface \
    ports { lsu_rs_s1_val { O 8 vector } lsu_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name lsu_rs_s2_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s2_ready \
    op interface \
    ports { lsu_rs_s2_ready_i { I 1 vector } lsu_rs_s2_ready_o { O 1 vector } lsu_rs_s2_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name lsu_rs_s2_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s2_tag \
    op interface \
    ports { lsu_rs_s2_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name lsu_rs_s2_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_lsu_rs_s2_val \
    op interface \
    ports { lsu_rs_s2_val { O 32 vector } lsu_rs_s2_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name br_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_busy \
    op interface \
    ports { br_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name br_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s1_ready \
    op interface \
    ports { br_rs_s1_ready_i { I 1 vector } br_rs_s1_ready_o { O 1 vector } br_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name br_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s1_tag \
    op interface \
    ports { br_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name br_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s1_val \
    op interface \
    ports { br_rs_s1_val { O 32 vector } br_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name br_rs_s2_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s2_ready \
    op interface \
    ports { br_rs_s2_ready_i { I 1 vector } br_rs_s2_ready_o { O 1 vector } br_rs_s2_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name br_rs_s2_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s2_tag \
    op interface \
    ports { br_rs_s2_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name br_rs_s2_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_br_rs_s2_val \
    op interface \
    ports { br_rs_s2_val { O 32 vector } br_rs_s2_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name fpu_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_busy \
    op interface \
    ports { fpu_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name fpu_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s1_ready \
    op interface \
    ports { fpu_rs_s1_ready_i { I 1 vector } fpu_rs_s1_ready_o { O 1 vector } fpu_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name fpu_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s1_tag \
    op interface \
    ports { fpu_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name fpu_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s1_val \
    op interface \
    ports { fpu_rs_s1_val { O 32 vector } fpu_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name fpu_rs_s2_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s2_ready \
    op interface \
    ports { fpu_rs_s2_ready_i { I 1 vector } fpu_rs_s2_ready_o { O 1 vector } fpu_rs_s2_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name fpu_rs_s2_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s2_tag \
    op interface \
    ports { fpu_rs_s2_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name fpu_rs_s2_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s2_val \
    op interface \
    ports { fpu_rs_s2_val { O 32 vector } fpu_rs_s2_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name fpu_rs_s3_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s3_ready \
    op interface \
    ports { fpu_rs_s3_ready_i { I 1 vector } fpu_rs_s3_ready_o { O 1 vector } fpu_rs_s3_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name fpu_rs_s3_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s3_tag \
    op interface \
    ports { fpu_rs_s3_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name fpu_rs_s3_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_fpu_rs_s3_val \
    op interface \
    ports { fpu_rs_s3_val { O 32 vector } fpu_rs_s3_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name vec_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_vec_rs_busy \
    op interface \
    ports { vec_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name vec_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_vec_rs_s1_ready \
    op interface \
    ports { vec_rs_s1_ready_i { I 1 vector } vec_rs_s1_ready_o { O 1 vector } vec_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name vec_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_vec_rs_s1_tag \
    op interface \
    ports { vec_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name vec_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_vec_rs_s1_val \
    op interface \
    ports { vec_rs_s1_val { O 8 vector } vec_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name sys_rs_busy \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sys_rs_busy \
    op interface \
    ports { sys_rs_busy { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name sys_rs_s1_ready \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_sys_rs_s1_ready \
    op interface \
    ports { sys_rs_s1_ready_i { I 1 vector } sys_rs_s1_ready_o { O 1 vector } sys_rs_s1_ready_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name sys_rs_s1_tag \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sys_rs_s1_tag \
    op interface \
    ports { sys_rs_s1_tag { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name sys_rs_s1_val \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_sys_rs_s1_val \
    op interface \
    ports { sys_rs_s1_val { O 32 vector } sys_rs_s1_val_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name alu_rs_s1_ready_1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_ready_1 \
    op interface \
    ports { alu_rs_s1_ready_1_i { I 1 vector } alu_rs_s1_ready_1_o { O 1 vector } alu_rs_s1_ready_1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name alu_rs_s1_tag_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_tag_1 \
    op interface \
    ports { alu_rs_s1_tag_1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name alu_rs_s1_val_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s1_val_1 \
    op interface \
    ports { alu_rs_s1_val_1 { O 32 vector } alu_rs_s1_val_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name alu_rs_s2_ready_1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_ready_1 \
    op interface \
    ports { alu_rs_s2_ready_1_i { I 1 vector } alu_rs_s2_ready_1_o { O 1 vector } alu_rs_s2_ready_1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name alu_rs_s2_tag_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_tag_1 \
    op interface \
    ports { alu_rs_s2_tag_1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name alu_rs_s2_val_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_alu_rs_s2_val_1 \
    op interface \
    ports { alu_rs_s2_val_1 { O 32 vector } alu_rs_s2_val_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_ready { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


