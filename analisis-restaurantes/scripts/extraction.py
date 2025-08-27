import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).parent.parent
directory_ipc = BASE_DIR / "data" / "indec"
path_ipc = f"{directory_ipc}/serie_ipc_aperturas.csv"

lista_de_codigos = ["11", "11.1"]

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

directorio_limpio = BASE_DIR / "data" / "datos-limpios"
path_limpio = f"{directorio_limpio}/aperturas_ipc_limpio.csv"
    
filtered_indec_df.to_csv(path_limpio, sep=";")
