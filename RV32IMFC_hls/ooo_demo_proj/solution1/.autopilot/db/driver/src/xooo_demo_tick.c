// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xooo_demo_tick.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XOoo_demo_tick_CfgInitialize(XOoo_demo_tick *InstancePtr, XOoo_demo_tick_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XOoo_demo_tick_Start(XOoo_demo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL) & 0x80;
    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XOoo_demo_tick_IsDone(XOoo_demo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XOoo_demo_tick_IsIdle(XOoo_demo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XOoo_demo_tick_IsReady(XOoo_demo_tick *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XOoo_demo_tick_EnableAutoRestart(XOoo_demo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XOoo_demo_tick_DisableAutoRestart(XOoo_demo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_AP_CTRL, 0);
}

void XOoo_demo_tick_InterruptGlobalEnable(XOoo_demo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_GIE, 1);
}

void XOoo_demo_tick_InterruptGlobalDisable(XOoo_demo_tick *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_GIE, 0);
}

void XOoo_demo_tick_InterruptEnable(XOoo_demo_tick *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_IER);
    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_IER, Register | Mask);
}

void XOoo_demo_tick_InterruptDisable(XOoo_demo_tick *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_IER);
    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_IER, Register & (~Mask));
}

void XOoo_demo_tick_InterruptClear(XOoo_demo_tick *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOoo_demo_tick_WriteReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_ISR, Mask);
}

u32 XOoo_demo_tick_InterruptGetEnabled(XOoo_demo_tick *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_IER);
}

u32 XOoo_demo_tick_InterruptGetStatus(XOoo_demo_tick *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOoo_demo_tick_ReadReg(InstancePtr->Control_BaseAddress, XOOO_DEMO_TICK_CONTROL_ADDR_ISR);
}

