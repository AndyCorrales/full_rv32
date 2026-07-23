// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xrv32_vector_step.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRv32_vector_step_CfgInitialize(XRv32_vector_step *InstancePtr, XRv32_vector_step_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Control_r_BaseAddress = ConfigPtr->Control_r_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRv32_vector_step_Start(XRv32_vector_step *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRv32_vector_step_IsDone(XRv32_vector_step *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRv32_vector_step_IsIdle(XRv32_vector_step *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRv32_vector_step_IsReady(XRv32_vector_step *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRv32_vector_step_EnableAutoRestart(XRv32_vector_step *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRv32_vector_step_DisableAutoRestart(XRv32_vector_step *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_AP_CTRL, 0);
}

void XRv32_vector_step_Set_mem(XRv32_vector_step *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_r_BaseAddress, XRV32_VECTOR_STEP_CONTROL_R_ADDR_MEM_DATA, (u32)(Data));
    XRv32_vector_step_WriteReg(InstancePtr->Control_r_BaseAddress, XRV32_VECTOR_STEP_CONTROL_R_ADDR_MEM_DATA + 4, (u32)(Data >> 32));
}

u64 XRv32_vector_step_Get_mem(XRv32_vector_step *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_vector_step_ReadReg(InstancePtr->Control_r_BaseAddress, XRV32_VECTOR_STEP_CONTROL_R_ADDR_MEM_DATA);
    Data += (u64)XRv32_vector_step_ReadReg(InstancePtr->Control_r_BaseAddress, XRV32_VECTOR_STEP_CONTROL_R_ADDR_MEM_DATA + 4) << 32;
    return Data;
}

void XRv32_vector_step_InterruptGlobalEnable(XRv32_vector_step *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_GIE, 1);
}

void XRv32_vector_step_InterruptGlobalDisable(XRv32_vector_step *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_GIE, 0);
}

void XRv32_vector_step_InterruptEnable(XRv32_vector_step *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_IER);
    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_IER, Register | Mask);
}

void XRv32_vector_step_InterruptDisable(XRv32_vector_step *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_IER);
    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRv32_vector_step_InterruptClear(XRv32_vector_step *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_vector_step_WriteReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_ISR, Mask);
}

u32 XRv32_vector_step_InterruptGetEnabled(XRv32_vector_step *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_IER);
}

u32 XRv32_vector_step_InterruptGetStatus(XRv32_vector_step *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRv32_vector_step_ReadReg(InstancePtr->Control_BaseAddress, XRV32_VECTOR_STEP_CONTROL_ADDR_ISR);
}

