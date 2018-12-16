#ifndef _ALTERA_HPS_0_H_
#define _ALTERA_HPS_0_H_

/*
 * This file was automatically generated by the swinfo2header utility.
 * 
 * Created from SOPC Builder system 'soc_system' in
 * file './soc_system.sopcinfo'.
 */

/*
 * This file contains macros for module 'hps_0' and devices
 * connected to the following master:
 *   h2f_lw_axi_master
 * 
 * Do not include this header file and another header file created for a
 * different module or master group at the same time.
 * Doing so may result in duplicate macro names.
 * Instead, use the system header file which has macros with unique names.
 */

/*
 * Macros for device 'memory_m', class 'altera_avalon_onchip_memory2'
 * The macros are prefixed with 'MEMORY_M_'.
 * The prefix is the slave descriptor.
 */
#define MEMORY_M_COMPONENT_TYPE altera_avalon_onchip_memory2
#define MEMORY_M_COMPONENT_NAME memory_m
#define MEMORY_M_BASE 0x0
#define MEMORY_M_SPAN 262144
#define MEMORY_M_END 0x3ffff
#define MEMORY_M_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define MEMORY_M_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define MEMORY_M_CONTENTS_INFO ""
#define MEMORY_M_DUAL_PORT 1
#define MEMORY_M_GUI_RAM_BLOCK_TYPE AUTO
#define MEMORY_M_INIT_CONTENTS_FILE soc_system_memory_m
#define MEMORY_M_INIT_MEM_CONTENT 1
#define MEMORY_M_INSTANCE_ID NONE
#define MEMORY_M_NON_DEFAULT_INIT_FILE_ENABLED 0
#define MEMORY_M_RAM_BLOCK_TYPE AUTO
#define MEMORY_M_READ_DURING_WRITE_MODE DONT_CARE
#define MEMORY_M_SINGLE_CLOCK_OP 0
#define MEMORY_M_SIZE_MULTIPLE 1
#define MEMORY_M_SIZE_VALUE 262144
#define MEMORY_M_WRITABLE 1
#define MEMORY_M_MEMORY_INFO_DAT_SYM_INSTALL_DIR SIM_DIR
#define MEMORY_M_MEMORY_INFO_GENERATE_DAT_SYM 1
#define MEMORY_M_MEMORY_INFO_GENERATE_HEX 1
#define MEMORY_M_MEMORY_INFO_HAS_BYTE_LANE 0
#define MEMORY_M_MEMORY_INFO_HEX_INSTALL_DIR QPF_DIR
#define MEMORY_M_MEMORY_INFO_MEM_INIT_DATA_WIDTH 32
#define MEMORY_M_MEMORY_INFO_MEM_INIT_FILENAME soc_system_memory_m

/*
 * Macros for device 'pio_0', class 'altera_avalon_pio'
 * The macros are prefixed with 'PIO_0_'.
 * The prefix is the slave descriptor.
 */
#define PIO_COMPONENT_TYPE altera_avalon_pio
#define PIO_COMPONENT_NAME pio_0
#define PIO_BASE 0x40000
#define PIO_SPAN 16
#define PIO_END 0x4000f
#define PIO_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_CAPTURE 0
#define PIO_DATA_WIDTH 1
#define PIO_DO_TEST_BENCH_WIRING 0
#define PIO_DRIVEN_SIM_VALUE 0
#define PIO_EDGE_TYPE NONE
#define PIO_FREQ 50000000
#define PIO_HAS_IN 0
#define PIO_HAS_OUT 1
#define PIO_HAS_TRI 0
#define PIO_IRQ_TYPE NONE
#define PIO_RESET_VALUE 0

/*
 * Macros for device 'm', class 'altera_avalon_pio'
 * The macros are prefixed with 'M_'.
 * The prefix is the slave descriptor.
 */
