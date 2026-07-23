// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xrv32_ooo_tick.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRv32_ooo_tick_CfgInitialize(XRv32_ooo_tick *InstancePtr, XRv32_ooo_tick_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRv32_ooo_tick_Start(XRv32_ooo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRv32_ooo_tick_IsDone(XRv32_ooo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRv32_ooo_tick_IsIdle(XRv32_ooo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRv32_ooo_tick_IsReady(XRv32_ooo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRv32_ooo_tick_EnableAutoRestart(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRv32_ooo_tick_DisableAutoRestart(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_AP_CTRL, 0);
}

void XRv32_ooo_tick_InterruptGlobalEnable(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_GIE, 1);
}

void XRv32_ooo_tick_InterruptGlobalDisable(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_GIE, 0);
}

void XRv32_ooo_tick_InterruptEnable(XRv32_ooo_tick *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_IER);
    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_IER, Register | Mask);
}

void XRv32_ooo_tick_InterruptDisable(XRv32_ooo_tick *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_IER);
    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRv32_ooo_tick_InterruptClear(XRv32_ooo_tick *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRv32_ooo_tick_WriteReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_ISR, Mask);
}

u32 XRv32_ooo_tick_InterruptGetEnabled(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_IER);
}

u32 XRv32_ooo_tick_InterruptGetStatus(XRv32_ooo_tick *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRv32_ooo_tick_ReadReg(InstancePtr->Control_BaseAddress, XRV32_OOO_TICK_CONTROL_ADDR_ISR);
}

