# MathArray FormalVerification
<img src="https://img.shields.io/badge/license-MIT-green.svg" />  <img src="https://img.shields.io/badge/version-1.0-red.svg" /> 

This project has been done by these contributors, be sure to **check them out!**:

- [Kevin David Rosales Santana](https://github.com/kevinrosalesdev)
- [Miguel Ángel Medina Ramírez](https://github.com/miguel-kjh)
- [Héctor Henríquez Cabrera](https://github.com/HectorHc2014)

***

Simple **Ada/Spark package** which works with some **mathematical functions and arrays.** The objective of this library is to make a **formal verification** using SPARK of the following algorithms:

- **`midpoint`:** **returns midpoint of two vectors.** Vectors must have 2 or 3 elements.
- **`module`:** **returns the module of a vector.** Vectors must have 2 or 3 elements.
- **`get`:** searches for a **given value in the vector** and **replace it with zero**. Given value can't be zero and algorithm **returns true if the operation was successful.**
- **`perpendicular_vec`:** **returns true if both vectors are perpendicular between them.** Vectors must have 2 elements and those elements must be lower than 46340.
- **`derivative`:** **returns the derivative of a vector.** Vectors must have at least one element and a maximum of 1000000 elements.

Library includes **some tests** too.

## Files

You can find in ***src*** file:

- ***main.adb***: Executable main that **includes some tests.**
- ***test_assertions.adb***: Body of test methods. 
- ***test_assertions.ads***: Header of test methods.
- ***matharray.adb***: Body of verified methods. Includes some ***pragmas*** for Formal Verification.
- ***matharray.ads***: Header of verified methods. Includes **SPARK Structure** for Formal Verification:
  - **Global.**
  - **Depends.**
  - **Pre (Preconditions).**
  - **Post (Postconditions).**

## How to run Project

This project has been tested **using *GPS* as IDE.**

- If you want to run **Tests**, just execute *main.adb*.
- If you want to check if algorithms have passed a **Formal Verification:**
  - First, go to `SPARK > Examine All Sources > Analysis Mode: Flow Analysis > Execute`.
  - Then, click on *matharray.ads* and go to `SPARK > Prove File > Proof level: 4 (slowest, all provers) > Execute`.

