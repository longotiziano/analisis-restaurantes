from scripts.helpers import transformar_precios, obtener_materias_primas
import tabula
import unidecode
import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).parent.parent
directory_ipc = BASE_DIR / "data" / "indec"
path_ipc = f"{directory_ipc}/serie_ipc_aperturas.csv"

lista_de_codigos = ["11", "11.1", "01.1.1"]

# Realizo un ciclo para obtener los codigos que me interesan (del 01.1.1 al 01.2.2)
for i in range(1, 11):
    x = 1
    if i % 8 >= 1:
        x = 2
        i = i % 8
    lista_de_codigos.append(f"01.{str(x)}.{str(i)}")

# Filtrado del CSV del INDEC, con los codigos correspondientes de los datos que me interesan
indec_df = pd.read_csv(path_ipc, encoding="ISO-8859-1", delimiter=";")
filtered_indec_df = indec_df[indec_df["Codigo"].isin(lista_de_codigos) ].dropna()

# Guardado del archivo CSV limpio
directorio_limpio = BASE_DIR / "data" / "datos-limpios"
path_indec_limpio = f"{directorio_limpio}/aperturas_ipc_limpio.csv"
filtered_indec_df.to_csv(path_indec_limpio, sep=";")

# Extracción de tablas del informe del INDEC
path_informe = f"{directory_ipc}/informe_indec.pdf"
tablas_indec = tabula.read_pdf(path_informe, pages=12, multiple_tables=True)
df_precios = pd.concat(tablas_indec, ignore_index=True)

# Asignación de columnas y limpieza
df_precios = df_precios.drop(df_precios.columns[3:], axis=1)
df_precios.columns = ["variedad", "unidad_de_medida", "precio"]
df_precios = df_precios.dropna()

# Elimino tildes y paso a snake_case
df_precios = df_precios.applymap(transformar_precios)
df_precios["precio"] = df_precios["precio"].astype(float)

# Ampliación del DataFrame con frutas, hortalizas y carnes

# Obtencion de valores que me interesan y agregado de Foreign Key.
materias_primas = obtener_materias_primas()
dict_validos = {}
dict_invalidos = {}

for row in df_precios.itertuples():
    try:
        dict_validos[row.variedad] = materias_primas[row.variedad]
    except KeyError:
        dict_invalidos[row.variedad] = None

# Revisión de valores no encontrados
mps_no_encontradas = [mp for mp in materias_primas.items() if mp not in dict_validos]

print(dict_validos)
print('============================')
print(dict_invalidos)
print('============================')
print(mps_no_encontradas)




# Creación de CSV
path_precios_limpio = f"{directorio_limpio}/precios_indec.csv"
df_precios.to_csv(path_precios_limpio, sep=";")

