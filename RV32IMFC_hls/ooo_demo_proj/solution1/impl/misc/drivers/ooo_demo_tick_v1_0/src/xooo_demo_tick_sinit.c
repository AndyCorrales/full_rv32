// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xooo_demo_tick.h"

extern XOoo_demo_tick_Config XOoo_demo_tick_ConfigTable[];

#ifdef SDT
XOoo_demo_tick_Config *XOoo_demo_tick_LookupConfig(UINTPTR BaseAddress) {
	XOoo_demo_tick_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XOoo_demo_tick_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XOoo_demo_tick_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XOoo_demo_tick_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOoo_demo_tick_Initialize(XOoo_demo_tick *InstancePtr, UINTPTR BaseAddress) {
	XOoo_demo_tick_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOoo_demo_tick_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOoo_demo_tick_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XOoo_demo_tick_Config *XOoo_demo_tick_LookupConfig(u16 DeviceId) {
	XOoo_demo_tick_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XOOO_DEMO_TICK_NUM_INSTANCES; Index++) {
		if (XOoo_demo_tick_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XOoo_demo_tick_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOoo_demo_tick_Initialize(XOoo_demo_tick *InstancePtr, u16 DeviceId) {
	XOoo_demo_tick_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOoo_demo_tick_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOoo_demo_tick_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

