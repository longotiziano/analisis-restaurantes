from sql.database import Base 

# Modelado automático de las tablas creadas en PostgreSQL
IndecInfo = Base.classes.indec_info
Restaurantes = Base.classes.restaurantes
CatMateriasPrimas = Base.classes.cat_materia_prima
CategoriasProductos = Base.classes.categorias_productos
Especialidades = Base.classes.especialidades
MateriaPrima = Base.classes.materia_prima
ProductosDeEspecialidades = Base.classes.productos_de_especialidades
Ventas = Base.classes.ventas