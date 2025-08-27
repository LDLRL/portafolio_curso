# Módulo 6 – Machine Learning para Ingenieros de Datos

Este repositorio contiene el desarrollo completo del **Módulo 6: Machine Learning para Ingenieros de Datos**, incluyendo ejercicios prácticos realizados por lección y el proyecto final integrador. El propósito es aplicar los conceptos fundamentales del aprendizaje automático a casos reales y consolidar las competencias en la creación, evaluación y despliegue de modelos predictivos.

---

## ✨ Descripción general del módulo

Este módulo tuvo como objetivo desarrollar competencias en la creación de modelos de aprendizaje supervisado, entendiendo sus fundamentos teóricos y aplicando herramientas prácticas para abordar tareas de clasificación y regresión.

Se trabajó de manera progresiva desde la comprensión de conceptos clave hasta la implementación de una solución automatizada basada en machine learning, integrando preprocesamiento, entrenamiento, validación y despliegue en una API. A lo largo del módulo se realizaron ejercicios prácticos por lección, seguidos por un proyecto final aplicado a un caso de evaluación crediticia simulado.

Los contenidos fueron abordados de forma teórico-práctica, permitiendo no solo implementar modelos, sino también reflexionar sobre el proceso de construcción y sobre los desafíos del entorno real de producción de modelos.

---

## 📚 Ejercicios de clase por lección

### Lección 1: Fundamentos del aprendizaje de máquina
- Comprender los conceptos de aprendizaje supervisado.
- Diferenciar problemas de clasificación y regresión.
- Analizar variables dependientes y su naturaleza.

**Aprendizajes clave:**  
Identificar el tipo de problema y asociar el modelo adecuado.

---

### Lección 2: Nivel de ajuste y validación cruzada
- Implementar validación cruzada (k-fold).
- Analizar fenómenos de sobreajuste y subajuste mediante gráficos y métricas.

**Aprendizajes clave:**  
Ajustar modelos sin sobreentrenarlos y evaluar su desempeño de forma robusta.

---

### Lección 3: Preprocesamiento y escalamiento de datos
- Aplicar técnicas como imputación, codificación (Label/One-Hot) y escalamiento (MinMaxScaler, StandardScaler).

**Aprendizajes clave:**  
Preparar los datos correctamente antes del modelado para asegurar resultados confiables.

---

### Lección 4: Regresiones
- Entrenar modelos de regresión lineal y evaluar su desempeño con MAE, MSE, RMSE y R².

**Aprendizajes clave:**  
Analizar relaciones entre variables continuas y evaluar predicciones numéricas.

---

### Lección 5: Algoritmos de clasificación
- Entrenar un modelo K-Nearest Neighbors.
- Evaluar con matriz de confusión, precisión, recall, F1 y AUC-ROC.

**Aprendizajes clave:**  
Resolver problemas de clasificación y medir la calidad de las predicciones.

---

### Lección 6: Métricas de desempeño
- Comparar distintos modelos con métricas adecuadas.
- Seleccionar el mejor modelo según su rendimiento.

**Aprendizajes clave:**  
Interpretar resultados de evaluación para tomar decisiones informadas.

---

### Lección 7: Despliegue de un modelo de ML
- Guardar modelos entrenados con `joblib`.
- Crear una API con `Flask` para servir predicciones.
- Probar el servicio con herramientas como Postman.

**Aprendizajes clave:**  
Desplegar modelos en ambientes que permitan su integración con aplicaciones reales.

---
## 🧩 Proyecto final: Clasificación de usuarios aptos para servicios financieros

### 🎯 Objetivo del proyecto
Diseñar un pipeline completo de Machine Learning para automatizar la evaluación crediticia de nuevos usuarios, utilizando un dataset simulado y desplegando una API funcional.

#### Objetivo general:
- Automatizar decisiones crediticias mediante aprendizaje automático.

#### Objetivos específicos:
- Realizar análisis exploratorio y preprocesamiento.
- Entrenar y validar modelos de clasificación supervisada.
- Desplegar el modelo como API funcional accesible vía web con FastAPI y Ngrok.

---

## 🔁 Flujo de trabajo

1. Análisis exploratorio del dataset simulado  
2. Preprocesamiento: encoding, escalamiento, limpieza  
3. Entrenamiento del modelo con Random Forest  
4. Validación cruzada (k-fold) y evaluación con métricas  
5. Serialización del modelo con `joblib`  
6. Despliegue del modelo como API usando FastAPI + Ngrok  
7. Documentación técnica y pruebas de predicción (Swagger UI y `curl`)

---

## ✅ Resultados y logros técnicos

- Entrenamiento de un modelo **Random Forest Classifier** con buena capacidad predictiva.
- Evaluación robusta con métricas:
  - **Accuracy:** 0.89  
  - **Precision:** 0.88  
  - **Recall:** 0.84  
  - **F1 Score:** 0.86  
  - **AUC-ROC:** 0.91
- Despliegue exitoso como API con FastAPI, probada vía Swagger UI y `curl`.
- Uso de Ngrok para exponer el servicio en un entorno remoto (Google Colab).

---

## 🛠️ Tecnologías y herramientas utilizadas

- **Python**  
- **Google Colab**  
- **Librerías:** `pandas`, `numpy`, `scikit-learn`, `matplotlib`, `seaborn`, `joblib`, `fastapi`, `uvicorn`, `pyngrok`  
- **Herramientas de prueba:** Swagger UI (`/docs`), `curl` en terminal  
- **Materiales de apoyo:** Clases virtuales, contenidos del módulo, ejercicios prácticos

---

## 💡 Habilidades desarrolladas

- Análisis y preparación de datos simulados  
- Ingeniería de características y normalización  
- Entrenamiento y validación cruzada de modelos  
- Evaluación con métricas de clasificación  
- Despliegue de modelos como APIs REST con FastAPI  
- Exposición de servicios mediante túneles seguros con Ngrok  
- Documentación técnica y pruebas automatizadas

---

## 📌 Instrucciones de uso

1. Abrir el notebook `proyecto_ML_colab.ipynb` en Google Colab.  
2. Ejecutar las celdas para cargar datos, entrenar el modelo y guardar `modelo_credito_pipeline.joblib`.  
3. Ejecutar `app.py` con FastAPI y lanzar túnel con `pyngrok` para exponer el servicio.  
4. Probar el endpoint `/predict` mediante Swagger UI (`/docs`) o con `curl`.  
5. Consultar el archivo `README.md` para ver ejemplos de payloads y respuestas.

---


## 🧠 Conclusiones y reflexión final

Este módulo permitió desarrollar una comprensión integral del proceso de creación de modelos de machine learning, desde la teoría hasta la práctica. A través de ejercicios progresivos y un proyecto final desafiante, se consolidaron habilidades esenciales para el perfil de ingeniero/a de datos.  

El despliegue del modelo como servicio demuestra la aplicabilidad real de los contenidos aprendidos. Esta experiencia resultó enriquecedora tanto a nivel técnico como reflexivo, marcando un avance significativo en el camino profesional.  

Se reconoce la importancia de la práctica continua, el monitoreo de modelos y la mejora constante como claves para avanzar en esta disciplina.