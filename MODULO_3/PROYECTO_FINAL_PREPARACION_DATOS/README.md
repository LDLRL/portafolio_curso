# Documento Resumen del Proyecto  
**Módulo 3 - Obtención y Preparación de Datos**  
**Proyecto: Preparación y Limpieza de Datos para Análisis**

---

## 1. Justificación del uso de NumPy y Pandas

Durante este proyecto utilicé **NumPy** y **Pandas** porque son herramientas clave para el tratamiento de datos en Python. NumPy me permitió generar datos numéricos sintéticos de forma rápida y eficiente, usando arrays y funciones estadísticas. Por su parte, Pandas me ofreció estructuras como `DataFrame` y funciones avanzadas para cargar, explorar, limpiar, transformar y exportar los datos, facilitando todo el flujo de trabajo de principio a fin.

---

## 2. Descripción del dataset generado y de las fuentes externas integradas

Comencé generando un conjunto de datos ficticio con NumPy que incluía:
- Un array de 100 identificadores únicos de clientes (`ID_Cliente`).
- Un array con montos de compra simulados con distribución normal.
- Un array con edades aleatorias entre 18 y 70 años.

Posteriormente, incorporé otras dos fuentes externas:
- Un archivo Excel con información adicional sobre la **frecuencia de compra** de algunos clientes.
- Una tabla web extraída desde Wikipedia (como ejercicio práctico de carga desde web), que sirvió para probar la función `read_html()`.

Finalmente, unifiqué todos los datos en un único `DataFrame` utilizando `merge()` para integrar la información de clientes y sus comportamientos.

---

## 3. Técnicas aplicadas para la limpieza y transformación

En el proceso apliqué varias técnicas para mejorar la calidad de los datos:

### Limpieza:
- **Valores nulos:** Detecté valores faltantes en la columna `Frecuencia_Compra` y los completé con la **media de la columna**, ya que era una variable numérica continua.
Es importante destacar que si la variable hubiera presentado una distribución irregular o con muchos valores extremos, lo más adecuado habría sido utilizar la **mediana** para evitar que esos extremos influyeran en el valor imputado. En este caso, previamente eliminé los outliers utilizando el método del IQR, lo que estabilizó la distribución de los datos. Por esa razón, el uso de la media fue apropiado y efectivo para este conjunto limpio.

- **Outliers:** Utilicé el método **IQR (rango intercuartílico)** para detectar valores atípicos en `Monto_Compra`, y eliminé los registros que caían fuera de los límites definidos.

### Transformación (Data Wrangling):
- Eliminé duplicados del `DataFrame`.
- Transformé tipos de datos para asegurar consistencia.
- Creé una nueva columna categórica `Segmento_Edad` según rangos etarios definidos (`Joven`, `Adulto`, `Mayor`).
- Generé una columna `Categoria_Monto` para clasificar el nivel de gasto del cliente como `Baja`, `Media` o `Alta`, usando una función `lambda`.

### Agrupamiento y estructuración:
- Usé `groupby()` para obtener estadísticas por segmento etario.
- Reorganicé la información con `pivot_table()` y `melt()` para preparar los datos para diferentes tipos de análisis.

---

## 4. Principales decisiones tomadas y desafíos encontrados

- Una de las principales decisiones fue **reemplazar valores nulos con la media**, lo cual me pareció apropiado por la naturaleza de los datos (frecuencia de compra).
- Decidí **eliminar los outliers extremos** porque alteraban las métricas globales y podían afectar un futuro modelo predictivo.
- Un desafío fue la integración de datos provenientes de diferentes fuentes con distintos formatos. Tuve que ajustar el `merge()` para asegurar que los clientes se emparejaran correctamente entre CSV y Excel.
- Otro punto importante fue organizar el código en bloques claros por cada lección, facilitando la trazabilidad de cada etapa del proyecto.

---

## 5. Resultados obtenidos y estado final del dataset

El resultado final es un **dataset limpio, confiable y estructurado**, exportado en formato **CSV y Excel**, listo para su análisis o para alimentar un modelo de machine learning.

El dataset contiene:
- Datos de 100 clientes sin duplicados.
- Columnas limpias y transformadas (`Edad`, `Monto_Compra`, `Frecuencia_Compra`, `Segmento_Edad`, `Categoria_Monto`).
- Todos los pasos de limpieza, transformación, agrupamiento y combinación realizados de forma transparente y documentada.

El proceso fue automatizado en un script modular en Python, usando únicamente NumPy y Pandas, cumpliendo con todos los requerimientos solicitados por la gerencia de datos.
