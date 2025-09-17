
# Módulo 8: Integración de Datos

Este módulo abordó los fundamentos y la implementación práctica de arquitecturas de integración de datos modernas, combinando flujos batch y streaming en un entorno simulado. Se utilizaron herramientas como Apache NiFi y Apache Kafka para simular la ingesta de datos desde múltiples fuentes (archivos, sensores IoT, APIs), aplicando transformaciones, validaciones y monitoreo automatizado.

El enfoque se centró en diseñar una solución para una empresa logística que necesita integrar diversas fuentes de datos para mejorar su análisis en tiempo real, optimizar procesos y facilitar la toma de decisiones basadas en datos confiables y oportunos.

---

## Lecciones y Ejercicios de Clase

### Lección 1: Fundamentos de la integración de datos

**Objetivo:** Comprender principios, beneficios, tipos y buenas prácticas de integración.

**Aplicación:** Se analizó el caso de una empresa de logística inteligente, definiendo los tipos de integración más adecuados:

- **Consolidación:** Para centralizar datos históricos y operacionales.
- **Replicación:** Para sincronizar sistemas aún no migrados.
- **Virtualización:** Para acceso en tiempo real sin mover físicamente los datos.

**Resultado:** Diseño del mapa conceptual del flujo de integración, con fuentes heterogéneas (CSV, JSON, logs, API), herramientas de ingesta (NiFi, Kafka), transformaciones, almacenamiento temporal y capa de consumo. Se justificó el uso de NiFi y Kafka como herramientas centrales para construir una arquitectura modular y escalable.

---

### Lección 2: Ingesta de datos batch con Apache NiFi

**Objetivo:** Implementar flujos de ingesta por lotes simulando lectura desde archivos locales, aplicando transformaciones y validaciones.

**Simulación:** Archivos CSV, JSON y TXT como fuentes de datos logísticos.

**Diseño del flujo en NiFi:**

- `ListFile` → `FetchFile` → `UpdateAttribute` → `RouteOnAttribute`
- Para CSV: `ConvertRecord`, `QueryRecord`, `ValidateRecord`
- Para JSON: `JoltTransformJSON`, `ValidateRecord`
- Validaciones y salida con `PutFile`
- Automatización con `cron` y alertas por `PutEmail`

**Resultado:** Archivos limpios guardados, errores controlados, flujo modular y completamente automatizado.

---

### Lección 3: Ingesta de datos en streaming

**Objetivo:** Simular procesamiento de eventos en tiempo real con lógica de enriquecimiento y control por ventana temporal.

**Simulación:** Socket TCP con `netcat`, ingesta en NiFi usando `ListenTCP`, enriquecimiento y procesamiento con `UpdateRecord`, `QueryRecord`, y almacenamiento por ventanas.

**Condiciones aplicadas:**

- Clasificación de eventos según prioridad y tipo.
- Enriquecimiento con timestamp y categorización.
- Alerta o enrutamiento según contenido del mensaje.

**Resultado:** Flujo en tiempo real funcional con ventanas de 1 minuto, comparación con ingesta batch destacando ventajas del streaming en tiempo real.

---

### Lección 4: Automatización y orquestación de flujos

**Objetivo:** Integrar flujos batch y streaming en una arquitectura automatizada con monitoreo y control de errores.

**Estructura general:**

1. **Ingesta Batch:** `GetFile` + validaciones + `PutFile`
2. **Ingesta Streaming:** `ListenTCP` + lógica condicional + `PutFile`
3. **Automatización:** `TimerDriven`, `RetryFlowFile`, `SendEmail`

**Ventajas destacadas:** Modularidad, monitoreo visual, integración de flujos mixtos.

**Limitaciones:** Complejidad de interfaz y gestión de errores en flujos avanzados.

---

## Proyecto de Módulo

### Descripción

El proyecto integrador simula una arquitectura completa de integración de datos en una empresa logística inteligente, uniendo flujos batch y streaming mediante Apache NiFi.

### Objetivo General

Diseñar un flujo robusto y automatizado para integrar datos operacionales desde múltiples fuentes (archivos CSV, JSON, logs y socket TCP), aplicando validaciones, transformaciones y monitoreo.

### Objetivos Específicos

- Automatizar ingesta batch y streaming en Apache NiFi.
- Enriquecer eventos y aplicar lógica condicional.
- Procesar por ventanas temporales.
- Implementar alertas y control de errores.

### Estructura y Flujo

- **Fuentes:** CSV (ventas), JSON (sensores), logs TXT, socket TCP.
- **Procesos batch:** limpieza, validación, filtrado.
- **Procesos streaming:** enriquecimiento, clasificación, almacenamiento por ventana.
- **Monitoreo:** envío de alertas, auditoría de errores.

### Logros y Resultados

- Flujo operativo y modular.
- Validación automática de estructuras.
- Simulación funcional de eventos en tiempo real.
- Flujo 100% automatizado y documentado.

### Habilidades Desarrolladas

- Diseño de arquitectura de integración.
- Uso práctico de Apache NiFi para flujos mixtos.
- Simulación de eventos y socket TCP.
- Documentación técnica y pseudodiagramas.

### Recursos Utilizados

**Entorno de desarrollo:** Google Colab (documentación), Apache NiFi local.

**Tecnologías y herramientas:**

- Apache NiFi
- Apache Kafka (referencia conceptual)
- Python (documentación y pseudocódigo)
- Socket TCP (Netcat)
- CSV / JSON / TXT (fuentes simuladas)

**Materiales de apoyo:**

- Manuales del módulo (4 lecciones)
- Ejercicios prácticos por lección
- Documentación oficial

### Conclusiones

Este módulo consolidó los fundamentos de integración de datos mediante una experiencia práctica completa. Se aprendió a integrar fuentes heterogéneas en una arquitectura modular con flujos batch y streaming, destacando la automatización, monitoreo, control de errores y valor del procesamiento en tiempo real.

---

### Pseudodiagrama de flujo implementado

**Ingesta Batch:**

```
ListFile → FetchFile → UpdateAttribute → RouteOnAttribute
├──> CSV: ConvertRecord → QueryRecord → ValidateRecord → PutFile (/output/csv)
└──> JSON: JoltTransformJSON → ValidateRecord → PutFile (/output/json)
```

**Ingesta Streaming:**

```
ListenTCP (puerto 9999) → SplitText → ParseJSON → UpdateRecord
→ RouteOnAttribute (condiciones por tipo_evento o prioridad)
→ QueryRecord (ventana de 1 minuto) → PutFile (/output/stream)
```

**Monitoreo y Automatización:**

```
TimerDriven → RetryFlowFile → LogAttribute
+ SendEmail (en caso de error)
+ LogMessage (traza de errores)
```

---

### Guía de ejecución del flujo

**Requisitos previos:**

- Apache NiFi instalado
- Netcat (opcional)
- Archivos simulados: `ventas.csv`, `rutas.json`, `logs.txt`

**1. Iniciar NiFi:**

http://localhost:8080/nifi

**2. Importar o reconstruir el flujo:**

Usando el pseudodiagrama anterior

**3. Ingesta Batch:**

Colocar archivos en `/input/batch`

**4. Ingesta Streaming:**

Usar Netcat: `nc -lk 9999`

Enviar línea JSON por línea.

**5. Resultados:**

Archivos procesados en `/output/csv`, `/output/json`, `/output/stream`

Logs y errores visibles en la consola NiFi

---
