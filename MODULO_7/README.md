# 📚 Módulo 7 – Procesamiento Distribuido y Big Data con Apache Spark

Este README documenta todo el trabajo realizado en el Módulo 7 del curso de Fundamentos de Ingeniería de Datos. El módulo se enfocó en comprender y aplicar el ecosistema Big Data mediante la herramienta Apache Spark, abordando conceptos fundamentales, ejercicios prácticos y un proyecto final integrador.

---

## 🧭 Parte 1: Contenidos del Módulo

A lo largo de las seis lecciones se abordaron los siguientes temas clave:

### Lección 1: Big Data
- Comprensión de las 5Vs: Volumen, Velocidad, Variedad, Veracidad, Valor.
- Beneficios del enfoque distribuido sobre el local.
- Tecnologías clave en proyectos Big Data.

### Lección 2: Apache Spark
- Arquitectura de Spark: Driver, Executors, Cluster Manager.
- Cuándo usar Spark y sus ventajas frente a otros motores.
- Módulos principales: Core, SQL, Streaming, MLlib.

### Lección 3: Procesamiento distribuido de datos
- Uso de `parallelize()` y `textFile()`.
- Transformaciones: `map`, `filter`, `sortBy`.
- Acciones: `count`, `collect`, `mean`.

### Lección 4: Procesamiento de datos estructurados 
- Lectura de archivos en CSV, JSON y Parquet.
- Consultas SQL.
- UDFs (User Defined Functions).
- Comparación RDD vs DataFrame.

### Lección 5: Procesamiento en Streaming con spark
- Lectura desde socket TCP.
- Ventanas temporales y gestión de eventos tardíos.
- `writeStream` en modo `update`.

### Lección 6: Introducción a Machine Learning escalable
- Preprocesamiento de datos: indexado y ensamblado.
- Entrenamiento de un modelo con `RandomForestClassifier`.
- Evaluación del modelo (precisión).
- Guardado del modelo.

---

## 🧪 Parte 2: Ejercicios de Clase (Notebook MODULO_7.ipynb)

Cada ejercicio se desarrolló de manera práctica en Google Colab utilizando PySpark.

### ✅ Ejercicio 1: Comparación RDD vs DataFrame
- Carga de datos desde CSV
- Uso de `map()` y `filter()` con RDD
- Cálculo de promedio, mínimo, máximo
- Transformación a DataFrame y uso de funciones agregadas

### ✅ Ejercicio 2: Consultas con Spark SQL
- Creación de vistas temporales con `.createOrReplaceTempView()`
- Consultas SQL directas (`spark.sql`)
- Ejemplo: conteo por categoría

### ✅ Ejercicio 3: Funciones definidas por el usuario (UDF)
- Creación de UDF con `@udf`
- Aplicación sobre DataFrame
- Ejemplo: clasificar temperatura de sensores como “Alerta”

### ✅ Ejercicio 4: Procesamiento en Streaming
- Configuración de socket TCP
- Lectura de flujo en tiempo real con `.readStream`
- Agregación por ventana de 10 minutos con watermark
- Conteo por palabra

### ✅ Ejercicio 5: Entrenamiento de modelo ML
- Preprocesamiento: StringIndexer y VectorAssembler
- Entrenamiento con `RandomForestClassifier`
- Evaluación con `MulticlassClassificationEvaluator`

---

## 🧩 Parte 3: Proyecto Final

### 🎯 Descripción
Se desarrolló un pipeline Big Data completo que integra procesamiento batch, consultas SQL, streaming en tiempo real y entrenamiento de un modelo predictivo con MLlib.

La simulación representa una empresa que necesita analizar datos de ventas, sensores y logs para obtener insights en tiempo real y predecir comportamientos.

### 🧱 Componentes del Pipeline
- **Batch**: Lectura y limpieza de datos en CSV, JSON y texto.
- **SQL**: Consultas analíticas sobre ventas, sensores y logs.
- **Streaming**: Procesamiento de eventos desde socket TCP.
- **MLlib**: Clasificación usando Random Forest.

### 🗂️ Estructura de carpetas

```
/proyecto/
├── notebook_batch.ipynb
├── sql_queries.ipynb
├── streaming_pipeline.ipynb
├── train_model.ipynb
├── model_save/
│   └── modelo_credito_pipeline.joblib
```

### ⚙️ Instrucciones de ejecución

1. Abrir notebooks en orden: `notebook_batch` → `sql_queries` → `streaming_pipeline` → `train_model`
2. En `streaming_pipeline`, abrir un socket local con:
```bash
nc -lk 9999
```
3. Ingresar mensajes para simular streaming.
4. Verificar resultados y predicciones.

### 📊 Resultados clave

- Limpieza de datos estructurados
- Consultas SQL optimizadas
- Conteo por palabra en tiempo real
- Clasificación con precisión del 23.53%

### 🧠 Aprendizajes del Proyecto

- Integración completa de módulos de Spark
- Diseño de un pipeline modular y funcional
- Enfoque escalable para Big Data real

---

## ✅ Requisitos Técnicos

- Apache Spark (v3.0+)
- Python 3.8+
- Google Colab o entorno local con PySpark
- Paquete `joblib` para guardar modelo

---

## 🎓 Conclusión del Módulo

Este módulo permitió comprender y aplicar el enfoque distribuido con Spark, desde transformaciones básicas hasta el entrenamiento de modelos. Se desarrolló experiencia en integrar múltiples formatos de datos y tipos de procesamiento, preparando al estudiante para trabajar con flujos reales en Big Data.