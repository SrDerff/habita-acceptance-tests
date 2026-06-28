# Language: es
Caracteristica: Epica 02 - Gestion de Confianza y Seguridad
  Como usuario de la plataforma Habita
  Quiero que el sistema valide identidades y proteja mis datos
  Para interactuar y realizar transacciones en un entorno seguro y formal

  @US08 @ValidacionIdentidad
  Escenario: Registro exitoso con correo universitario valido
    Dado que el estudiante se encuentra en el formulario de registro de Habita
    Cuando ingresa sus datos y un correo electronico con dominio universitario valido
    Entonces el sistema envia un codigo de confirmacion a la bandeja de entrada
    Y al ingresar el codigo correctamente la cuenta se activa con el estado Verificado

  @US08 @ValidacionIdentidad @ManejoErrores
  Escenario: Intento de registro con correo comercial
    Dado que el estudiante se encuentra en el formulario de registro de Habita
    Cuando intenta registrarse ingresando un correo electronico comercial como gmail
    Entonces el sistema detecta que el dominio no es autorizado y bloquea el registro
    Y muestra una alerta indicando que debe usar su correo institucional

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
    Entonces el sistema detiene el flujo de contratacion y no emite el contrato
    Y muestra una alerta indicando que verifique los fondos o intente con otro metodo
