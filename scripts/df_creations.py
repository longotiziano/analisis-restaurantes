from scripts.helpers import obtener_estacion, obtener_actividad_por_estacion, multiplicador_especialidad
from sql.database import engine, SessionLocal
from sql.models import Ventas
import pandas as pd

def generar_ventas_aleatorias() -> pd.DataFrame:
    """
    Genero el DataFrame que contiene todas las ventas
    """
    query = """
        WITH 
        -- Calculo la cantidad de productos por especialidad y por restaurante.
        prod_de_esp AS (
            SELECT 
                r_id, 
                especialidad_id,
                pde.categoria_id,
                -- Utilizo la division para estimar resultados logicos.
                (pde.cantidad * (FLOOR(RANDOM() * 6 + 5)/30)) AS cant_productos
            FROM productos_de_especialidades pde
            JOIN restaurantes USING (especialidad_id)
        ),
        -- Calculo, para cada restaurante y cada categoria de materia prima, la cantidad total de materia prima utilizada para esa categoria.
        cmp_de_prod AS (
            SELECT
                pde.r_id, 
                cmp_id,
                (SUM(cmpp.cantidad * pde.cant_productos) * (FLOOR(RANDOM() * 6 + 5)/6)) AS prod_por_mat_cat
            FROM cat_mat_primas_de_productos cmpp
            JOIN cat_materia_prima cmp ON cmp.cmp_id = cmpp.categoria_mp_id
            JOIN prod_de_esp pde ON cmpp.categoria_prod_id = pde.categoria_id
            GROUP BY r_id, cmp_id
        ),
        -- Calculo la cantidad real de cada materia prima que se va a usar en cada restaurante.
        mp_de_mpc AS (
            SELECT
                cdp.r_id,
                mpc.id_materia_prima AS mp_id,
                ROUND((SUM(mpc.mp_cantidad * cdp.prod_por_mat_cat) / 1000)::NUMERIC, 1) AS cantidad_kg
            FROM mat_primas_de_categorias mpc
            JOIN cmp_de_prod cdp ON mpc.id_cat_materia_prima = cdp.cmp_id
            JOIN materia_prima mp ON mpc.id_materia_prima = mp.mp_id
            GROUP BY cdp.r_id, mpc.id_materia_prima, mp.mp_nombre
        )
        SELECT * FROM mp_de_mpc;
            """
    
    fechas = pd.date_range(start='2021-01-01', end='2025-08-01', freq='MS')
    fechas_lista = fechas.strftime('%Y-%m-%d').tolist()
    lista_ventas = []
    # Itero en el rango de fechas establecido, repitiendo la consulta escrita para cada mes
    for fecha in fechas_lista:
        df = pd.read_sql(query, engine)
        df['fecha'] = fecha
        # Aplico el multiplicador en base a la estación
        estacion = obtener_estacion(fecha)
        df['cantidad_kg'] = df['cantidad_kg'] * obtener_actividad_por_estacion(estacion)
        df['cantidad_kg'] = df['cantidad_kg'] * multiplicador_especialidad(df['r_id'], estacion)

        lista_dicts = df.to_dict(orient='records')
        lista_ventas.extend(lista_dicts)

    return lista_ventas

lista_ventas = generar_ventas_aleatorias()

with SessionLocal() as session:
    session.bulk_insert_mappings(Ventas, lista_ventas)
    session.commit()





















































