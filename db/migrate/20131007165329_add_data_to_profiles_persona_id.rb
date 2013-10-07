class AddDataToProfilesPersonaId < ActiveRecord::Migration
  def up
    # Si se agregaron más registros en profile los agrego en persona
    execute " INSERT INTO personas(apellido, nombre, user_id, created_at, updated_at) 
              SELECT DISTINCT pr.apellido, pr.nombre, pr.user_id, pr.created_at, pr.updated_at 
              FROM profiles pr WHERE pr.user_id NOT IN (SELECT user_id FROM personas);"

    # Si se modificaron registros en profile los actualizo en persona
    execute " UPDATE personas 
              SET apellido = profiles.apellido, 
                  nombre = profiles.nombre,
                  user_id = profiles.user_id, 
                  created_at = profiles.created_at,
                  updated_at = profiles.updated_at
              FROM profiles
              WHERE personas.user_id = profiles.user_id;"

    # Finalmente copio los id de personas en persona_id de profiles
    execute " UPDATE profiles SET persona_id = personas.id
              FROM personas WHERE personas.user_id = profiles.user_id;"
  end
end
