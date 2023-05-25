## Tensor Core

The architecture of Tensor Core is:

```
tensor_core.v
    |-- tc_array.v
          |-- tc_pu.v
                |-- tc_pe.v
    |-- delay_unit.v
    |-- tc_psum.v
```