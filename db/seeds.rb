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
unless usuario.roles.include? rol then usuario.roles << rol end
puts "Admin role assigned to user Admin."

puts 'Copying data with Geospatial info to Comunas_Municipios, Departamentos, Localidades and Parajes tables'
conf = Rails.configuration.database_configuration[Rails.env]
t=Thread.new do
  system("psql -U #{conf['username']} -W -h localhost #{conf['database']} < ./db/sql/20131028_comunasmunicipio_departamentos_localidades_parajes_geospatial_data.sql")
end
t.join
puts '.... Done'

# agencias
puts 'Copying data with Geospatial info to Agencias table'
conf = Rails.configuration.database_configuration[Rails.env]
t=Thread.new do
  system("psql -U #{conf['username']} -W -h localhost #{conf['database']} < ./db/sql/20140102_agencias_geospatial_data.sql")
end
t.join
puts '.... Done'
