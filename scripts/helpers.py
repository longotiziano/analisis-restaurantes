from datetime import date

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
        

