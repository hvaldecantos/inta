# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Creating user Admin'
usuario = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts "User Admin created (user email: #{usuario.email})."

puts 'Creating role Admin'
rol = Role.find_or_create_by_name :name => ENV['ADMIN_ROLE'].dup, :description => ENV['ADMIN_ROLE_DESCRIPTION'].dup
puts "Role Admin created (role name: #{rol.name})."

puts 'Assigning admin role to user Admin'
usuario.roles << rol
puts "Admin role assigned to user Admin."
