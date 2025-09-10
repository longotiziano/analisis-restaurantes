from scripts.equivalencias import equivalencias
from sql.database import SessionLocal
from sql.models import Restaurantes, Especialidades, MateriaPrima
from datetime import date
import pandas as pd

def obtener_estacion(fecha: date) -> str:
    """
    Obtengo la estación del año en base a una fecha
    """
    year = fecha.year
    
    # Defino los rangos de las estaciones
    otoño_inicio = date(year, 3, 21)
    invierno_inicio = date(year, 6, 21)
    primavera_inicio = date(year, 9, 21)
    verano_inicio = date(year, 12, 21)
    
    if otoño_inicio <= fecha < invierno_inicio:
        return "otoño"
    elif invierno_inicio <= fecha < primavera_inicio:
        return "invierno"
    elif primavera_inicio <= fecha < verano_inicio:
        return "primavera"
    else:
        return "verano"
    
def obtener_actividad_por_estacion(estacion: str) -> float:
    """
    Obtengo el multiplicador de actividad general en base a la estación del año
    """
    act_por_estacion = {
        "otoño":0.8,
        "invierno":0.6,
        "primavera":1,
        "verano":1.3
    }
    return act_por_estacion[estacion]
    
def obtener_actividad_por_especialidad(especialidad: str, estacion: str) -> float:
    """
    Obtengo el multiplicador de actividad en base a la especialidad y su estación
    """
    actividad_especialidad = {
        "internacional_gourmet": {
            "verano": 0.7,
            "otoño": 0.85,
            "invierno": 0.95,
            "primavera": 0.8
        },
        "local_regional_argentina": {
            "verano": 0.85,
            "otoño": 0.9,
            "invierno": 0.75,
            "primavera": 0.95
        },
        "parrilla": {
            "verano": 0.95,
            "otoño": 0.85,
            "invierno": 0.7,
            "primavera": 0.9
        },
        "casera_cafeteria": {
            "verano": 0.6,
            "otoño": 0.85,
            "invierno": 0.95,
            "primavera": 0.8
        },
        "pescados_y_mariscos": {
            "verano": 0.95,
            "otoño": 0.85,
            "invierno": 0.65,
            "primavera": 0.9
        }
    }
    return actividad_especialidad[especialidad][estacion]

def obtener_especialidades() -> dict:
    """
    Helper utilizado para obtener la especialidad de la ID del restaurante asignado
    """
    with SessionLocal() as session:
        mapping = dict(session.query(Restaurantes.r_id, Especialidades.nombre_especialidad)
                            .join(Especialidades, Restaurantes.especialidad_id == Especialidades.especialidad_id)
                            .all())
        
    return mapping or "No encontrados"
        
def obtener_materias_primas() -> dict:
    """
    Helper utilizado para obtener las materias primas con su ID
    """
    with SessionLocal() as session:
        mapping = dict(session.query(MateriaPrima.mp_nombre, MateriaPrima.mp_id).all())
        
    return mapping or "No encontrados"

def obtener_coincidencias_mp(mp_dict: dict, df_precios: pd.DataFrame) -> pd.DataFrame:
    """
    Dada una lista de materias primas y un DataFrame de precios encuentra las similitudes y retorna
    un DataFrame con las coincidencias y sus precios.
    """
    # Reemplazar nombres de mp_dict según equivalencias
    mp_dict = {equivalencias.get(k, k): v for k, v in mp_dict.items()}
    
    dict_validos = {}
    dict_invalidos = {}

    for row in df_precios.itertuples():
        for mp, value in list(mp_dict.items()):  
            # Dividir el nombre de la mp en palabras
            palabras_mp = mp.split("_")
            # Si alguna palabra coincide con row.variedad
            if any(palabra in row.variedad for palabra in palabras_mp):
                dict_validos[row.variedad] = value
                matched = True
                break  # Salimos del bucle porque ya encontramos coincidencia

        if row.variedad in mp_dict:
            dict_validos[row.variedad] = mp_dict[row.variedad]
        else:
            dict_invalidos[row.variedad] = None
    
    print(f"No se han encontrado conincidencias para {len(dict_invalidos)}: {dict_invalidos}\n")
    df_coincidencias = pd.DataFrame(list(dict_validos.items()), columns=["variedad", "mp_id"]).sort_values(by="mp_id", ascending=True, inplace=False)
    print(f"Se han encontrado coincidencias para {len(dict_validos)}: {dict_validos}\n")

    return df_coincidencias

def asignacion_de_precios(df_coincidencias: pd.DataFrame, df_precios: pd.DataFrame) -> list:
    """
    Creo la lista de diccionarios que sera ingresada en la base de datos en base a las coincidencias
    de dos DataFrames y asignandoles sus respectivos precios.
    """
    mps_con_precio = [] 

    for coincidencia in df_coincidencias.itertuples():
        for precio in df_precios.itertuples():
            if coincidencia.variedad == precio.variedad:
                mps_con_precio.append({"mp_id": coincidencia.mp_id, "precio": precio.precio, "unidad_de_medida": "kg"})
                
    df = pd.DataFrame(mps_con_precio)

    from scripts.data_cleaning import dir_limpio

    df.to_csv(f"{dir_limpio}/precios_indec_limpios.csv", index=False) 












                        

        

