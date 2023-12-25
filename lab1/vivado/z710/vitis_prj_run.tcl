
set vivado_ws "./riscv-z710-v2020"
set vitis_ws "./hello_z710-test"
set vitis_prj_name "hello_z710"
set hardware_name "design_1_wrapper"

# set vitis workspace, ASSUMES you run this script in vivado/z710/
setws $vitis_ws


# create or activate hardware platform, then configure

if {[file exists $vitis_ws/$hardware_name/platform.spr]} {
    puts "Found platform file, updating it"
    platform read $vitis_ws/$hardware_name/platform.spr
    platform active $hardware_name
    platform config -updatehw $vivado_ws/$hardware_name.xsa
} else {
    puts "Creating platform from $vivado_ws/$hardware_name.xsa, make sure you have this file"

    # leave out "-out $vitis_ws" option for vitis 2020, which causes `platform list` found nothing, but still in the same place 
    platform create -name $hardware_name -hw $vivado_ws/$hardware_name.xsa -proc {ps7_cortexa9_0} -os {standalone}
    platform write
}


platform active $hardware_name

bsp config stdout ps7_uart_1
bsp config stdin ps7_uart_1

platform write
platform generate


if {![file exists $vitis_ws/$vitis_prj_name]} {
    # create app project, using current active platform
    # app create -name $vitis_prj_name -proc {ps7_cortexa9_0} -os {standalone} -lang C -template {Hello World}
    app create -name $vitis_prj_name -platform $hardware_name -lang C -template {Hello World}

    # overwrite existing helloworld.c
    file copy -force helloworld.c $vitis_ws/$vitis_prj_name/src/helloworld.c
} 


# build the project
app build -name $vitis_prj_name

# connect to default hw server @ 3121 and select target as ARM core 0
# connect -host localhost -port 3121 

# connect alone can start hw_server and connect to it
connect
targets -set -nocase -filter {name =~ "ARM*#0"}

# system reset
rst -system

# PS7 initialization, these steps are from Vitis IDE - Debug configuration(right click) - target setup
# $hardware_name/hw/ps7_init.tcl is the same. init and post config are performed to enable PL-PS interaction
# 
# Following operations will be performed before launching the debugger.
# 1. Resets entire system. Clears the FPGA fabric (PL).
# 2. Program FPGA fabric (PL).
# 3. Runs ps7_init to initialize PS.
# 4. Runs ps7_post_config. Enables level shifters from PL to PS. (Recommended to use this option only after system reset or board power ON).
# 5. All processors in the system will be suspended, and Applications will be downloaded to the following processors as specified in the Applications tab.
# 	1) ps7_cortexa9_0 (E:\Workplace\2022-fall-yatcpu-repo\lab1\vivado\z710\hello-z710-v2020\hello_z710\Debug\hello_z710.elf)
namespace eval xsdb "source $vitis_ws/$vitis_prj_name/_ide/psinit/ps7_init.tcl;ps7_init;ps7_post_config"

# burn our CPU on FPGA
fpga $vitis_ws/$hardware_name/hw/$hardware_name.bit

# download ELF to PS 
dow $vitis_ws/$vitis_prj_name/Debug/$vitis_prj_name.elf


# insert breakpoint at main
# bpadd -addr &main

con

con
