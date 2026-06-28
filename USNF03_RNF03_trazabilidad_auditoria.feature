# language: es
@USNF03 @RNF03
Caracteristica: Trazabilidad y auditoria de operaciones
  Como arrendador o administrador de la plataforma Habita
  Quiero contar con un registro historico de pagos, retrasos, aceptaciones de contratos y acciones criticas
  Para disponer de evidencia verificable en caso de consultas, reclamos, auditorias o disputas

  # USNF03 / RNF03 - Trazabilidad (Auditoria)
  @USNF03 @RNF03 @positivo @happy_path
  Escenario: Registrar correctamente una operacion critica del alquiler
    Dado que el estudiante o arrendador se encuentra autenticado en la plataforma Habita
    Y realiza una operacion critica como pago de alquiler, registro de retraso, aceptacion de contrato o confirmacion de una condicion del alquiler
    Cuando la operacion es confirmada por el sistema
    Entonces el sistema debe registrar fecha, hora, usuario responsable, tipo de operacion, alojamiento asociado, monto cuando corresponda y estado de la accion
    Y el registro debe generarse en un tiempo maximo de 5 segundos despues de confirmada la operacion
    Y el registro debe quedar disponible para consulta por parte del arrendador o administrador autorizado

  @USNF03 @RNF03 @positivo @happy_path
  Escenario: Consultar historial de operaciones con filtros validos
    Dado que el arrendador se encuentra autenticado en la plataforma Habita
    Y cuenta con alojamientos que tienen pagos, retrasos o contratos registrados
    Cuando consulta el historial aplicando filtros por rango de fechas, alojamiento, estudiante o tipo de operacion
    Entonces el sistema debe mostrar unicamente los registros que coinciden con los filtros seleccionados
    Y cada registro debe mostrar fecha, hora, usuario responsable, tipo de operacion, estado y alojamiento asociado
    Y los resultados deben mostrarse en un tiempo maximo de 3 segundos
    Y si existen mas de 20 registros, el sistema debe distribuirlos en paginas de hasta 20 registros

  @USNF03 @RNF03 @positivo @happy_path
  Escenario: Descargar historial de auditoria autorizado
    Dado que el arrendador o administrador se encuentra autenticado en la plataforma Habita
    Y cuenta con permisos para consultar el historial de operaciones
    Cuando solicita descargar el historial filtrado por un rango de fechas valido
    Entonces el sistema debe generar un archivo con los registros correspondientes al rango seleccionado
    Y el archivo debe incluir fecha, hora, tipo de operacion, usuario responsable, alojamiento asociado, monto cuando corresponda y estado
    Y la descarga debe generarse en un tiempo maximo de 10 segundos para un historial de hasta 500 registros

  @USNF03 @RNF03 @negativo @edge_case
  Escenario: Bloquear consulta no autorizada al historial de auditoria
    Dado que un usuario autenticado intenta acceder al historial de pagos, retrasos o contratos de un alojamiento que no le corresponde
    Y no cuenta con permisos para consultar dicha informacion
    Cuando solicita visualizar o descargar el registro historico
    Entonces el sistema debe bloquear el acceso al historial de auditoria
    Y debe mostrar el mensaje "Acceso no autorizado al registro de auditoria"
    Y no debe mostrar informacion privada de estudiantes, arrendadores ni operaciones asociadas a otros alojamientos

  @USNF03 @RNF03 @negativo @edge_case
  Escenario: Evitar modificacion manual de un registro de auditoria
    Dado que existe un registro historico generado por una operacion critica
    Y un usuario intenta modificar manualmente la fecha, monto, estado o usuario responsable del registro
    Cuando solicita guardar la modificacion del registro de auditoria
    Entonces el sistema debe rechazar la modificacion directa
    Y debe mostrar el mensaje "Los registros de auditoria no pueden ser modificados manualmente"
    Y debe conservar el registro original sin cambios
