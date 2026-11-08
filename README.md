# ABAP Core Skills

Exercises from my learning journey **Acquiring Core ABAP Skills**, following the SAP course **S4D400 Basic ABAP Programming**. 

> **Work in progress.** This repository is updated as I complete the exercises of the S4D400 course. New classes are added over time.

## Exercises (package `ZS4D400_3964`)

Each exercise is a global class that runs in the ADT console.

| Class | Topic |
|---|---|
| `ZCL_3964_HELLO_WORLD` | Exercise 3 - Create Hello World application |
| `ZCL_3964_DATA_OBJECTS` | Data objects with built-in types |
| `ZCL_3964_LITERALS` | Data objects: literals |
| `ZCL_3964_CONSTANTS` | Data objects: constants |
| `ZCL_3964_GLOBAL_TYPES` | Data objects with global types |
| `ZCL_3964_LOCAL_TYPES` | Data objects with local types |
| `ZCL_3964_CALCULATIONS` | Arithmetic calculations |
| `ZCL_3964_STRING_PROCESSING` | String templates, format options, and string expressions |
| `ZCL_3964_COMPUTE` | Exercise 4 – A program that does calculations based on two numbers |
| `ZCL_3964_CONDITIONAL` | Conditional branching |
| `ZCL_3964_EXCEPTION` | Exception handling |
| `ZCL_3964_ITERATIONS` | DO ENDDO with TIMES and abort condition |
| `ZCL_3964_BRANCH` | Exercise 5 - Implement Conditional branching |
| `ZCL_3964_INTERNAL_TABLES` | Simple internal tables |
| `ZCL_3964_ITERATE` | Exercise 6 - Use iterations and simple internal tables to calculate and display the Fibonacci numbers. |
| `ZCL_3964_DEBUG` | Exercise 7 - Debug ABAP Code |

## How to run

Each class implements `IF_OO_ADT_CLASSRUN`. Open it in Eclipse with ABAP Development Tools (ADT), activate it with **Ctrl+F3**, and run it with **F9**. The output appears in the ABAP Console.

## Tools

ABAP Cloud, Eclipse with ADT, abapGit

## About this repository

- The `src` folder is in abapGit format. Import it with abapGit instead of editing the files by hand.
- These are learning exercises, so the code favors clarity over completeness.
