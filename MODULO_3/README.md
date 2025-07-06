# 📊 Módulo 3 – Obtención y Preparación de Datos

Este módulo se enfocó en adquirir habilidades prácticas para preparar datos reales utilizando las librerías **NumPy** y **Pandas**. A lo largo de seis lecciones y un proyecto final, se implementó un flujo completo de trabajo para obtener, limpiar, transformar, analizar y exportar datos provenientes de múltiples fuentes.

---

## 🎯 Objetivo del Módulo

El objetivo principal fue desarrollar un proceso automatizado y eficiente para la preparación de datos, desde su generación o carga hasta su exportación final, asegurando la calidad y consistencia para su uso posterior.

---

## 📚 Contenido del Módulo

### 🔹 Lección 1 – Uso de NumPy

- Generación de datos ficticios con arrays de NumPy: ID de clientes, montos de compra y edades.
- Aplicación de operaciones estadísticas como suma, media y conteo.
- Almacenamiento de los arrays en archivos `.npy`.

**Reflexión:** NumPy demostró ser muy útil por su rapidez y eficiencia al trabajar con grandes volúmenes de datos numéricos.

---

### 🔹 Lección 2 – Introducción a Pandas

- Conversión de arrays a un DataFrame.
- Exploración inicial con métodos como `head()`, `describe()` y filtros condicionales.
- Exportación del DataFrame preliminar en formato `.csv`.

**Reflexión:** Pandas facilitó mucho el manejo de datos tabulares, haciendo posible analizar y preparar rápidamente la información.

---

### 🔹 Lección 3 – Integración de Múltiples Fuentes

- Carga de datos desde CSV y Excel.
- Extracción de una tabla HTML desde una página web (Wikipedia).
- Unión de los diferentes DataFrames usando `merge()` y `concat()`.

**Reflexión:** Fue desafiante integrar diferentes formatos, pero se aprendió a unificar datos dispersos en un solo conjunto coherente.

---

### 🔹 Lección 4 – Limpieza de Datos

- Identificación y tratamiento de valores nulos con imputación basada en la media.
- Detección y eliminación de outliers con el método del rango intercuartílico (IQR).
- Exportación del DataFrame limpio.

**Reflexión:** Se comprendió la importancia de limpiar los datos antes de analizarlos. Aunque se usó la media para imputar valores faltantes, en casos con mucha dispersión sería más conveniente usar la mediana.

---

### 🔹 Lección 5 – Data Wrangling

- Eliminación de duplicados.
- Conversión de tipos de datos.
- Creación de nuevas columnas (por ejemplo, segmentación por edad y categorías de monto).
- Aplicación de funciones lambda y categorización personalizada.

**Reflexión:** Estas técnicas ayudaron a enriquecer y transformar los datos para que sean más útiles en análisis posteriores.

---

### 🔹 Lección 6 – Agrupamiento y Pivoteo

- Agrupación con `groupby()` para obtener estadísticas resumidas.
- Reestructuración de datos con `pivot_table()` y `melt()`.
- Combinación final de fuentes y exportación del dataset a formatos CSV y Excel.

**Reflexión:** Estas herramientas permitieron generar resúmenes útiles y organizar los datos en formatos que facilitan el análisis visual y tabular.

---

## 🛠️ Proyecto Final – Preparación Integral del Dataset

### 💼 Contexto

Simulación de una situación real de una empresa de e-commerce que necesita preparar un dataset para análisis. Se trabajó con datos generados y fuentes externas (Excel y web), aplicando limpieza y transformación para obtener un resultado confiable.

### 🔧 Pasos Realizados

1. Generación de datos con NumPy.
2. Exploración y análisis inicial con Pandas.
3. Carga de datos desde CSV, Excel y web.
4. Limpieza de valores nulos y outliers.
5. Wrangling: creación de columnas, tipos de datos y transformaciones.
6. Agrupamiento y pivoteo para organización final del dataset.
7. Exportación a archivos `.csv` y `.xlsx`.

### 📁 Archivos Entregables del proyecto final 

- `modulo3_proyecto.ipynb`: Notebook con todo el código y explicaciones.
- `dataset_final.csv` y `dataset_final.xlsx`: Dataset estructurado y listo para análisis.
- `documento_resumen.md`: Documento que explica cada etapa del proceso.
- `ejercicios de clase de cada lección: Notebooks con todo el código y explicaciones.

---

## 🧠 Habilidades Desarrolladas

- Lectura e integración de datos de diferentes fuentes.
- Limpieza y preparación de datos con NumPy y Pandas.
- Manejo de valores nulos, duplicados y outliers.
- Transformaciones avanzadas y creación de nuevas variables.
- Agrupación y pivoteo de datos para estructurar reportes.
- Exportación de datasets en formatos estándar.

---

## ✅ Conclusiones

Este módulo permitió adquirir herramientas clave para el trabajo práctico con datos. A través del proyecto final se pudo integrar todos los conocimientos en un flujo de trabajo completo. Se destaca la importancia de realizar limpieza y estructuración adecuada antes de cualquier análisis. Además, se valoró la potencia de Pandas y NumPy como aliados esenciales en la preparación de datos en entornos reales.

---

## 📌 Requisitos Técnicos

- Python 3
- Librerías: `numpy`, `pandas`
- Google Colab 
- Conexión a internet para acceder a la fuente web

---


