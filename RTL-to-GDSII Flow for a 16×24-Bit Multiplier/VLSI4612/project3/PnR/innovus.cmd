#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon Mar 10 21:13:56 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.17-s075_1 (64bit) 03/15/2023 11:17 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.17-s075_1 NR230308-2354/21_17-UB (database version 18.20.604) {superthreading v2.17}
#@(#)CDS: AAE 21.17-s026 (64bit) 03/15/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.17-s025_1 () Mar 14 2023 11:00:06 ( )
#@(#)CDS: SYNTECH 21.17-s007_1 () Feb 20 2023 06:56:35 ( )
#@(#)CDS: CPE v21.17-s068
#@(#)CDS: IQuantus/TQuantus 21.1.1-s939 (64bit) Wed Nov 9 09:34:24 PST 2022 (Linux 3.10.0-693.el7.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
define_proc_arguments ViaFillQor -info {This procedure extracts Viafill details from innovus db} -define_args {
		{-window "window coordinates" "" list optional}
		{-window_size "window size in microns" "" string optional}
	
	}
define_proc_arguments ProcessFills -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
				{-csvName "File path for Fill Data csv file" "Path of CSV file" string required}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list required}
    {-output_data "Boolean Flag to output Fill Data for further processing" "" string required}
}
define_proc_arguments FillQor -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list optional}
				{-outData "Boolean Flag to output Fill Data for further processing" "" boolean optional}
    {-outDataFile "File path for Fill Data csv file" "Path of CSV file" string optional}
}
define_proc_arguments ProcessFills_fast -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
				{-csvName "File path for Fill Data csv file" "Path of CSV file" string required}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list required}
    {-output_data "Boolean Flag to output Fill Data for further processing" "" string required}
}
define_proc_arguments FillQor_fast -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
				{-selectFill "type of fill to be selected in session" "list of BRIDGE/EXTENSION/STAMP/FLOATING" list optional}
				{-outData "Boolean Flag to output Fill Data for further processing" "" boolean optional}
    {-outDataFile "File path for Fill Data csv file" "Path of CSV file" string optional}
}
define_proc_arguments ProcessFills_fast_stampOnly -info {This procedure processes Fill types} -define_args {
    {-fillInfo "Design Fill data" "" list required}
	
}
define_proc_arguments FillQor_fast_stampOnly -info {This procedure extracts fill details from innovus db} -define_args {
    {-layers "Fills Cleanup on which all layers" "list of Metal/Routing layers" list optional}
}
win
set ::TimeLib::tsgMarkCellLatchConstructFlag 1
get_message -id GLOBAL-100 -suppress
get_message -id GLOBAL-100 -suppress
set _timing_save_restore_compression_mode hybrid
set conf_qxconf_file NULL
set conf_qxlib_file NULL
set defHierChar /
set distributed_client_message_echo 1
set distributed_mmmc_disable_reports_auto_redirection 0
set gpsPrivate::dpgNewAddBufsDBUpdate 1
set gpsPrivate::lsgEnableNewDbApiInRestruct 1
set init_lef_file {
    "/CMC/kits/cadence/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef"
    "/CMC/kits/cadence/GPDK045/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef"
}
set init_verilog ../Synthesis/netlist/genus_mult_unsigned.v
set init_top_cell mult_unsigned
set init_mmmc_file ./scripts/mmmc.view
set init_pwr_net VDD
set init_gnd_net VSS
get_message -id GLOBAL-100 -suppress
get_message -id GLOBAL-100 -suppress
set latch_time_borrow_mode max_borrow
set pegDefaultResScaleFactor 1.000000
set pegDetailResScaleFactor 1.000000
get_message -id GLOBAL-100 -suppress
get_message -id GLOBAL-100 -suppress
set report_inactive_arcs_format {from to when arc_type sense reason}
set timing_library_float_precision_tol 0.000010
set timing_library_load_pin_cap_indices {}
set timing_library_write_library_to_directory {}
set tso_post_client_restore_command {update_timing ; write_eco_opt_db ;}
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.954137180185 0.699975 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal1 bottom Metal1 left Metal2 right Metal2} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
zoomBox 3.80050 -5.33900 83.64950 72.89250
zoomBox 10.66000 -4.19200 78.53200 62.30500
zoomBox -223.19250 -177.71550 182.39650 219.65700
zoomBox -272.75450 -214.49200 204.40950 253.00550
zoomBox -480.36400 -368.54250 296.61850 392.70000
fit
zoomIn
zoomIn
zoomIn
zoomBox 38.52150 37.35950 47.10400 41.13000
zoomBox 24.09250 27.35550 67.68950 46.50800
zoomBox -35.50450 -13.96900 152.72400 68.72100
zoomBox -163.59450 -102.78400 335.48800 116.46600
zoomBox -199.88600 -127.94800 387.27050 129.99350
zoomBox -64.75700 -24.10600 195.76900 90.34450
zoomBox -48.59000 -11.68250 172.85750 85.60100
zoomBox -34.84850 -1.12200 153.38250 81.56900
