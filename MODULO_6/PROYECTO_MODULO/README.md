# 🧠 Proyecto de Machine Learning - Evaluación Crediticia para Alke Wallet

## 📌 Contexto

La fintech **Alke Wallet** busca automatizar el proceso de evaluación crediticia de nuevos usuarios. Actualmente esta evaluación es manual, lo que genera demoras y errores. Como ingeniera de datos, se me solicitó diseñar un **pipeline completo de Machine Learning** que permita clasificar automáticamente a los nuevos usuarios como "aptos" o "no aptos" para acceder a servicios financieros.

---

## 🎯 Objetivo del Proyecto

Desarrollar una solución de Machine Learning capaz de:

- Predecir la aptitud crediticia de un usuario.
- Desplegar el modelo como **API funcional** en un entorno de pruebas.
- Documentar cada paso del proceso de forma clara y reproducible.

---

## 🧩 Flujo del Proyecto

### 1. **Definición del Problema**

- Tipo de problema: **Clasificación binaria**  
- Objetivo: Predecir si un usuario es **Apto (1)** o **No apto (0)**

---

### 2. **Generación y Análisis Exploratorio del Dataset**

Se creó un dataset ficticio con las siguientes variables:

- `edad`
- `ingresos_mensuales`
- `antiguedad_laboral_anios`
- `deuda_total`
- `porcentaje_uso_credito`
- `morosidad_12m`
- `historial_crediticio`
- `tipo_empleo`
- `region`
- `tiene_tarjeta`
- `solicitante_nuevo`

Se realizaron análisis exploratorios para detectar outliers, correlaciones y distribución de variables.

---

### 3. **Preprocesamiento de Datos**

- **Encoding**: One-Hot y Label Encoding para variables categóricas.
- **Escalado**: `MinMaxScaler` aplicado a variables numéricas.
- **Ingeniería de características** para mejorar el rendimiento predictivo.
- **División de datos** en entrenamiento y test.

---

### 4. **Modelado y Evaluación**

Se entrenó un modelo **Random Forest Classifier** con `sklearn`.

- Se utilizó **k-fold cross-validation (k=5)** para validar desempeño.
- Se ajustaron hiperparámetros para evitar sobreajuste.

**Métricas obtenidas:**

| Métrica       | Valor  |
|---------------|--------|
| Accuracy      | 0.89   |
| Precision     | 0.88   |
| Recall        | 0.84   |
| F1 Score      | 0.86   |
| ROC AUC       | 0.91   |

---

### 5. **Serialización del Modelo**

El pipeline completo se guardó usando `joblib`:

```python
joblib.dump(pipeline, 'modelo_credito_pipeline.joblib')
```

---

### 6. **Despliegue como API con FastAPI + Ngrok**

El modelo fue desplegado como una API RESTful en Google Colab utilizando **FastAPI** y un túnel con **Ngrok**.

- **Ruta principal**: `POST /predict`
- **Entrada**: JSON con los atributos del usuario
- **Salida**: predicción binaria (`apto`) y probabilidad

#### Ejemplo de llamada (via `curl`):

```bash
curl -X POST "https://tu-url-ngrok.ngrok-free.app/predict" -H "Content-Type: application/json" -d '{
  "edad": 35,
  "ingresos_mensuales": 1500000,
  "antiguedad_laboral_anios": 5,
  "deuda_total": 800000,
  "porcentaje_uso_credito": 35.0,
  "morosidad_12m": 0,
  "historial_crediticio": "bueno",
  "tipo_empleo": "dependiente",
  "region": "metropolitana",
  "tiene_tarjeta": 1,
  "solicitante_nuevo": 0
}'
```

**Respuesta esperada:**

```json
{
  "prediccion_apto": 1,
  "probabilidad_apto": 0.91
}
```

---

## 🛠 Herramientas Utilizadas

- Python
- Pandas, Numpy
- Scikit-learn
- FastAPI
- Uvicorn
- Joblib
- Ngrok (modo túnel)
- Google Colab (entorno de desarrollo)

---

## 📂 Estructura del Proyecto

```
├── modelo_credito_pipeline.joblib      # Modelo serializado
├── app.py                              # Script FastAPI con endpoint /predict
├── notebook_entrenamiento.ipynb        # Proceso completo de EDA + entrenamiento
├── README.md                           # Documentación técnica del proyecto
```

---


## 📄 Instrucciones de uso

### 🔧 Requisitos previos

* Cuenta de Google para usar Google Colab.
* Cuenta gratuita en [ngrok.com](https://ngrok.com/) para generar un authtoken y habilitar el túnel seguro.
* Archivo del modelo entrenado `modelo_credito_pipeline.joblib` generado previamente.

---

### 🧪 Entrenar y guardar el modelo

1. Abre el notebook en Google Colab.
2. Ejecuta las celdas de preprocesamiento, entrenamiento y validación.
3. Guarda el modelo serializado con:

```python
import joblib
joblib.dump(modelo_entrenado, "modelo_credito_pipeline.joblib")
```

---

### 🚀 Desplegar API con FastAPI + Ngrok

1. Ejecuta la celda que contiene el siguiente código para escribir `app.py`:

```python
%%writefile app.py
# (tu código FastAPI completo aquí)
```

2. Inicia el servidor con:

```python
!uvicorn app:app --host 0.0.0.0 --port 8000
```

(Esta celda se quedará ejecutando. Déjala abierta.)

3. En una nueva celda, genera el túnel Ngrok:

```python
from pyngrok import ngrok
public_url = ngrok.connect(8000)
print(public_url)
```

---

### 🧪 Probar la API

Puedes probar la API de dos formas:

#### ✅ Desde el navegador (Swagger UI)

1. Copia y pega la URL que aparece (`https://xxxx.ngrok-free.app`).
2. Abre `/docs` (por ejemplo: `https://xxxx.ngrok-free.app/docs`).
3. Haz clic en `POST /predict`, luego en "Try it out", y completa el formulario.

#### ✅ Desde una celda en Colab con `curl`

```python
!curl -X POST "https://xxxx.ngrok-free.app/predict" -H "Content-Type: application/json" -d '{
  "edad": 35,
  "ingresos_mensuales": 1500000,
  "antiguedad_laboral_anios": 5,
  "deuda_total": 800000,
  "porcentaje_uso_credito": 35.0,
  "morosidad_12m": 0,
  "historial_crediticio": "bueno",
  "tipo_empleo": "dependiente",
  "region": "metropolitana",
  "tiene_tarjeta": 1,
  "solicitante_nuevo": 0
}'
```

---

### 🛑 Para detener el servidor

Si usaste:

```python
import subprocess
process = subprocess.Popen([...])
```

Entonces detén el servidor con:

```python
process.terminate()
```

---



## 🚨 Checklist de Validación Final

✅ Validación del modelo con métricas estándar  
✅ Despliegue de API con Ngrok para pruebas externas  
✅ Prueba del endpoint con datos simulados reales  
✅ Documentación técnica lista para entrega

---

## 📘 Referencias

- [Scikit-learn Documentation](https://scikit-learn.org)
- [FastAPI](https://fastapi.tiangolo.com)
- [Ngrok](https://ngrok.com)
- Curso Módulo 6: Machine Learning para Ingenieros de Datos