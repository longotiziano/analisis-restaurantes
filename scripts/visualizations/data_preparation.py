from sql.database import engine
import geopandas as gpd
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import requests
from io import BytesIO

# Obtengo los datos geográficos de las provincias
url = "https://apis.datos.gob.ar/georef/api/provincias.geojson"

response = requests.get(url)
response.raise_for_status() 

# Cargo el contenido a geopandas
mapa_provincias = gpd.read_file(BytesIO(response.content))

# Estilo de Seaborn
sns.set_theme(style="whitegrid", palette="deep")

# Parámetros globales de Matplotlib
plt.rcParams["figure.figsize"] = (10, 6)
plt.rcParams["axes.labelsize"] = 14
plt.rcParams["axes.titlesize"] = 16
plt.rcParams["xtick.labelsize"] = 12
plt.rcParams["ytick.labelsize"] = 12

query_ventas = '''
                SELECT 
                    nombre_restaurante, 
                    nombre_especialidad,
                    ubicacion, 
                    mp_nombre, 
                    SUM(cantidad_kg) AS mp_cantidad_total
                FROM ventas
                INNER JOIN materia_prima mp USING (mp_id)
                INNER JOIN restaurantes r USING (r_id)
                INNER JOIN especialidades USING (especialidad_id)
                GROUP BY nombre_restaurante, nombre_especialidad, ubicacion, mp_nombre
                ORDER BY mp_cantidad_total DESC, nombre_restaurante;
               '''

# Dataframe de ventas
df_ventas = pd.read_sql(query_ventas, engine)
print(df_ventas)
mapa_provincias.plot(edgecolor="black", facecolor="lightblue")
plt.show()
