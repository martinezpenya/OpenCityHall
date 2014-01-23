# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
OmicAges.create(id: '1', description: '18-30')
OmicAges.create(id: '2', description: '31-60')
OmicAges.create(id: '3', description: '31-100')

OmicMeans.create(id: '1', description: 'CORREU ELECTRÒNIC')
OmicMeans.create(id: '2', description: 'TELEFÒNICAMENT')
OmicMeans.create(id: '3', description: 'PRESENCIALMENT')

OmicReasons.create(id: '1', description: 'ALGÚN PROBLEMA CON EL BIEN ADQUIRIDO')
OmicReasons.create(id: '2', description: 'PROBLEMAS EN LOS SERVICIOS PRESTADOS')
OmicReasons.create(id: '3', description: 'PROBLEMAS VARIOS')
OmicReasons.create(id: '4', description: 'GARANTIAS')

OmicResults.create(id: '1', name: 'EN TRAMITE')
OmicResults.create(id: '2', name: 'PENDIENTE DE MAYOR INFORMACIÓN')
OmicResults.create(id: '3', name: 'POSIBILIDAD VIA JUDICIAL')
OmicResults.create(id: '4', name: 'ARBITRAJE DE CONSUMO')
OmicResults.create(id: '5', name: 'ARCHIVAR')
OmicResults.create(id: '6', name: 'DESESTIMADA')
OmicResults.create(id: '7', name: 'INHIBIDA')
OmicResults.create(id: '8', name: 'POSITIVA')
OmicResults.create(id: '9', name: 'NEGATIVA')

OmicSectors.create(id: '1', description: 'TELECOMUNICACIONES', response_time: 1)
OmicSectors.create(id: '2', description: 'ENERGÉTICAS', response_time: 1)
OmicSectors.create(id: '3', description: 'BANCOS', response_time: 2)

OmicServices.create(id: '1', name: 'INFORMACIÓN', description: 'Se facilita información deseada al usuario')

OmicSituation.create(id: '1', name: 'Registro', description: 'Registro de Entrada')
OmicSituation.create(id: '2', name: 'Firma', description: 'Pendiente de firma del concejal delegado')
OmicSituation.create(id: '3', name: 'Avisado', description: 'Se ha avisado al reclamante para que recoja la documentación')
OmicSituation.create(id: '4', name: 'Enviada', description: 'Enviada la reclamación al Reclamado')
OmicSituation.create(id: '5', name: 'Entregada', description: 'Documentación entregada al Reclamante')

Common_id_types.create(id: '1', name: 'DNI')
Common_id_types.create(id: '2', name: 'NIE')
Common_id_types.create(id: '3', name: 'CIF')
