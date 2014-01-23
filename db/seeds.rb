# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8
OmicSituation.create(id: '1', name: 'Registro', description: 'Registro de Entrada')
OmicSituation.create(id: '2', name: 'Firma', description: 'Pendiente de firma del concejal delegado')