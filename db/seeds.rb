# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Create User Admin'
usuario = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'User: ' << usuario.name
rol = Role.find_or_create_by_name :name => ENV['ADMIN_ROLE'].dup, :description => ENV['ADMIN_ROLE_DESCRIPTION'].dup
puts 'Role: ' << rol.name
assignment = Assignment.create(:user_id => usuario.id, :role_id => rol.id)
puts "Assignment: [#{assignment.user_id}, #{assignment.role_id}]"
