# RTL_library_of_basic_hardware_units
This repo have some implementations of some basic hardware units in RTL language (verilog for now), which can be used for area/power evaluation and support the hardware design tradeoff.

# Unit List and Contributors
- mux:
- arithmetic_units: 
- systolic_array: xinhao
- tensor_core: jun
- N2M_tensor_core: jun
- mac_tree: hongyi
- vector_alu: hongyi
- bitonic_sorting: chiyue
- prefix_sum: kai
- fan: kai
- mrn: 
- merge_sort_tree: 
- cross_bar: jun/hongyi
- benes_network: hongyi
- set_op_core: zhenhua

# Change log

## V1.0 (20230511)
Create the repo.

## V1.1 (20230518)
Add original files of these modules:
- systolic_array: xinhao
- bitonic_sorting: chiyue
- prefix_sum: kai
- fan: kai

## V1.2 (20230525)
- Add more modules:
  - tensor_core: jun
  - mac_tree: hongyi
  - vector_alu: hongyi
- Organize the code style.
- Clearify the file structure, input, output, function defination, parameter of each module in code file and readme document.
- Make the plan of parameterize these modules.

## V1.3 (20230601)
- Add more modules:
  - crossbar: jun

## V2.1 (20230615)
Make each module parameterized, both in code and document.
