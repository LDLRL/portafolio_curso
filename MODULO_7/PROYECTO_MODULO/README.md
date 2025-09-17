# Proyecto Final - Big Data con Apache Spark

## 📄 Descripción General

Este proyecto corresponde a la evaluación del módulo *"Introducción al procesamiento distribuido y sistemas Big Data"*. El objetivo fue construir un **pipeline completo con Apache Spark** que aborde procesamiento batch y en tiempo real (streaming), integrando datos estructurados y no estructurados, y finalizando con un modelo de Machine Learning escalable.

La situación planteada corresponde a una empresa tecnológica global que necesita mejorar el análisis y transformación de grandes volúmenes de datos (ventas, sensores, logs) que actualmente no escala. Para ello se utilizó Apache Spark como motor de procesamiento distribuido.

---

## 🌐 Ecosistema Big Data aplicado al caso

* **Volumen**: Datos masivos desde sensores, ventas, logs y redes.
* **Velocidad**: Procesamiento de eventos en tiempo real (streaming).
* **Variedad**: Archivos CSV, JSON, texto, y socket TCP.
* **Veracidad**: Limpieza y validación necesarias por ruido de sensores.
* **Valor**: Generar insights y predicciones automatizadas.

---

## 🚀 Tecnologías clave

* Apache Spark: Core, SQL, Streaming, MLlib
* Formatos de datos: CSV, JSON, TXT
* Google Colab (como entorno local)

---

## 📆 Paso a paso del desarrollo

### 1. Lección 1: Big Data

* Comprensión del ecosistema Big Data.
* Aplicación de las 5Vs al caso.
* Comparación enfoque distribuido vs local.

### 2. Lección 2: Apache Spark

* Arquitectura de Spark: Driver, Executors, Cluster Manager.
* Identificación de módulos requeridos: Spark Core, SQL, Streaming, MLlib.

### 3. Lección 3: RDDs y procesamiento batch

* Lectura con `parallelize()` y `textFile()`
* Transformaciones: `map`, `filter`, `sortBy`
* Acciones: `count`, `collect`, `mean`

### 4. Lección 4: Spark SQL y DataFrames

* Lectura de archivos CSV, JSON y Parquet.
* Consultas SQL y funciones UDF.
* Comparación de rendimiento vs RDDs.

### 5. Lección 5: Streaming con Spark

* Lectura de datos en tiempo real desde un socket TCP.
* Procesamiento de eventos con `window` y `watermark`.
* Visualización de agregaciones por ventana temporal.

### 6. Lección 6: MLlib y modelo predictivo

* Preprocesamiento: Indexación de categorías, ensamblado de features.
* Modelo: RandomForestClassifier.
* Métrica: Precisión del 23.53%
* Modelo guardado en disco.

---

## 📚 Estructura del Proyecto

| Notebook | Tema                          | Resultado                               |
| -------- | ----------------------------- | --------------------------------------- |
| 1        | Procesamiento batch (RDD, DF) | Cálculo de KPIs, limpieza de datos      |
| 2        | Spark SQL y UDFs              | Consultas sobre ventas, sensores, logs  |
| 3        | Streaming                     | Conteo de palabras por ventana temporal |
| 4        | Machine Learning (MLlib)      | Modelo de clasificación entrenado       |

---

## 📂 Datos utilizados

* `/sample_data/ventas.csv` (estructurado)
* `/sample_data/sensores.json` (semi estructurado)
* `/sample_data/logs.txt` (no estructurado)
* Socket TCP (simulación streaming)

---

## 🔧 Instrucciones de Ejecución

1. Subir los 3 archivos a `/content/sample_data/` en Colab.
2. Ejecutar los notebooks `1` a `4` en orden.
3. Para el notebook 3, abrir una consola local:

```bash
nc -lk 9999
```

Y escribir palabras simulando flujo.
4\. Verificar el conteo en la salida del stream.
5\. En el notebook 4, entrenar el modelo y verificar métrica de precisión.

---

## 🧰 Resultados Obtenidos

* Agrupación de ventas por categoría.
* Identificación de sensores con altas temperaturas.
* Conteo por nivel de log.
* Conteo de palabras por ventana temporal.
* Clasificación de registros con RandomForest (precisión: 23.53%).

---

## 🏫 Estructura de Entregables Finales

### 📁 Código

```
/project/
├── notebook_batch.ipynb
├── sql_queries.ipynb
├── streaming_pipeline.ipynb
├── train_model.ipynb
├── model_save/
│   └── modelo_credito_pipeline.joblib
```

### 📄 Documentación

* `README.md` (este archivo)
* Diagrama de arquitectura 

---

## 🌈  Diagrama de Arquitectura


```
+---------------------------------------------------------------+
|                  FUENTES DE DATOS (Input Sources)             |
+------------------+---------------------+----------------------+
|   ventas.csv     |   sensores.json     |      logs.txt        |
| (datos estruct.) | (IoT semi-estruc.)  | (texto no estruct.)  |
+------------------+---------------------+----------------------+

                         ↓ (Lectura inicial)

+---------------------------------------------------------------+
|     INGESTA Y PROCESAMIENTO BATCH CON SPARK (RDD + SQL)       |
+------------------+----------------------+---------------------+
|   RDDs           |   DataFrames         |   Spark SQL         |
| - textFile()     | - read.csv/json()    | - spark.sql()       |
| - map(), filter()| - withColumn()       | - consultas SQL      |
| - reduce(), etc. | - groupBy(), agg()   | - UDFs               |
+------------------+----------------------+---------------------+

                         ↓ (Datos transformados)

+---------------------------------------------------------------+
|        PROCESAMIENTO EN STREAMING CON STRUCTURED STREAMING   |
+---------------------+----------------------+------------------+
| Fuente: socket/text | Watermark            | Ventanas         |
| - readStream()      | - withWatermark()    | - window()       |
| - outputMode()      | - handle eventos     | - groupBy + count|
+---------------------+----------------------+------------------+

                         ↓ (Flujo de datos procesado)

+---------------------------------------------------------------+
|   MACHINE LEARNING ESCALABLE CON MLlib (CLASIFICACIÓN)        |
+-------------------+-----------------------+-------------------+
| Preparación de DF |   Entrenamiento       |  Evaluación       |
| - VectorAssembler | - RandomForestClassifier | - accuracy()   |
| - StringIndexer   | - .fit(), .transform()  | - Evaluator      |
| - Normalización   |                       | - Guardado modelo |
+-------------------+-----------------------+-------------------+

                         ↓

+---------------------------------------------------------------+
|             SALIDA Y ALMACENAMIENTO FINAL                     |
+----------------------------+----------------------------------+
| Resultados consolidados    | Modelo guardado en disco (.save)|
| - show(), write.csv/json   | - predicciones futuras           |
+----------------------------+----------------------------------+
```

---
## 💡 Lecciones aprendidas

- Spark permite combinar batch, SQL, streaming y ML en una sola plataforma.
- La separación por notebooks ayuda a modularizar mejor cada etapa del pipeline.
- El manejo de datos semiestructurados y no estructurados requiere validaciones adicionales.
- El streaming requiere entorno interactivo o simulación controlada en Colab.
---

## 📈 Conclusión

Este proyecto demostró la aplicación efectiva de Spark en un contexto Big Data. Integra distintos tipos de procesamiento y formatos, con un pipeline completo orientado a entornos reales y escalables. El código está modularizado y documentado para su futura extensión o despliegue productivo.
