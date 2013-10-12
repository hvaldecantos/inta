class RemoveColumnsFromProfiles < ActiveRecord::Migration
  def up
    remove_column :profiles, :apellido
    remove_column :profiles, :nombre
  end

  def down
    add_column :profiles, :apellido, :string
    add_column :profiles, :nombre, :string
    execute " UPDATE profiles 
              SET apellido = personas.apellido, 
                  nombre = personas.nombre
              FROM personas
              WHERE personas.id = profiles.persona_id;"
  end
end
