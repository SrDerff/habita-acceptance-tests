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

@US11 @ReportesSeguridad
Escenario: Envio exitoso de un reporte con evidencias y descripcion
  Dado que el estudiante ha detectado una publicacion o perfil sospechoso en la plataforma
  Cuando ingresa al modulo de denuncias, adjunta las evidencias visuales y añade una descripcion detallada
  Entonces el sistema procesa la informacion de manera segura
  Y almacena el reporte en el panel de administracion para la revision del equipo de soporte

@US11 @ReportesSeguridad @ManejoErrores
Escenario: Rechazo de reporte por falta de informacion obligatoria
  Dado que el estudiante intenta enviar una denuncia sobre un alojamiento
  Cuando deja el campo de descripcion vacio y no selecciona ningun motivo de seguridad
  Entonces el sistema bloquea el envio del formulario
  Y muestra un mensaje de advertencia solicitando completar los campos obligatorios

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

@US13 @GestionContratos
Escenario: Visualizacion y descarga exitosa del comprobante de pago y contrato digital
  Dado que el estudiante ha firmado el contrato y completado el pago de manera exitosa
  Cuando accede a su bandeja de documentos y selecciona la opcion Descargar Comprobante
  Entonces el sistema genera un archivo digital valido con los detalles de la transaccion
  Y permite al usuario guardarlo en su dispositivo de manera local

@US13 @GestionContratos @ManejoErrores
Escenario: Intento de acceso a comprobantes de pago no procesados o fallidos
  Dado que la transaccion del estudiante se encuentra en estado fallido o pendiente de aprobacion
  Cuando intenta ingresar a la seccion de descarga de recibos digitales
  Entonces el sistema deshabilita el boton de descarga
  Y muestra una alerta indicando que el documento no estara disponible hasta que se confirme el pago
