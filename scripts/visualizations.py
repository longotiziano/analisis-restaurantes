import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
from sql.database import engine

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

df_ventas = pd.read_sql(query_ventas, engine)
print(df_ventas)
