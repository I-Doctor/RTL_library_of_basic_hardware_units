## Bitonic Sorting Network
This module is a bitonic sorting network. The function is to merge two sorted list into one single sorted list.
The input **in_data** is a concatenated list of two sorted list of length V (V is a changable parameter). Each element in the list is a key-value pair, the list is sorted according to key. The bit width of key and value is a changeable parameter.
The output **out_data** is a sorted list of lengthe 2V (the key list is sorted).

Notice: this is not a full implementation of bitonic sorting network as it is not able to turn an unordered list into an sorted list.

The architecture of Bitonic Sorting Network is:

```
bitonic_sorting.sv
    |-- comparator.sv
```