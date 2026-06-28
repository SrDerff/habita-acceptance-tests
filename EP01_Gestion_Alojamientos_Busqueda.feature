# language: es
@EP01
Caracteristica: Gestion de alojamientos y busqueda
  Como estudiante universitario
  Quiero buscar, consultar y gestionar alojamientos segun criterios especificos
  Para encontrar una opcion que se adecue a mi presupuesto, ubicacion institucional y necesidades personales

  # US01 - Recomendacion de alojamientos
  @US01 @positivo @happy_path
  Escenario: Buscar alojamientos recomendados de forma exitosa
    Dado que el estudiante se encuentra autenticado y tiene la "UPC" registrada como universidad activa en su perfil
    Y existen alojamientos disponibles a menos de 5 km de los campus de la UPC
    Cuando solicita las recomendaciones de alojamiento
    Entonces el sistema debe mostrar como maximo 10 alojamientos ordenados de menor a mayor distancia
    Y cada alojamiento debe mostrar nombre, fotografia principal, precio mensual, direccion, distancia en kilometros con un decimal y calificacion promedio del arrendador

  @US01 @negativo @edge_case
  Escenario: No existen alojamientos recomendados cerca de la universidad
    Dado que el estudiante se encuentra autenticado y tiene la "UPC" registrada como universidad activa en su perfil
    Y no existen alojamientos disponibles a menos de 5 km de los campus de la UPC
    Cuando solicita las recomendaciones de alojamiento
    Entonces el sistema no debe mostrar alojamientos fuera del radio establecido
    Y debe mostrar el mensaje "No se encontraron alojamientos recomendados por el momento"
    Y debe permitir modificar los filtros o buscar alojamientos en otras zonas

  # US02 - Distancia a la universidad
  @US02 @positivo @happy_path
  Escenario: Calcular correctamente la distancia y el tiempo de traslado
    Dado que el estudiante tiene una universidad registrada con ubicacion geografica valida
    Y el alojamiento posee una direccion completa y coordenadas geograficas validas
    Cuando solicita la informacion de distancia y traslado
    Entonces el sistema debe mostrar la distancia en kilometros con una precision de un decimal
    Y debe mostrar el tiempo estimado en minutos para desplazamiento a pie y mediante transporte publico

  @US02 @negativo @edge_case
  Escenario: No se puede calcular la distancia por ubicacion incompleta
    Dado que el estudiante tiene una universidad registrada
    Y el alojamiento no posee una direccion completa o coordenadas geograficas validas
    Cuando solicita la informacion de distancia y traslado
    Entonces el sistema no debe calcular ni mostrar valores aproximados
    Y debe mostrar el mensaje "No es posible calcular la distancia debido a informacion de ubicacion incompleta"
    Y debe permitir consultar otros alojamientos que posean informacion geografica valida

  # US03 - Filtrado de alojamientos
  @US03 @positivo @happy_path
  Escenario: Filtrar alojamientos segun criterios validos
    Dado que existen alojamientos disponibles en la plataforma
    Y el estudiante establece un rango de precio valido, una ubicacion, un tipo de habitacion y uno o mas servicios
    Cuando ejecuta la busqueda con los filtros seleccionados
    Entonces el sistema debe mostrar unicamente los alojamientos que cumplen todos los criterios
    Y cada resultado debe mostrar precio mensual, ubicacion, tipo de habitacion y servicios coincidentes
    Y los resultados deben mostrarse en un tiempo maximo de 3 segundos

  @US03 @negativo @edge_case
  Escenario: Intento de busqueda sin resultados por criterios restrictivos
    Dado que el estudiante se encuentra autenticado y existen alojamientos publicados
    Cuando aplica un filtro de precio maximo de "100 soles" y el servicio "Piscina"
    Entonces el sistema no debe colapsar ni mostrar un error de servidor
    Y debe mostrar el mensaje "No se encontraron alojamientos con los filtros seleccionados. Intenta ampliar tus criterios de busqueda."
    Y debe permitir modificar o eliminar los filtros aplicados

  # US04 - Informacion detallada
  @US04 @positivo @happy_path
  Escenario: Consultar la informacion completa de un alojamiento publicado
    Dado que existe un alojamiento disponible con toda la informacion obligatoria registrada
    Cuando el estudiante solicita consultar sus detalles
    Entonces el sistema debe mostrar nombre, direccion, precio mensual, tipo de habitacion, capacidad maxima y descripcion general
    Y debe mostrar los datos publicos y el estado de verificacion del arrendador
    Y debe presentar al menos 3 fotografias, los servicios ofrecidos y las reglas de convivencia registradas

  @US04 @negativo @edge_case
  Escenario: Consultar un alojamiento suspendido o retirado
    Dado que el alojamiento fue suspendido por la plataforma o retirado por el arrendador
    Cuando el estudiante intenta consultarlo mediante un enlace guardado o desde su lista de favoritos
    Entonces el sistema no debe mostrarlo como disponible
    Y debe bloquear el envio de nuevas solicitudes
    Y debe mostrar el mensaje "Este alojamiento ya no se encuentra disponible"
    Y debe permitir regresar a los resultados o consultar alojamientos similares

  # US05 - Alertas de alojamientos
  @US05 @positivo @happy_path
  Escenario: Recibir una alerta por coincidencia con las preferencias
    Dado que el estudiante tiene activadas las alertas
    Y ha registrado precio maximo, ubicacion, tipo de habitacion y servicios requeridos
    Cuando se publica un alojamiento con una coincidencia igual o superior al 70 por ciento
    Entonces el sistema debe generar una notificacion en un tiempo maximo de 1 minuto
    Y la notificacion debe mostrar nombre del alojamiento, precio mensual, ubicacion y fecha de publicacion
    Y debe permitir consultar el anuncio, guardarlo como favorito o enviar una solicitud

  @US05 @negativo @edge_case
  Escenario: No se generan alertas por preferencias incompletas
    Dado que el estudiante no ha registrado uno o mas campos obligatorios de sus preferencias
    Cuando se publica un nuevo alojamiento
    Entonces el sistema no debe calcular el porcentaje de coincidencia ni generar una alerta
    Y debe mostrar el mensaje "Completa tus preferencias de alojamiento para recibir alertas personalizadas"
    Y debe permitir completar los campos faltantes

  # US06 - Lista de favoritos
  @US06 @positivo @happy_path
  Escenario: Guardar un alojamiento en la lista de favoritos
    Dado que el estudiante se encuentra autenticado
    Y consulta un alojamiento disponible que no esta registrado en sus favoritos
    Cuando solicita guardar el alojamiento
    Entonces el sistema debe asociarlo con la cuenta del estudiante
    Y debe mostrar el mensaje "El alojamiento fue agregado correctamente a tu lista de favoritos"
    Y debe mostrar nombre, fotografia principal, precio mensual, ubicacion y fecha de registro

  @US06 @negativo @edge_case
  Escenario: Intentar guardar un alojamiento duplicado
    Dado que el alojamiento ya se encuentra registrado en la lista de favoritos
    Cuando el estudiante intenta guardarlo nuevamente
    Entonces el sistema no debe crear un segundo registro
    Y debe mostrar el mensaje "Este alojamiento ya se encuentra en tu lista de favoritos"
    Y debe permitir consultar el alojamiento guardado o regresar a la busqueda

  # US07 - Historial de solicitudes
  @US07 @positivo @happy_path
  Escenario: Consultar el historial de solicitudes registradas
    Dado que el estudiante se encuentra autenticado
    Y ha enviado una o mas solicitudes de alojamiento
    Cuando solicita consultar su historial
    Entonces el sistema debe mostrar las solicitudes ordenadas desde la mas reciente hasta la mas antigua
    Y cada solicitud debe mostrar nombre del alojamiento, nombre del arrendador, fecha y hora de envio y estado actual
    Y si existen mas de 20 solicitudes, debe distribuir los resultados en paginas de hasta 20 registros

  @US07 @negativo @edge_case
  Escenario: Consultar el historial sin solicitudes registradas
    Dado que el estudiante se encuentra autenticado
    Y no ha enviado solicitudes de alojamiento
    Cuando solicita consultar su historial
    Entonces el sistema no debe mostrar registros inexistentes
    Y debe mostrar el mensaje "Aun no tienes solicitudes de alojamiento registradas"
    Y debe permitir explorar alojamientos disponibles para iniciar una nueva solicitud
