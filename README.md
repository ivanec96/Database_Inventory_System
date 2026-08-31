# 🏟️ Sistema de Gestión para Centro de Eventos (Database Design)

Este repositorio contiene el diseño relacional y los scripts de implementación para el backend de datos de un centro de eventos.
El proyecto simula un entorno real de negocio, gestionando las reservas, disponibilidad de salas, clientes y facturación.

## 🛠️ Tecnologías Utilizadas
* **Motor de Base de Datos:** MySQL 
* **Lenguaje:** SQL
* **Herramientas de Modelado:**  MySQL Workbench, Dia.

## 📂 Estructura del Repositorio

El proyecto está organizado siguiendo buenas prácticas de separación entre código y documentación:

* `📁 /sql`: Contiene el script principal (`centroEventos.sql`) con el esquema de la base de datos (DDL) y la inserción de datos de prueba (DML).
* `📁 /docs`: Incluye el documento de diseño y análisis, detallando las reglas de negocio y justificando la estructura relacional.
* `📁 /ER model`: Incluye el modelo Entidad Relación y Lógico de la base de datos.

## 💡 Consultas y Lógica de Negocio Destacada

El script SQL incluye consultas complejas para resolver requerimientos de negocio, tales como:

## 💡 Consultas y Lógica de Negocio Destacada

El script SQL no solo define la estructura, sino que incluye reglas de negocio aplicadas directamente en la base de datos y consultas analíticas clave:

* **Integridad y Restricciones de Dominio:** Se han implementado cláusulas `CHECK` en la tabla `evento` para garantizar la coherencia lógica de los datos, impidiendo el registro de aforos negativos (`aforo_max > 0`) o eventos donde la hora de fin sea anterior a la de inicio (`hora_fin > hora_inicio`).
*   Además, se asegura la unicidad de los correos electrónicos mediante la restricción `UNIQUE`.
* **Cruces Multitabla y Ordenación:** Uso extensivo de `JOIN` para relacionar hasta tres tablas simultáneamente (`participantes`, `inscripcion` y `evento`), permitiendo generar listados históricos ordenados por fecha de inscripción.
* **Análisis Temporal:** Filtrado de registros utilizando funciones de fecha nativas, como `MONTH(e.fecha) = 10`, para aislar la programación mensual de tipos de eventos específicos.
* **Agrupación y Filtrado Avanzado (`HAVING`):** Implementación de métricas de negocio usando funciones de agregación (`COUNT`, `GROUP BY`). Por ejemplo, la identificación    de los clientes más recurrentes filtrando aquellos con más de dos inscripciones (`HAVING count(i.id_evento) > 2`),
  y el recuento de la tasa de uso de cada sala de eventos.
## 🚀 Cómo ejecutar este proyecto

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/ivanec96/Database_Inventory_System.git



# 🏟️ Event Center Management System (Database Design)

This repository contains the relational design and implementation scripts for the data backend of an event center. The project simulates a real business environment, managing reservations, room availability, clients, and billing.

## 🛠️ Tech Stack

* **Database Engine:** MySQL

* **Language:** SQL

* **Modeling Tools:** MySQL Workbench, Dia

## 📂 Repository Structure

The project is organized following best practices for separating code and documentation:

📁 /sql: Contains the main script (centroEventos.sql) with the database schema (DDL) and test data insertion (DML).

📁 /docs: Includes the design and analysis document, detailing business rules and justifying the relational structure.

📁 /ER model: Includes the Entity-Relationship (ER) and Logical model of the database.

## 💡 Key Business Logic and Queries

The SQL script not only defines the structure but also includes business rules applied directly to the database and key analytical queries:

* **Integrity and Domain Constraints:** CHECK clauses have been implemented in the evento table to ensure logical data consistency, preventing the registration of negative capacities (aforo_max > 0) or events where the end time is earlier than the start time (hora_fin > hora_inicio). Additionally, email uniqueness is ensured using the UNIQUE constraint.

* **Multi-table Joins and Sorting:** Extensive use of JOIN to relate up to three tables simultaneously (participantes, inscripcion, and evento), allowing the generation of historical lists sorted by registration date.

* **Temporal Analysis:** Filtering records using native date functions, such as MONTH(e.fecha) = 10, to isolate the monthly schedule of specific event types.

* **Advanced Grouping and Filtering (HAVING):** Implementation of business metrics using aggregation functions (COUNT, GROUP BY). For example, identifying the most recurring clients by filtering those with more than two registrations (HAVING count(i.id_evento) > 2), and counting the usage rate of each event room.

## 🚀 How to run this project

Clone this repository to your local machine:

## Bash
git clone https://github.com/ivanec96/Database_Inventory_System.git
