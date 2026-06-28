# language: es
@USNF01 @RNF01
Caracteristica: Seguridad legal de contratos digitales
  Como sistema de la plataforma Habita
  Quiero garantizar que los contratos digitales cuenten con informacion obligatoria y aceptacion de ambas partes
  Para brindar respaldo legal a estudiantes y arrendadores en caso de consultas, reclamos o disputas

  # USNF01 / RNF01 - Seguridad Legal (Compliance)
  @USNF01 @RNF01 @positivo @happy_path
  Escenario: Generar contrato digital con informacion obligatoria y aceptacion de ambas partes
    Dado que el estudiante y el arrendador se encuentran autenticados en la plataforma Habita
    Y ambos han aceptado las condiciones del alquiler
    Y el contrato contiene datos del estudiante, arrendador, alojamiento, monto, fechas, reglas y condiciones acordadas
    Cuando el sistema genera el contrato digital
    Entonces el contrato debe generarse con toda la informacion obligatoria
    Y debe registrar la fecha, hora y usuario responsable de cada aceptacion
    Y debe quedar disponible para consulta autorizada en un tiempo maximo de 10 segundos

  @USNF01 @RNF01 @positivo @happy_path
  Escenario: Conservar evidencia legal del contrato firmado
    Dado que existe un contrato digital aceptado por el estudiante y el arrendador
    Y el documento ha sido firmado dentro de la plataforma Habita
    Cuando el sistema almacena el contrato final
    Entonces debe conservar una copia del contrato firmado asociada al alojamiento y a las partes involucradas
    Y debe permitir su descarga por estudiantes y arrendadores autorizados
    Y debe mantener el documento sin alteraciones posteriores a la firma final

  @USNF01 @RNF01 @negativo @edge_case
  Escenario: Bloquear generacion de contrato por falta de aceptacion de una de las partes
    Dado que el contrato digital tiene informacion pendiente de aceptacion por parte del estudiante o del arrendador
    Y una de las partes aun no confirma las condiciones del alquiler
    Cuando el sistema intenta finalizar el contrato digital
    Entonces no debe generar el contrato final
    Y debe mostrar el mensaje "No se puede generar el contrato porque falta la aceptacion de ambas partes"
    Y debe permitir que la parte pendiente revise y acepte las condiciones del alquiler

  @USNF01 @RNF01 @negativo @edge_case
  Escenario: Bloquear modificacion de contrato despues de la firma final
    Dado que existe un contrato digital firmado por el estudiante y el arrendador
    Y un usuario intenta modificar monto, fechas, datos del alojamiento o condiciones acordadas
    Cuando solicita guardar los cambios sobre el contrato final
    Entonces el sistema debe rechazar la modificacion del documento firmado
    Y debe mostrar el mensaje "El contrato firmado no puede ser modificado"
    Y debe conservar la version final firmada sin cambios
