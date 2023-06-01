This is a reimplementation of the Forwarding Adder Network (FAN) module in paper SIGMA, compared with Prefix Sum Network (PSN) module.

- top.v: Top module for synthesis.

- fan32.v: FAN with 32 input numbers and each is in FP32 format.

- reduce32.v: PSN with 32 input numbers and each is in FP32 format.

- o1adder.v: A adder with one output port, used in PSN. The output port output ain or bin or ain+bin under the control of ctrl signal.

- o2adder.v: A adder module with two output ports, used in FAN. The output ports are both ain+bin when the control signal is 1, or they are ain, bin respectively.

- fp32adder.v: A common FP32 adder.

- addition_normaliser.v: Normaliser module in FP32 adder.
