
# 🧩 Proyecto de Integración de Datos: Arquitectura Batch + Streaming

**Módulo 8: Integración de Datos - Bootcamp IA / Big Data**

Este proyecto simula el diseño e implementación de una arquitectura moderna de integración de datos para una empresa de logística inteligente. La solución contempla flujos batch y streaming, aplicando automatización, monitoreo y orquestación con herramientas como **Apache NiFi** y **Kafka/simulaciones**.

---

## 📍 Contexto del Caso Simulado

La empresa presenta los siguientes desafíos:

- Sistemas operando de forma aislada (silos de datos)
- Falta de trazabilidad y duplicidad de registros
- Retrasos en generación de reportes operativos
- Necesidad de monitorear sensores distribuidos (IoT)

Se requiere una arquitectura **modular, escalable y resiliente** que integre múltiples fuentes heterogéneas de datos (archivos CSV, JSON, logs, API REST), gestionando flujos batch y en tiempo real.

---

## 🎯 Objetivos

- Diseñar una arquitectura híbrida (batch + streaming)
- Implementar flujos funcionales con herramientas reales
- Aplicar transformaciones, validaciones y monitoreo
- Orquestar tareas con lógica de automatización y control de errores
- Documentar las decisiones técnicas tomadas

---

## 🏗️ Arquitectura Propuesta

```
FUENTES DE DATOS HETEROGÉNEAS
│
├── Archivo CSV (Ventas)
├── JSON API (Incidentes IoT)
└── Logs del sistema (TXT)

      │
      ▼

INGESTA BATCH (Apache NiFi)
│
├── Scheduler programado
├── Validación de esquema
├── Transformaciones básicas
└── Almacenamiento temporal (Landing Zone)

      │
      ▼

INGESTA STREAMING (Apache Kafka / Simulación)
│
├── Escucha socket / File Listener
├── Enriquecimiento condicional
├── Procesamiento por ventanas
└── Garantías de entrega (at-least-once)

      │
      ▼

PROCESAMIENTO Y ENRUTAMIENTO (NiFi / Kafka Streams)
│
├── Join de flujos batch y streaming
├── Reglas de negocio (ej: temperatura crítica)
├── Transformaciones avanzadas
└── Envío a Data Lake o almacenamiento intermedio

      │
      ▼

MONITOREO Y AUTOMATIZACIÓN
│
├── Alertas por condición (ej: exceso de errores)
├── Métricas de procesamiento
├── Webhooks / notificaciones automáticas
└── Control de errores y reintentos

      │
      ▼

CAPA DE CONSUMO / REPORTING
│
├── Dashboard operativo (Power BI / Grafana)
├── Consolidación para reportes
└── Entrenamiento ML o análisis adicional
```

---

## 🛠️ Herramientas Utilizadas

| Herramienta       | Uso Principal                                      |
|-------------------|----------------------------------------------------|
| **Apache NiFi**   | Orquestación de flujos batch y streaming           |
| **Kafka (simulado)** | Ingesta en tiempo real (simulada con socket TCP)  |
| **Netcat (nc)**   | Simulación de eventos en tiempo real por socket    |
| **Shell / Bash**  | Envío de datos y pruebas locales                   |
| **JSON / CSV / TXT** | Fuentes de datos heterogéneas                     |

---

## ⚙️ Estructura del Proyecto

```
├── input/
│   ├── ventas.csv
│   ├── rutas.json
│   └── logs.txt
├── output/
│   ├── batch/
│   ├── json/
│   └── stream/
├── templates/
│   └── flujo_nifi.xml (opcional)
└── README.md
```

---

## 🚀 Guía de Ejecución (Modo Simulado)

### Requisitos:

- Apache NiFi (v1.21+)
- Java 8+
- Netcat (para streaming TCP simulado)

### Paso a paso:

1. Iniciar NiFi en `http://localhost:8080/nifi`
2. Crear el flujo siguiendo el pseudodiagrama o importar plantilla XML
3. Colocar archivos CSV/JSON en `/input/batch`
4. Ejecutar envío de datos en tiempo real por consola:
   ```bash
   nc -lk 9999
   ```
   Ejemplo de evento:
   ```json
   {"id_evento": 1001, "tipo_evento": "sensor_iot", "mensaje": "Alta temperatura", "prioridad": "alta"}
   ```
5. Verificar resultados en `/output/` y logs de NiFi

---

## 🧪 Flujos Implementados (Resumen Técnico)

### Ingesta Batch (NiFi):

```
ListFile → FetchFile → UpdateAttribute → RouteOnAttribute
├──> CSV: ConvertRecord → QueryRecord → ValidateRecord → PutFile
└──> JSON: JoltTransformJSON → ValidateRecord → PutFile
```

### Ingesta Streaming:

```
ListenTCP (9999) → SplitText → ParseJSON → UpdateRecord
→ RouteOnAttribute (por tipo_evento/prioridad)
→ QueryRecord (ventana temporal) → PutFile
```

### Automatización y Control:

```
TimerDriven → RetryFlowFile → LogAttribute
+ SendEmail (alertas)
+ LogMessage (errores críticos)
```

---

## 📌 Conclusiones y Aprendizajes

- Separar flujos batch y streaming permitió mayor claridad, modularidad y escalabilidad.
- Apache NiFi resultó eficaz como herramienta visual para automatizar y monitorear procesos de integración.
- Simular el streaming permitió explorar lógica de ventanas, enriquecimiento y clasificación de eventos críticos.
- Incorporar control de errores desde el diseño mejoró la confiabilidad del sistema.
- Se reforzaron habilidades técnicas en ingesta de datos, mensajería asíncrona, transformaciones ETL y diseño de arquitecturas modernas.

