import pandas as pd
import unidecode

def transformar_precios(celda):
    """
    Transformación a snake_case y eliminación de tildes.
    """
    if isinstance(celda, str):
        if "," not in celda and "." not in celda:
            celda = unidecode.unidecode(celda)
        else:
            celda = celda.replace(".", "").replace(",", ".")   
    
    return celda.lower().replace(" ", "_")

def transformar_unidades(df: pd.DataFrame):
    """
    Función creada para, luego de recibir un DataFrame, crear uno nuevo con precios y unidades de medida modificados en base a un kilo.
    """
    lista_de_dicts = []
    avisos = []
    for fila in df.itertuples():
        col_udm = fila.unidad_de_medida

        if isinstance(col_udm, str):
            # Evitar filas que no requieren de actualización
            if col_udm != 'kg':
                col_udm = col_udm.replace('cc', 'g')
                col_udm = col_udm.replace('litros', 'kg')

                # En el caso de que sea "litro" singular
                if col_udm == 'litro':
                    col_udm = col_udm.replace('litro', 'kg')
                    cantidad = 1

                division = col_udm.split("_")

                # No aplico la función a elementos que no sean ni gramos ni kilos, evitando malas operaciones en (por ejemplo) unidades
                if division[-1] not in ['kg', 'g']:
                    avisos.append({'Valor no actualizado': fila.variedad})
                    dict_variedad = {'variedad': fila.variedad, 'unidad_de_medida': col_udm, 'precio': fila.precio }
                    lista_de_dicts.append(dict_variedad)
                    continue

                # Uso cantidad de operadores lógicos luego del razonamiento de como afrontar el orden en este bloque de código y teniendo
                # en cuenta diversos aspectos del DataFrame que limitan el uso de aplicaciones mas simples con, por ejemplo, index().
                if len(division) > 2:
                    cantidad = float(division[1])
                elif len(division) == 2:
                    cantidad = float(division[0])
                else:
                    avisos.append({'Longitud de lista': fila.variedad})
                    continue
                
                if division[-1] == 'g':
                    # Reemplazo la variable "cantidad" en el caso de que se trate de gramos
                    cantidad = cantidad/1000 

                precio_kg = fila.precio / cantidad

                dict_variedad = {'variedad': fila.variedad, 'unidad_de_medida': 'kg', 'precio': precio_kg }
                lista_de_dicts.append(dict_variedad)

            else:
                dict_variedad = {'variedad': fila.variedad, 'unidad_de_medida': col_udm, 'precio': fila.precio }
                lista_de_dicts.append(dict_variedad)

                
    if avisos:
        print(avisos)
    return pd.DataFrame(lista_de_dicts)