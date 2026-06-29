# language: es
@USNF02 @RNF02
Caracteristica: Seguridad financiera y cifrado de datos de pago
  Como sistema de la plataforma Habita
  Quiero proteger la informacion financiera durante los pagos digitales
  Para evitar la exposicion de datos sensibles del estudiante y mantener operaciones seguras

  # USNF02 / RNF02 - Seguridad Financiera (Cifrado)
  @USNF02 @RNF02 @positivo @happy_path
  Escenario: Procesar pago de alquiler mediante canal seguro
    Dado que el estudiante se encuentra autenticado en la plataforma Habita
    Y tiene un contrato digital pendiente de pago
    Y registra un metodo de pago valido
    Cuando confirma la operacion de pago del alquiler
    Entonces el sistema debe procesar la informacion financiera mediante un canal seguro y cifrado
    Y debe generar un comprobante de pago con fecha, monto, alojamiento asociado, estado de operacion y metodo de pago parcial
    Y debe mostrar el resultado de la operacion en un tiempo maximo de 10 segundos despues de recibir respuesta de la pasarela

  @USNF02 @RNF02 @positivo @happy_path
  Escenario: Mostrar comprobante sin exponer datos financieros sensibles
    Dado que el estudiante realizo un pago exitoso dentro de la plataforma Habita
    Y el sistema genero el comprobante correspondiente
    Cuando el estudiante o arrendador autorizado consulta el comprobante de pago
    Entonces el sistema debe mostrar monto, fecha, alojamiento, estado y codigo de operacion
    Y no debe mostrar el numero completo de tarjeta, codigo CVV ni credenciales del metodo de pago
    Y solo debe visualizar como maximo los ultimos 4 digitos del metodo de pago cuando corresponda

  @USNF02 @RNF02 @negativo @edge_case
  Escenario: Evitar almacenamiento de informacion financiera sensible
    Dado que el estudiante realiza una operacion de pago dentro de la plataforma Habita
    Y la operacion finaliza correctamente o es rechazada por la pasarela de pagos
    Cuando el sistema registra el resultado de la transaccion
    Entonces no debe almacenar el numero completo de tarjeta ni el codigo CVV
    Y solo debe conservar la informacion minima necesaria para identificar la operacion de forma segura
    Y debe mostrar un mensaje de confirmacion o rechazo sin exponer datos sensibles

  @USNF02 @RNF02 @negativo @edge_case
  Escenario: Bloquear consulta no autorizada de comprobantes de pago
    Dado que un usuario autenticado intenta consultar el comprobante de pago de un contrato que no le corresponde
    Y no participa como estudiante, arrendador o administrador autorizado de la operacion
    Cuando solicita visualizar o descargar el comprobante
    Entonces el sistema debe bloquear el acceso al comprobante
    Y debe mostrar el mensaje "No tiene permisos para consultar este comprobante de pago"
    Y no debe mostrar monto, metodo de pago, datos del estudiante ni informacion del contrato
