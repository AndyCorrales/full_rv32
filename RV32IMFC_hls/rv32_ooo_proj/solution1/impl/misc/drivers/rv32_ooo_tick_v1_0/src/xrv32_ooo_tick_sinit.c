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
#include "xrv32_ooo_tick.h"

extern XRv32_ooo_tick_Config XRv32_ooo_tick_ConfigTable[];

#ifdef SDT
XRv32_ooo_tick_Config *XRv32_ooo_tick_LookupConfig(UINTPTR BaseAddress) {
	XRv32_ooo_tick_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XRv32_ooo_tick_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XRv32_ooo_tick_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XRv32_ooo_tick_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRv32_ooo_tick_Initialize(XRv32_ooo_tick *InstancePtr, UINTPTR BaseAddress) {
	XRv32_ooo_tick_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRv32_ooo_tick_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRv32_ooo_tick_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XRv32_ooo_tick_Config *XRv32_ooo_tick_LookupConfig(u16 DeviceId) {
	XRv32_ooo_tick_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRV32_OOO_TICK_NUM_INSTANCES; Index++) {
		if (XRv32_ooo_tick_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRv32_ooo_tick_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRv32_ooo_tick_Initialize(XRv32_ooo_tick *InstancePtr, u16 DeviceId) {
	XRv32_ooo_tick_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRv32_ooo_tick_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRv32_ooo_tick_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

