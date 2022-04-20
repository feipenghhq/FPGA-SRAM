# TCL File Generated by Component Editor 13.0sp1
# Tue Apr 19 17:14:04 PDT 2022
# DO NOT MODIFY


# 
# avalon_sram_controller "Avalon MM Sram Controller" v1.0
# Heqing Huang 2022.04.19.17:14:04
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module avalon_sram_controller
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_sram_controller
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Memories and Memory Controllers/External Memory Interfaces/Memory Interfaces"
set_module_property AUTHOR "Heqing Huang"
set_module_property DISPLAY_NAME "Avalon MM Sram Controller"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_sram_controller
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file avalon_sram_controller.sv SYSTEM_VERILOG PATH avalon_sram_controller.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter SRAM_AW INTEGER 18 ""
set_parameter_property SRAM_AW DEFAULT_VALUE 18
set_parameter_property SRAM_AW DISPLAY_NAME SRAM_AW
set_parameter_property SRAM_AW WIDTH ""
set_parameter_property SRAM_AW TYPE INTEGER
set_parameter_property SRAM_AW UNITS None
set_parameter_property SRAM_AW ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SRAM_AW DESCRIPTION ""
set_parameter_property SRAM_AW HDL_PARAMETER true
add_parameter SRAM_DW INTEGER 16
set_parameter_property SRAM_DW DEFAULT_VALUE 16
set_parameter_property SRAM_DW DISPLAY_NAME SRAM_DW
set_parameter_property SRAM_DW TYPE INTEGER
set_parameter_property SRAM_DW UNITS None
set_parameter_property SRAM_DW ALLOWED_RANGES -2147483648:2147483647
set_parameter_property SRAM_DW HDL_PARAMETER true
add_parameter AVS_AW INTEGER 19
set_parameter_property AVS_AW DEFAULT_VALUE 19
set_parameter_property AVS_AW DISPLAY_NAME AVS_AW
set_parameter_property AVS_AW TYPE INTEGER
set_parameter_property AVS_AW UNITS None
set_parameter_property AVS_AW ALLOWED_RANGES -2147483648:2147483647
set_parameter_property AVS_AW HDL_PARAMETER true
add_parameter AVS_DW INTEGER 16
set_parameter_property AVS_DW DEFAULT_VALUE 16
set_parameter_property AVS_DW DISPLAY_NAME AVS_DW
set_parameter_property AVS_DW TYPE INTEGER
set_parameter_property AVS_DW UNITS None
set_parameter_property AVS_DW ALLOWED_RANGES -2147483648:2147483647
set_parameter_property AVS_DW HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point avs
# 
add_interface avs avalon end
set_interface_property avs addressUnits SYMBOLS
set_interface_property avs associatedClock clock
set_interface_property avs associatedReset reset
set_interface_property avs bitsPerSymbol 8
set_interface_property avs burstOnBurstBoundariesOnly false
set_interface_property avs burstcountUnits WORDS
set_interface_property avs explicitAddressSpan 0
set_interface_property avs holdTime 0
set_interface_property avs isMemoryDevice true
set_interface_property avs linewrapBursts false
set_interface_property avs maximumPendingReadTransactions 0
set_interface_property avs readLatency 1
set_interface_property avs readWaitStates 0
set_interface_property avs readWaitTime 0
set_interface_property avs setupTime 0
set_interface_property avs timingUnits Cycles
set_interface_property avs writeWaitTime 0
set_interface_property avs ENABLED true
set_interface_property avs EXPORT_OF ""
set_interface_property avs PORT_NAME_MAP ""
set_interface_property avs SVD_ADDRESS_GROUP ""

add_interface_port avs avs_read read Input 1
add_interface_port avs avs_write write Input 1
add_interface_port avs avs_address address Input AVS_AW
add_interface_port avs avs_writedata writedata Input AVS_DW
add_interface_port avs avs_readdata readdata Output AVS_DW
add_interface_port avs avs_byteenable byteenable Input AVS_DW/8
set_interface_assignment avs embeddedsw.configuration.isFlash 0
set_interface_assignment avs embeddedsw.configuration.isMemoryDevice 1
set_interface_assignment avs embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avs embeddedsw.configuration.isPrintableDevice 0


# 
# connection point sram
# 
add_interface sram conduit end
set_interface_property sram associatedClock ""
set_interface_property sram associatedReset ""
set_interface_property sram ENABLED true
set_interface_property sram EXPORT_OF ""
set_interface_property sram PORT_NAME_MAP ""
set_interface_property sram SVD_ADDRESS_GROUP ""

add_interface_port sram sram_dq_read export Input SRAM_DW
add_interface_port sram sram_we_n export Output 1
add_interface_port sram sram_be_n export Output SRAM_DW/8
add_interface_port sram sram_addr export Output SRAM_AW
add_interface_port sram sram_dq_write export Output SRAM_DW
add_interface_port sram sram_dq_en export Output SRAM_DW
add_interface_port sram sram_oe_n export Output 1
add_interface_port sram sram_ce_n export Output 1
