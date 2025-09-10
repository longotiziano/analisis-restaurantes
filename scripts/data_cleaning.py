from scripts.transformers import transformar_precios, transformar_unidades
from scripts.helpers import obtener_materias_primas, obtener_coincidencias_mp, asignacion_de_precios
import tabula
import pandas as pd
from pathlib import Path

# Configuración temporal para visualizar DataFrames enteros
pd.set_option('display.max_rows', None)

# Creación de directorios
BASE_DIR = Path(__file__).parent.parent
dir_ipc = BASE_DIR / "data" / "indec"
dir_merc_central = BASE_DIR / "data" / "mercado-central"
dir_limpio = BASE_DIR / "data" / "datos-limpios"

lista_de_codigos = ["11", "11.1", "01.1.1"]

# Realizo un ciclo para obtener los codigos que me interesan (del 01.1.1 al 01.2.2)
for i in range(1, 11):
    x = 1
    if i % 8 >= 1:
        x = 2
        i = i % 8
    lista_de_codigos.append(f"01.{str(x)}.{str(i)}")

# Filtrado del CSV del INDEC, con los codigos correspondientes de los datos que me interesan
path_ipc = f"{dir_ipc}/serie_ipc_aperturas.csv"
indec_df = pd.read_csv(path_ipc, encoding="ISO-8859-1", delimiter=";")
filtered_indec_df = indec_df[indec_df["Codigo"].isin(lista_de_codigos) ].dropna()

# Guardado del archivo CSV limpio
path_indec_limpio = f"{dir_limpio}/aperturas_ipc_limpio.csv"
filtered_indec_df.to_csv(path_indec_limpio, sep=";")

# Extracción de tablas del informe del INDEC
path_informe = f"{dir_ipc}/informe_indec.pdf"
tablas_indec = tabula.read_pdf(path_informe, pages=12, multiple_tables=True)
df_precios = pd.concat(tablas_indec, ignore_index=True)

# Asignación de columnas y limpieza
df_precios = df_precios.drop(df_precios.columns[3:], axis=1)
df_precios.columns = ["variedad", "unidad_de_medida", "precio"]
df_precios = df_precios.dropna()

# Elimino tildes y paso a snake_case
df_precios = df_precios.map(transformar_precios)
df_precios["precio"] = df_precios["precio"].astype(float)

# Ampliación del DataFrame con frutas, hortalizas y demás productos
path_frutas = f"{dir_merc_central}/frutas.xlsx" 
path_hortalizas = f"{dir_merc_central}/hortalizas.xlsx" 

df_frutas = pd.read_excel(path_frutas, engine="openpyxl")
df_hortalizas = pd.read_excel(path_hortalizas, engine="openpyxl")

# Convinación y obtención de columnas que me interesan y promedio de precios en el DataFrame por producto
df_ortofruticulas = (
    pd.concat([df_frutas, df_hortalizas], ignore_index=True)[['ESP', 'MOPK']]
      .dropna()
      .groupby('ESP')['MOPK']
      .mean()
      .reset_index()
      .rename(columns={'ESP': 'variedad', 'MOPK': 'precio'})
)
df_ortofruticulas['variedad'] = df_ortofruticulas['variedad'].map(transformar_precios)
df_ortofruticulas['unidad_de_medida'] = 'kg'

# Agregado del DataFrame 
precios_indec = pd.concat([df_precios, df_ortofruticulas], ignore_index=True).sort_values(by='variedad')

# Transformación a un mismo formato respecto a unidades de medida
indec_transformado = transformar_unidades(precios_indec).round({'precio': 1})

# Me quedo con los precios más recientes
indec_filtrado = (
    indec_transformado
    .sort_values(by=["variedad", "precio"], ascending=[True, False])
    .drop_duplicates(subset="variedad", keep="first")
)

# Me quedo con los precios más actualizados del DataFrame
materias_primas = obtener_materias_primas()
df_validos = obtener_coincidencias_mp(materias_primas, indec_filtrado)
mps_no_encontradas = sorted([mp for mp in materias_primas.items() if mp not in df_validos])

# Creo el archivo csv preparado para ser ingresada en la base de datos
lista_precios = asignacion_de_precios(df_validos, indec_filtrado)

print(f"Mps no encontradas {len(mps_no_encontradas)}: {mps_no_encontradas}\n")
print(len(materias_primas), "\n")
print(materias_primas, "\n")


# Creación de CSV
path_precios_limpio = f"{dir_limpio}/precios_indec.csv"
indec_transformado.to_csv(path_precios_limpio, sep=";")

