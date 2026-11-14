# ABAP Core Skills – Demo Exercises

This repository contains my code demonstrations and experiments while working through the SAP Learning Journey **Acquiring Core ABAP Skills**, based on the SAP training course **S4D400 – Basic ABAP Programming**.

The classes cover ABAP fundamentals, data objects, control structures, internal tables, object-oriented programming, exception handling, and database access.

> **Work in progress:** This repository is updated as I progress through the S4D400 course. New classes and examples are added regularly.

## Demo Classes

The ABAP objects are organized in the package `ZS4D400_3964`.

Each demonstration is implemented as a global ABAP class using `IF_OO_ADT_CLASSRUN`, allowing it to be executed directly in the ADT Console.

| Class | Topic |
|---|---|
| `ZCL_3964_DATA_OBJECTS` | 1 | Data objects with built-in types |
| `ZCL_3964_LITERALS` | 2 | Data objects and literals |
| `ZCL_3964_CONSTANTS` | 3 | Constants |
| `ZCL_3964_GLOBAL_TYPES` | 4 | Data objects with global types |
| `ZCL_3964_LOCAL_TYPES` | 5 | Data objects with local types |
| `ZCL_3964_CALCULATIONS` | 6 | Arithmetic calculations |
| `ZCL_3964_STRING_PROCESSING` | 7 | String templates, format options, and string expressions |
| `ZCL_3964_CONDITIONAL` | 8 | Conditional branching |
| `ZCL_3964_EXCEPTION` | 9 | Exception handling |
| `ZCL_3964_ITERATIONS` | 10 | DO loops with TIMES and abort conditions |
| `ZCL_3964_INTERNAL_TABLES` | 11 | Working with simple internal tables |
| `ZCL_3964_GLOBAL` | 12 | Defining a local class |
| `ZCL_3964_GLOBAL2` | 13 | Managing instances in an internal table |
| `ZCL_3964_INSTANCE_ITAB` | 14 | Managing instances in an internal table |
| `ZCL_3964_GLOBAL3` | 15 | Defining and implementing methods |
| `ZCL_3964_METHODS_EXCEPTION` | 16 | Method calls and exception handling |
| `ZCL_3964_FUNCTIONAL_METHOD` | 17 | Functional method calls in assignments, logical expressions, and statements |
| `ZCL_3964_BASIC_SELECT` | 18 | Basic SELECT statement examples |

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
