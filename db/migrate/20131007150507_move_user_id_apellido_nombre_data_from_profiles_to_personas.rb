class MoveUserIdApellidoNombreDataFromProfilesToPersonas < ActiveRecord::Migration
  def up
    execute " INSERT INTO personas(apellido, nombre, user_id, created_at, updated_at) 
              SELECT apellido, nombre, user_id, created_at, updated_at FROM profiles;"
  end

  def down
    execute " UPDATE profiles 
              SET apellido = personas.apellido, 
                  nombre = personas.nombre,
                  user_id = personas.user_id, 
                  created_at = personas.created_at,
                  updated_at = personas.updated_at
              FROM personas
              WHERE personas.user_id = profiles.user_id;"

    execute " DELETE FROM personas
              WHERE personas.user_id IN (SELECT user_id FROM profiles);"

    execute " INSERT INTO profiles(apellido, nombre, user_id, created_at, updated_at) 
              SELECT DISTINCT pe.apellido, pe.nombre, pe.user_id, pe.created_at, pe.updated_at
              FROM personas pe, profiles pr
              WHERE pe.user_id NOT IN (SELECT user_id FROM profiles);"
  end
end
