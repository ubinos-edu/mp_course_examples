/*
 * Copyright (c) 2022 Sung Ho Park and CSOS
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <ubinos_config.h>

    .syntax unified
    .arch   armv7-m


    .text
    .thumb

    .thumb_func
    .align  1
    .globl  appmain
    .type   appmain, %function
appmain:
    @@@@
    mov     r0, #0
    mrs     r0, control
    msr     control, r0

    mrs     r0, control
    orr     r0, #0x2
    msr     control, r0

    add     sp, #0x20

    mrs     r0, control
    and     r0, #0xfffffffd
    msr     control, r0

    mrs     r0, control
    orr     r0, #0x2
    msr     control, r0

    mov     r0, #0
    mrs     r0, msp

    mov     r0, #0
    mrs     r0, psp

    @@@@
    ldr     r1, =0xe000ed00 @ SCB
    mov     r2, #0
    ldr     r2, [r1] @ Read chip ID

    mrs     r0, control
    orr     r0, #0x1
    msr     control, r0

    mov     r0, #0
    mrs     r0, control

    ldr     r1, =0xe000ed00 @ SCB
    mov     r2, #0
    ldr     r2, [r1] @ Read chip ID

    bx      lr
