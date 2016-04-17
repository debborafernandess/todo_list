# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'Jane Doe', email: 'jane.doe@mail.com', password: '12346789')

List.create(name: 'Bills', user: user, private_visibility: true)
List.create(name: 'Bday agend', user: user)
