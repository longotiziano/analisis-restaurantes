import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).parent.parent
directory = BASE_DIR / "data"
path = f"{directory}/serie_ipc_aperturas.csv"

df = pd.read_csv(path, encoding="ISO-8859-1", delimiter=";")
df = df[df['Descripcion_aperturas'].str.contains('Restau', na=False)].dropna()

print(df)