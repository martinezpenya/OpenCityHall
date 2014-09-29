# Inicialización en español para la extensión 'UI date picker' para jQuery. 

# Traducido por Vester (xvester@gmail.com). 
((factory) ->
  if typeof define is "function" and define.amd
    
    # AMD. Register as an anonymous module.
    define ["../datepicker"], factory
  else
    
    # Browser globals
    factory jQuery.datepicker
  return
) (datepicker) ->
  datepicker.regional["es"] =
    closeText: "Cerrar"
    prevText: "&#x3C;Ant"
    nextText: "Sig&#x3E;"
    currentText: "Hoy"
    monthNames: [
      "enero"
      "febrero"
      "marzo"
      "abril"
      "mayo"
      "junio"
      "julio"
      "agosto"
      "septiembre"
      "octubre"
      "noviembre"
      "diciembre"
    ]
    monthNamesShort: [
      "ene"
      "feb"
      "mar"
      "abr"
      "may"
      "jun"
      "jul"
      "ago"
      "sep"
      "oct"
      "nov"
      "dic"
    ]
    dayNames: [
      "domingo"
      "lunes"
      "martes"
      "miércoles"
      "jueves"
      "viernes"
      "sábado"
    ]
    dayNamesShort: [
      "dom"
      "lun"
      "mar"
      "mié"
      "jue"
      "vie"
      "sáb"
    ]
    dayNamesMin: [
      "D"
      "L"
      "M"
      "X"
      "J"
      "V"
      "S"
    ]
    weekHeader: "Sm"
    dateFormat: "dd/mm/yyyy"
    firstDay: 1
    isRTL: false
    showMonthAfterYear: false
    yearSuffix: ""

  datepicker.setDefaults datepicker.regional["es"]
  datepicker.regional["es"]
