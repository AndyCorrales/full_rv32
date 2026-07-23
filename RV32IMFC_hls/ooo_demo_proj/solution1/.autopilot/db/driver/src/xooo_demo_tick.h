// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XOOO_DEMO_TICK_H
#define XOOO_DEMO_TICK_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xooo_demo_tick_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XOoo_demo_tick_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XOoo_demo_tick;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XOoo_demo_tick_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XOoo_demo_tick_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XOoo_demo_tick_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XOoo_demo_tick_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XOoo_demo_tick_Initialize(XOoo_demo_tick *InstancePtr, UINTPTR BaseAddress);
XOoo_demo_tick_Config* XOoo_demo_tick_LookupConfig(UINTPTR BaseAddress);
#else
int XOoo_demo_tick_Initialize(XOoo_demo_tick *InstancePtr, u16 DeviceId);
XOoo_demo_tick_Config* XOoo_demo_tick_LookupConfig(u16 DeviceId);
#endif
int XOoo_demo_tick_CfgInitialize(XOoo_demo_tick *InstancePtr, XOoo_demo_tick_Config *ConfigPtr);
#else
int XOoo_demo_tick_Initialize(XOoo_demo_tick *InstancePtr, const char* InstanceName);
int XOoo_demo_tick_Release(XOoo_demo_tick *InstancePtr);
#endif

void XOoo_demo_tick_Start(XOoo_demo_tick *InstancePtr);
u32 XOoo_demo_tick_IsDone(XOoo_demo_tick *InstancePtr);
u32 XOoo_demo_tick_IsIdle(XOoo_demo_tick *InstancePtr);
u32 XOoo_demo_tick_IsReady(XOoo_demo_tick *InstancePtr);
void XOoo_demo_tick_EnableAutoRestart(XOoo_demo_tick *InstancePtr);
void XOoo_demo_tick_DisableAutoRestart(XOoo_demo_tick *InstancePtr);


void XOoo_demo_tick_InterruptGlobalEnable(XOoo_demo_tick *InstancePtr);
void XOoo_demo_tick_InterruptGlobalDisable(XOoo_demo_tick *InstancePtr);
void XOoo_demo_tick_InterruptEnable(XOoo_demo_tick *InstancePtr, u32 Mask);
void XOoo_demo_tick_InterruptDisable(XOoo_demo_tick *InstancePtr, u32 Mask);
void XOoo_demo_tick_InterruptClear(XOoo_demo_tick *InstancePtr, u32 Mask);
u32 XOoo_demo_tick_InterruptGetEnabled(XOoo_demo_tick *InstancePtr);
u32 XOoo_demo_tick_InterruptGetStatus(XOoo_demo_tick *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
