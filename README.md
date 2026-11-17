# ABAP Core Skills – Demo Exercises

This repository contains my code demonstrations and experiments while working through the SAP Learning Journey **Acquiring Core ABAP Skills**, based on the SAP training course **S4D400 – Basic ABAP Programming**.

The classes cover ABAP fundamentals, data objects, control structures, internal tables, object-oriented programming, exception handling, and database access.

> **Work in progress:** This repository is updated as I progress through the S4D400 course. New classes and examples are added regularly.

## Demo Classes

The ABAP objects are organized in the package `ZS4D400_3964`.

Each demonstration is implemented as a global ABAP class using `IF_OO_ADT_CLASSRUN`, allowing it to be executed directly in the ADT Console.

| No. | Class | Topic |
|---:|---|---|
| 1 | `ZCL_3964_DATA_OBJECTS` | Data objects with built-in types |
| 2 | `ZCL_3964_LITERALS` | Data objects and literals |
| 3 | `ZCL_3964_CONSTANTS` | Constants |
| 4 | `ZCL_3964_GLOBAL_TYPES` | Data objects with global types |
| 5 | `ZCL_3964_LOCAL_TYPES` | Data objects with local types |
| 6 | `ZCL_3964_CALCULATIONS` | Arithmetic calculations |
| 7 | `ZCL_3964_STRING_PROCESSING` | String templates, format options, and string expressions |
| 8 | `ZCL_3964_CONDITIONAL` | Conditional branching |
| 9 | `ZCL_3964_EXCEPTION` | Exception handling |
| 10 | `ZCL_3964_ITERATIONS` | DO loops with TIMES and abort conditions |
| 11 | `ZCL_3964_INTERNAL_TABLES` | Working with simple internal tables |
| 12 | `ZCL_3964_GLOBAL` | Defining a local class |
| 13 | `ZCL_3964_GLOBAL2` | Managing instances in an internal table |
| 14 | `ZCL_3964_INSTANCE_ITAB` | Managing instances in an internal table |
| 15 | `ZCL_3964_GLOBAL3` | Defining and implementing methods |
| 16 | `ZCL_3964_METHODS_EXCEPTION` | Method calls and exception handling |
| 17 | `ZCL_3964_FUNCTIONAL_METHOD` | Functional method calls in assignments, logical expressions, and statements |
| 18 | `ZCL_3964_BASIC_SELECT` | Basic SELECT statement examples |
| 19 | `ZCL_3964_STRUCTURED` | Declaring structured data objects |
| 20 | `ZCL_3964_ACCESS_STRUCTURE` | Working with structured data objects |
| 21 | `ZCL_3964_S4D401_DEMO1` | S4D401 exercises part 1 – live session demo |
| 22 | `ZCL_3964_STRUCTURED_DATA` | Structured data objects in ABAP SQL |
| 23 | `ZCL_3964_COMPLEX_TABLES` | Simple and complex internal tables, local and global table types |
| 24 | `ZCL_3964_FILL_COMPLEX_TABLES` | Filling complex internal tables |
| 25 | `ZCL_3964_ACCESS_COMPLEX_TABLES` | Access to complex internal tables |
| 26 | `ZCL_3964_INT_TABLE_ABAP_SQL` | Complex internal tables in ABAP SQL |





## Prerequisites

To import and execute these demonstrations, you need:

- An SAP S/4HANA training system with ABAP development access.
- Eclipse IDE with ABAP Development Tools (ADT) installed.
- abapGit for importing the repository into your SAP system.
- The SAP S4D400 training environment and its required development objects.

### SAP Reference Objects and Dependencies

Some demonstrations may reference SAP-provided development objects, types, or database tables that are not included in this repository.

For example:

- **`/DMO/FLIGHT`** – SAP Flight Reference Scenario, used in database access demonstrations.
- **S4D400 training objects** – Global types and other development objects provided as part of the SAP training environment.

These dependencies must be available and activated in your SAP system for the relevant demonstrations to work.

**Note:** SAP-provided reference objects and training packages are external dependencies. They are not part of this repository.

## How to Run

1. Import the repository into your SAP system using abapGit.
2. Open the relevant global class in Eclipse using ABAP Development Tools (ADT).
3. Activate the class using **Ctrl + F3**.
4. Execute the class using **F9**.
5. View the output in the ABAP Console.

Each demonstration class implements `IF_OO_ADT_CLASSRUN` and uses its `main( )` method as the execution entry point.

## Tools and Technologies

- ABAP (ABAP Cloud)
- SAP S/4HANA
- Eclipse IDE with ABAP Development Tools (ADT)
- abapGit
- Git / GitHub

## Repository Structure

The repository follows the standard abapGit serialization format.

- `src/` – ABAP source files serialized by abapGit.
- `README.md` – Repository documentation.

**Important:** The files in `src/` are intended to be managed through abapGit. Avoid editing the serialized files directly unless you understand the abapGit serialization format.

## About This Project

These demonstrations are part of my ongoing journey to learn ABAP programming.

Rather than simply following the examples in the course, I use these classes to experiment with the syntax, understand how ABAP behaves, and explore different programming concepts through practical implementation and debugging.
