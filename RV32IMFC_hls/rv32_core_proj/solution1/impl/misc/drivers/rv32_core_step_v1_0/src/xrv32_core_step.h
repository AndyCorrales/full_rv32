// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XRV32_CORE_STEP_H
#define XRV32_CORE_STEP_H

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
#include "xrv32_core_step_hw.h"

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
    u64 Control_r_BaseAddress;
} XRv32_core_step_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
    u32 IsReady;
} XRv32_core_step;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRv32_core_step_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRv32_core_step_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRv32_core_step_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRv32_core_step_ReadReg(BaseAddress, RegOffset) \
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
int XRv32_core_step_Initialize(XRv32_core_step *InstancePtr, UINTPTR BaseAddress);
XRv32_core_step_Config* XRv32_core_step_LookupConfig(UINTPTR BaseAddress);
#else
int XRv32_core_step_Initialize(XRv32_core_step *InstancePtr, u16 DeviceId);
XRv32_core_step_Config* XRv32_core_step_LookupConfig(u16 DeviceId);
#endif
int XRv32_core_step_CfgInitialize(XRv32_core_step *InstancePtr, XRv32_core_step_Config *ConfigPtr);
#else
int XRv32_core_step_Initialize(XRv32_core_step *InstancePtr, const char* InstanceName);
int XRv32_core_step_Release(XRv32_core_step *InstancePtr);
#endif

void XRv32_core_step_Start(XRv32_core_step *InstancePtr);
u32 XRv32_core_step_IsDone(XRv32_core_step *InstancePtr);
u32 XRv32_core_step_IsIdle(XRv32_core_step *InstancePtr);
u32 XRv32_core_step_IsReady(XRv32_core_step *InstancePtr);
void XRv32_core_step_EnableAutoRestart(XRv32_core_step *InstancePtr);
void XRv32_core_step_DisableAutoRestart(XRv32_core_step *InstancePtr);

void XRv32_core_step_Set_mem(XRv32_core_step *InstancePtr, u64 Data);
u64 XRv32_core_step_Get_mem(XRv32_core_step *InstancePtr);

void XRv32_core_step_InterruptGlobalEnable(XRv32_core_step *InstancePtr);
void XRv32_core_step_InterruptGlobalDisable(XRv32_core_step *InstancePtr);
void XRv32_core_step_InterruptEnable(XRv32_core_step *InstancePtr, u32 Mask);
void XRv32_core_step_InterruptDisable(XRv32_core_step *InstancePtr, u32 Mask);
void XRv32_core_step_InterruptClear(XRv32_core_step *InstancePtr, u32 Mask);
u32 XRv32_core_step_InterruptGetEnabled(XRv32_core_step *InstancePtr);
u32 XRv32_core_step_InterruptGetStatus(XRv32_core_step *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