#define M_COMPONENT_TYPE altera_avalon_pio
#define M_COMPONENT_NAME m
#define M_BASE 0x40010
#define M_SPAN 16
#define M_END 0x4001f
#define M_BIT_CLEARING_EDGE_REGISTER 0
#define M_BIT_MODIFYING_OUTPUT_REGISTER 0
#define M_CAPTURE 0
#define M_DATA_WIDTH 8
#define M_DO_TEST_BENCH_WIRING 0
#define M_DRIVEN_SIM_VALUE 0
#define M_EDGE_TYPE NONE
#define M_FREQ 50000000
#define M_HAS_IN 0
#define M_HAS_OUT 1
#define M_HAS_TRI 0
#define M_IRQ_TYPE NONE
#define M_RESET_VALUE 0

/*
 * Macros for device 'h_7', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_7_'.
 * The prefix is the slave descriptor.
 */
#define H_7_COMPONENT_TYPE altera_avalon_pio
#define H_7_COMPONENT_NAME h_7
#define H_7_BASE 0x40020
#define H_7_SPAN 16
#define H_7_END 0x4002f
#define H_7_BIT_CLEARING_EDGE_REGISTER 0
#define H_7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_7_CAPTURE 0
#define H_7_DATA_WIDTH 32
#define H_7_DO_TEST_BENCH_WIRING 0
#define H_7_DRIVEN_SIM_VALUE 0
#define H_7_EDGE_TYPE NONE
#define H_7_FREQ 50000000
#define H_7_HAS_IN 1
#define H_7_HAS_OUT 0
#define H_7_HAS_TRI 0
#define H_7_IRQ_TYPE NONE
#define H_7_RESET_VALUE 0

/*
 * Macros for device 'h_6', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_6_'.
 * The prefix is the slave descriptor.
 */
#define H_6_COMPONENT_TYPE altera_avalon_pio
#define H_6_COMPONENT_NAME h_6
#define H_6_BASE 0x40030
#define H_6_SPAN 16
#define H_6_END 0x4003f
#define H_6_BIT_CLEARING_EDGE_REGISTER 0
#define H_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_6_CAPTURE 0
#define H_6_DATA_WIDTH 32
#define H_6_DO_TEST_BENCH_WIRING 0
#define H_6_DRIVEN_SIM_VALUE 0
#define H_6_EDGE_TYPE NONE
#define H_6_FREQ 50000000
#define H_6_HAS_IN 1
#define H_6_HAS_OUT 0
#define H_6_HAS_TRI 0
#define H_6_IRQ_TYPE NONE
#define H_6_RESET_VALUE 0

/*
 * Macros for device 'h_5', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_5_'.
 * The prefix is the slave descriptor.
 */
#define H_5_COMPONENT_TYPE altera_avalon_pio
#define H_5_COMPONENT_NAME h_5
#define H_5_BASE 0x40040
#define H_5_SPAN 16
#define H_5_END 0x4004f
#define H_5_BIT_CLEARING_EDGE_REGISTER 0
#define H_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_5_CAPTURE 0
#define H_5_DATA_WIDTH 32
#define H_5_DO_TEST_BENCH_WIRING 0
#define H_5_DRIVEN_SIM_VALUE 0
#define H_5_EDGE_TYPE NONE
#define H_5_FREQ 50000000
#define H_5_HAS_IN 1
#define H_5_HAS_OUT 0
#define H_5_HAS_TRI 0
#define H_5_IRQ_TYPE NONE
#define H_5_RESET_VALUE 0

/*
 * Macros for device 'h_4', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_4_'.
 * The prefix is the slave descriptor.
 */
#define H_4_COMPONENT_TYPE altera_avalon_pio
#define H_4_COMPONENT_NAME h_4
#define H_4_BASE 0x40050
#define H_4_SPAN 16
#define H_4_END 0x4005f
#define H_4_BIT_CLEARING_EDGE_REGISTER 0
#define H_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_4_CAPTURE 0
#define H_4_DATA_WIDTH 32
#define H_4_DO_TEST_BENCH_WIRING 0
#define H_4_DRIVEN_SIM_VALUE 0
#define H_4_EDGE_TYPE NONE
#define H_4_FREQ 50000000
#define H_4_HAS_IN 1
#define H_4_HAS_OUT 0
#define H_4_HAS_TRI 0
#define H_4_IRQ_TYPE NONE
#define H_4_RESET_VALUE 0

