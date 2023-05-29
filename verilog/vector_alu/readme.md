## Vector_alu and Mac_tree design

### Vector Alu 
vector alu can provide a variety of data operations for floating-point vectors with a length of *ELE_NUM*. 
The module accepts three vector inputs **A**, **B**, **C**, control signal **ctrl** and outputs **D**. 
When **ctrl**=0, execute and output **D=A+B**; when the control signal **ctrl**=1, execute and output **D=A\*B**; when **ctrl**=2, execute and output **D=A\*B+C**


### Mac Tree
Mac Tree accepts two sets of 8 floating-point inputs **A0~A7** and **B0~B7**. After multiplication between each **Ai** and **Bi**, the result is sent into the addition tree for parallel merging, and finally output a floating-point number **out**.