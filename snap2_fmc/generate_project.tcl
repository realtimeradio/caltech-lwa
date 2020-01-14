set proj_name "snap2_5gad_test"
set proj_dir "snap2_5gad_test"

set source_path "./src"

# Get the locations of this script and its directory,
# so we can use relative paths
set script_name [file normalize [info script]]
set script_path [file dirname $script_name]

# Setup project
start_gui
create_project $proj_name ./$proj_dir -part xcku115-flvf1924-1-c
set_property target_language VHDL [current_project]

# Get the project location
set proj_path [get_property directory [current_project]]

cd $script_path

# Add HDL source files
add_files $source_path/hdl

# Add IP files
add_files [glob $source_path/ip/*/*.xci]

# Add constraints
import_files -fileset constrs_1 $source_path/constraints/adc_5G.xdc