/*
 * Macros for device 'h_3', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_3_'.
 * The prefix is the slave descriptor.
 */
#define H_3_COMPONENT_TYPE altera_avalon_pio
#define H_3_COMPONENT_NAME h_3
#define H_3_BASE 0x40060
#define H_3_SPAN 16
#define H_3_END 0x4006f
#define H_3_BIT_CLEARING_EDGE_REGISTER 0
#define H_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_3_CAPTURE 0
#define H_3_DATA_WIDTH 32
#define H_3_DO_TEST_BENCH_WIRING 0
#define H_3_DRIVEN_SIM_VALUE 0
#define H_3_EDGE_TYPE NONE
#define H_3_FREQ 50000000
#define H_3_HAS_IN 1
#define H_3_HAS_OUT 0
#define H_3_HAS_TRI 0
#define H_3_IRQ_TYPE NONE
#define H_3_RESET_VALUE 0

/*
 * Macros for device 'h_2', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_2_'.
 * The prefix is the slave descriptor.
 */
#define H_2_COMPONENT_TYPE altera_avalon_pio
#define H_2_COMPONENT_NAME h_2
#define H_2_BASE 0x40070
#define H_2_SPAN 16
#define H_2_END 0x4007f
#define H_2_BIT_CLEARING_EDGE_REGISTER 0
#define H_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_2_CAPTURE 0
#define H_2_DATA_WIDTH 32
#define H_2_DO_TEST_BENCH_WIRING 0
#define H_2_DRIVEN_SIM_VALUE 0
#define H_2_EDGE_TYPE NONE
#define H_2_FREQ 50000000
#define H_2_HAS_IN 1
#define H_2_HAS_OUT 0
#define H_2_HAS_TRI 0
#define H_2_IRQ_TYPE NONE
#define H_2_RESET_VALUE 0

/*
 * Macros for device 'h_1', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_1_'.
 * The prefix is the slave descriptor.
 */
#define H_1_COMPONENT_TYPE altera_avalon_pio
#define H_1_COMPONENT_NAME h_1
#define H_1_BASE 0x40080
#define H_1_SPAN 16
#define H_1_END 0x4008f
#define H_1_BIT_CLEARING_EDGE_REGISTER 0
#define H_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_1_CAPTURE 0
#define H_1_DATA_WIDTH 32
#define H_1_DO_TEST_BENCH_WIRING 0
#define H_1_DRIVEN_SIM_VALUE 0
#define H_1_EDGE_TYPE NONE
#define H_1_FREQ 50000000
#define H_1_HAS_IN 1
#define H_1_HAS_OUT 0
#define H_1_HAS_TRI 0
#define H_1_IRQ_TYPE NONE
#define H_1_RESET_VALUE 0

/*
 * Macros for device 'h_0', class 'altera_avalon_pio'
 * The macros are prefixed with 'H_0_'.
 * The prefix is the slave descriptor.
 */
#define H_0_COMPONENT_TYPE altera_avalon_pio
#define H_0_COMPONENT_NAME h_0
#define H_0_BASE 0x40090
#define H_0_SPAN 16
#define H_0_END 0x4009f
#define H_0_BIT_CLEARING_EDGE_REGISTER 0
#define H_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define H_0_CAPTURE 0
#define H_0_DATA_WIDTH 32
#define H_0_DO_TEST_BENCH_WIRING 0
#define H_0_DRIVEN_SIM_VALUE 0
#define H_0_EDGE_TYPE NONE
#define H_0_FREQ 50000000
#define H_0_HAS_IN 1
#define H_0_HAS_OUT 0
#define H_0_HAS_TRI 0
#define H_0_IRQ_TYPE NONE
#define H_0_RESET_VALUE 0


#endif /* _ALTERA_HPS_0_H_ */