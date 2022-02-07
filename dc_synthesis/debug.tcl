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

set abreports_dir ab_reports
if { ! [ file exists $abreports_dir ] } {
         file mkdir $abreports_dir
}


sh rm -rf ./WORK
define_design_lib WORK -path WORK

read_file -f ddc  designs/booth_netlist.ddc

report_area -hier > $abreports_dir/ab.txt
report_register > $abreports_dir/abreg.txt
