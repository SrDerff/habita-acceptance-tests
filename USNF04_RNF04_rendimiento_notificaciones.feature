# language: es
@USNF04 @RNF04
Caracteristica: Rendimiento de notificaciones en tiempo real
  Como sistema de la plataforma Habita
  Quiero enviar alertas de habitaciones disponibles dentro de un tiempo maximo permitido
  Para informar oportunamente a los estudiantes sobre alojamientos compatibles con sus preferencias

  # USNF04 / RNF04 - Rendimiento de notificaciones en tiempo real
  @USNF04 @RNF04 @positivo @happy_path
  Escenario: Enviar notificacion de habitacion disponible dentro del tiempo maximo permitido
    Dado que el estudiante tiene registrada una universidad y preferencias de busqueda de alojamiento
    Y un arrendador publica una habitacion disponible que coincide con la universidad, zona, presupuesto y servicios requeridos por el estudiante
    Cuando el sistema detecta la coincidencia entre la publicacion y las preferencias del estudiante
    Entonces debe enviar una notificacion al estudiante en un tiempo maximo de 2 minutos desde la publicacion
    Y la notificacion debe mostrar el nombre del alojamiento, distrito, precio, fecha de publicacion y acceso al detalle

  @USNF04 @RNF04 @positivo @happy_path
  Escenario: Mostrar alerta recomendada despues de una coincidencia valida
    Dado que el estudiante tiene activadas las alertas de alojamiento
    Y existe una publicacion compatible con al menos el 70 por ciento de sus preferencias registradas
    Cuando el estudiante ingresa a la seccion de alertas recomendadas
    Entonces el sistema debe mostrar la nueva alerta en un tiempo maximo de 3 segundos
    Y debe mostrar nombre del alojamiento, precio mensual, ubicacion, porcentaje de coincidencia y estado de disponibilidad
    Y debe permitir consultar el detalle, guardarlo como favorito o enviar una solicitud

  @USNF04 @RNF04 @negativo @edge_case
  Escenario: No enviar notificacion cuando el alojamiento no coincide con las preferencias
    Dado que el estudiante tiene preferencias de busqueda configuradas en la plataforma Habita
    Y un arrendador publica una habitacion que no coincide con la universidad, zona, presupuesto o servicios requeridos
    Cuando el sistema evalua la nueva publicacion
    Entonces no debe enviar una notificacion al estudiante
    Y el alojamiento no debe aparecer en la seccion de alertas recomendadas
    Y el sistema debe mantener activas las preferencias del estudiante para futuras coincidencias

  @USNF04 @RNF04 @negativo @edge_case
  Escenario: No generar alerta si las preferencias del estudiante estan incompletas
    Dado que el estudiante tiene activadas las alertas de alojamiento
    Y no ha completado campos obligatorios como universidad, presupuesto maximo, zona preferida o tipo de habitacion
    Cuando un arrendador publica una nueva habitacion disponible
    Entonces el sistema no debe calcular el porcentaje de coincidencia
    Y no debe enviar notificaciones incompletas o imprecisas
    Y debe mostrar el mensaje "Completa tus preferencias de alojamiento para recibir alertas personalizadas"
