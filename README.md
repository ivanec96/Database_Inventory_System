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
* **Agrupación y Filtrado Avanzado (`HAVING`):** Implementación de métricas de negocio usando funciones de agregación (`COUNT`, `GROUP BY`). Por ejemplo, la identificación de los clientes más recurrentes filtrando aquellos con más de dos inscripciones (`HAVING count(i.id_evento) > 2`),
*   y el recuento de la tasa de uso de cada sala de eventos.
*   
## 🚀 Cómo ejecutar este proyecto

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone https://github.com/ivanec96/Database_Inventory_System.git
