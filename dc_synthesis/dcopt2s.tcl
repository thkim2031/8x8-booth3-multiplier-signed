# run this file with: dc_shell-xg-t -f dcopt.tcl | tee dcopt.out
#KashifInayatScript-INU
#DesignCompiler-Synopsys

set search_path [list .]

set edk_home /soc/vlsi/PDK/SAED32_EDK_01132015/
set io_dir $edk_home/lib/io_std
set pll_dir $edk_home/lib/pll
set stdcell_dir $edk_home/lib/stdcell_hvt

## Setup DB
set io_db_dir $io_dir/db_nldm
set pll_db_dir $pll_dir/db_nldm
set stdcell_db_dir $stdcell_dir/db_nldm

set synthetic_library dw_foundation.sldb

set link_library "*  $stdcell_db_dir/saed32hvt_ss0p95v125c.db   $pll_db_dir/saed32pll_ss0p95v125c_2p25v.db  $io_db_dir/saed32io_fc_ss0p95v125c_2p25v.db     $synthetic_library"
set target_library "  $stdcell_db_dir/saed32hvt_ss0p95v125c.db  $pll_db_dir/saed32pll_ss0p95v125c_2p25v.db   $io_db_dir/saed32io_fc_ss0p95v125c_2p25v.db  "
## Setup DB Done

#aet bitwidth 8
read_file -f verilog ../v_file/top.v
read_file -f verilog ../v_file/adder_3M.v
read_file -f verilog ../v_file/booth.v
read_file -f verilog ../v_file/cra.v
read_file -f verilog ../v_file/full_adder.v
read_file -f verilog ../v_file/half_adder.v
read_file -f verilog ../v_file/partial_product.v

#read_file -f verilog ./topdelay2s.v

set reports_dir reports
set final_reports_dir final_reports


if { ! [ file exists $reports_dir ] } {
         file mkdir $reports_dir
}
if { ! [ file exists $final_reports_dir ] } { 
         file mkdir $final_reports_dir 
} 

if { ! [ file exists designs] } {
         file mkdir designs
}




#set_dont_retime [get_cell s1*]
#set_dont_retime [get_cell d1*]
#set_dont_retime [get_cell t1*]
#set_dont_retime [get_cell q1*]
#set_dont_retime [get_cell n1*]
#set_dont_retime [get_cell my1*]
#set_dont_retime [get_cell tmy1*]
#set_dont_retime [get_cell product1*]
#set_register_type -exact [get_cells s1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells d1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells t1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells q1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells n1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells my1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells tmy1*] -flip_flop DFFX1_HVT
#set_register_type -exact [get_cells product1*] -flip_flop DFFX1_HVT

set current_design booth

ungroup -all -flatten


set current_design top


set target_clock_period 2.44

create_clock CLK -period $target_clock_period
set_input_delay 0 -clock CLK [all_inputs]

remove_input_delay [get_ports "CLK RST"]

set_output_delay 0 -clock CLK [all_outputs]

#set compile_disable_hierarchical_inverter_opt true


#optimize_registers
compile_ultra -gate_clock -no_autoungroup 



report_qor > $reports_dir/qor_report.txt
report_constraint -all_violators > $reports_dir/violator_report.txt
report_register -level_sensitive > $reports_dir/latch_report.txt
report_clock_gating > $reports_dir/clock_gating.txt
report_area
report_timing
report_power -hier > $reports_dir/power.txt



report_area > $final_reports_dir/area.txt
report_register > $final_reports_dir/register.txt
report_timing > $final_reports_dir/timing.txt

set current_design booth
#compile_ultra -gate_clock -no_autoungroup 

#To write the netlist based on synthsis
write_file -f verilog -hier -output designs/booth_netlist.v
write_file -f ddc -hier -output designs/booth_netlist.ddc

