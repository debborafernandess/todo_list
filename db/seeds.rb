# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
first_user  = User.create(name: 'Jane Doe', email: 'jane.doe@mail.com', password: '123456')
second_user = User.create(name: 'John Doe', email: 'john.doe@mail.com', password: '123456')

List.create(name: 'Bills',      user: first_user, private_visibility: true)
List.create(name: 'Bday agend', user: first_user)
List.create(name: 'Bills',      user: second_user, private_visibility: true)
List.create(name: 'Bday agend', user: second_user)

p "Created #{User.count} users with #{List.count} each."
