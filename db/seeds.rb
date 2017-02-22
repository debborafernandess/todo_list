# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

password = '123456'

['Jane Doe', 'John Doe'].each do |name|
  User.create(name: name,
                  email: "#{name.downcase.gsub(/\s/, '.')}@mail.com",
                  password: password,
                  password_confirmation: password)
end

User.all.each do |user|
  List.create(name: 'Bills', user: user, private_visibility: true)
  List.create(name: 'Market list', user: user)
end

p "Data created"
