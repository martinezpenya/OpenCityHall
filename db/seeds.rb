# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
OmicAge.create(id: '1', description: '18-30')
OmicAge.create(id: '2', description: '31-60')
OmicAge.create(id: '3', description: '31-100')

OmicMean.create(id: '1', description: 'CORREU ELECTRÒNIC')
OmicMean.create(id: '2', description: 'TELEFÒNICAMENT')
OmicMean.create(id: '3', description: 'PRESENCIALMENT')

OmicReason.create(id: '1', description: 'ALGÚN PROBLEMA CON EL BIEN ADQUIRIDO')
OmicReason.create(id: '2', description: 'PROBLEMAS EN LOS SERVICIOS PRESTADOS')
OmicReason.create(id: '3', description: 'PROBLEMAS VARIOS')
OmicReason.create(id: '4', description: 'GARANTIAS')

OmicResult.create(id: '1', name: 'EN TRAMITE')
OmicResult.create(id: '2', name: 'PENDIENTE DE MAYOR INFORMACIÓN')
OmicResult.create(id: '3', name: 'POSIBILIDAD VIA JUDICIAL')
OmicResult.create(id: '4', name: 'ARBITRAJE DE CONSUMO')
OmicResult.create(id: '5', name: 'ARCHIVAR')
OmicResult.create(id: '6', name: 'DESESTIMADA')
OmicResult.create(id: '7', name: 'INHIBIDA')
OmicResult.create(id: '8', name: 'POSITIVA')
OmicResult.create(id: '9', name: 'NEGATIVA')

OmicSector.create(id: '1', description: 'TELECOMUNICACIONES', response_time: 1)
OmicSector.create(id: '2', description: 'ENERGÉTICAS', response_time: 1)
OmicSector.create(id: '3', description: 'BANCOS', response_time: 2)

OmicService.create(id: '1', name: 'INFORMACIÓN', description: 'Se facilita información deseada al usuario')

OmicSituation.create(id: '1', name: 'Registro', description: 'Registro de Entrada')
OmicSituation.create(id: '2', name: 'Firma', description: 'Pendiente de firma del concejal delegado')
OmicSituation.create(id: '3', name: 'Avisado', description: 'Se ha avisado al reclamante para que recoja la documentación')
OmicSituation.create(id: '4', name: 'Enviada', description: 'Enviada la reclamación al Reclamado')
OmicSituation.create(id: '5', name: 'Entregada', description: 'Documentación entregada al Reclamante')

Common_id_type.create(id: '1', name: 'DNI')
Common_id_type.create(id: '2', name: 'NIE')
Common_id_type.create(id: '3', name: 'CIF')
