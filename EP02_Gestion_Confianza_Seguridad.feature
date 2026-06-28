# Language: es
Caracteristica: Epica 02 - Gestion de Confianza y Seguridad
  Como usuario de la plataforma Habita
  Quiero que el sistema valide identidades, formalice acuerdos y permita reportes
  Para interactuar y realizar transacciones en un entorno seguro, transparente y formal

  @US08 @ValidacionEstudiante
  Escenario: Registro exitoso con correo universitario valido
    Dado que el estudiante se encuentra en el formulario de registro de Habita
    Cuando ingresa sus datos y un correo electronico con dominio universitario valido
    Entonces el sistema envia un codigo de confirmacion a la bandeja de entrada
    Y al ingresar el codigo correctamente la cuenta se activa con el estado Verificado

  @US08 @ValidacionEstudiante @ManejoErrores
  Escenario: Intento de registro con correo comercial
    Dado que el estudiante se encuentra en el formulario de registro de Habita
    Cuando intenta registrarse ingresando un correo electronico comercial como gmail
    Entonces el sistema detecta que el dominio no es autorizado y bloquea el registro
    Y muestra una alerta indicando que debe usar su correo institucional

  @US09 @ValidacionArrendador
  Escenario: Verificacion exitosa de identidad del arrendador mediante KYC
    Dado que el arrendador se encuentra en el modulo de validacion de identidad
    Cuando sube una fotografia legible de su DNI por ambos lados y el titulo de propiedad
    Entonces el sistema procesa los documentos mediante el servicio de verificacion
    Y cambia el estado del perfil del arrendador a Propietario Verificado en la plataforma

  @US09 @ValidacionArrendador @ManejoErrores
  Escenario: Rechazo de verificacion por documentos ilegibles o invalidos
    Dado que el arrendador intenta subir sus documentos de identidad
    Cuando los archivos cargados estan borrosos o no corresponden a un DNI valido
    Entonces el sistema detiene el proceso de validacion de credenciales
    Y muestra una alerta indicando que los documentos no son legibles y solicita reintentar

  @US10 @ChatInterno
  Escenario: Envio e intercambio de mensajes entre usuarios verificados
    Dado que el estudiante tiene un perfil Verificado y esta en el detalle de un alojamiento
    Cuando selecciona la opcion Contactar Arrendador e ingresa un mensaje de texto
    Entonces el sistema procesa y envia el mensaje de forma instantanea
    Y el arrendador recibe una notificacion en tiempo real en su bandeja de entrada

  @US10 @ChatInterno @ManejoErrores
  Escenario: Restriccion de chat para usuarios no verificados
    Dado que el estudiante no ha completado la validacion de su correo institucional
    Cuando intenta acceder al chat interno para enviar un mensaje
    Entonces el sistema restringe el acceso a la funcionalidad de mensajeria
    Y muestra un mensaje indicando que debe verificar su identidad antes de conversar

  @US12 @ContratosYPagos
  Escenario: Firma de contrato y procesamiento de pago exitoso
    Dado que el estudiante se encuentra en la pasarela de pagos revisando el contrato digital
    Cuando aplica su firma electronica e ingresa una tarjeta con fondos suficientes
    Entonces el sistema procesa la transaccion financiera de manera segura
    Y cambia el estado del contrato a Firmado y Activo generando los comprobantes

  @US12 @ContratosYPagos @ManejoErrores
  Escenario: Pago rechazado por fondos insuficientes
    Dado que el estudiante ha aplicado su firma en el contrato digital de alquiler
    Cuando el banco emisor rechaza la transaccion por fondos insuficientes
    Entonces el sistema detiene el flujo de estas contrataciones y no emite el contrato
    Y muestra una alerta indicando que verifique los fondos o intente con otro metodo

  @US15 @ReportesSeguridad
  Escenario: Reporte exitoso de un anuncio o perfil sospechoso
    Dado que el estudiante identifica irregularidades en una publicacion de alojamiento
    Cuando selecciona la opcion Reportar Anuncio, elige un motivo valido y envia el detalle
    Entonces el sistema registra la denuncia en el panel de administracion
    Y muestra una confirmacion informando que el equipo de soporte revisara el caso

  @US15 @ReportesSeguridad @ManejoErrores
  Escenario: Intento de envio de reporte con campos vacios
    Dado que el estudiante se encuentra en el formulario de reporte de seguridad
    Cuando presiona el boton Enviar Reporte sin seleccionar un motivo ni escribir una descripcion
    Entonces el sistema bloquea la solicitud y resalta los campos obligatorios
    Y muestra un mensaje indicando que debe especificar los motivos del reporte

  @US18 @Calificaciones
  Escenario: Publicacion exitosa de resenia y calificacion al arrendador
    Dado que el estudiante ha finalizado su periodo de contrato registrado en la plataforma
    Cuando ingresa al perfil del arrendador, selecciona el puntaje de estrellas y redacta su comentario
    Entonces el sistema publica la resenia y actualiza el promedio de calificacion del arrendador
    Y el comentario se vuelve visible para futuros estudiantes en el feed de busqueda

  @US18 @Calificaciones @ManejoErrores
  Escenario: Restriccion de calificacion sin contrato previo finalizado
    Dado que un estudiante navega por la plataforma pero no ha alquilado con ese arrendador
    Cuando intenta registrar una calificacion o comentario en el perfil del propietario
    Entonces el sistema inhabilita el formulario de ingreso de resenias
    Y muestra una restriccion indicando que solo los inquilinos confirmados pueden calificar
