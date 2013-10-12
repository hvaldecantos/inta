class MoveColumnsFromProfilesToPersonas < ActiveRecord::Migration
  def up
    add_column :personas, :telefono_fijo, :string
    add_column :personas, :telefono_celular, :string
    execute " UPDATE personas 
              SET telefono_fijo = profiles.telefono_fijo, 
                  telefono_celular = profiles.telefono_celular
              FROM profiles
              WHERE personas.id = profiles.persona_id;"
    remove_column :profiles, :telefono_fijo
    remove_column :profiles, :telefono_celular
  end

  def down
    add_column :profiles, :telefono_fijo, :string
    add_column :profiles, :telefono_celular, :string
    execute " UPDATE profiles 
              SET telefono_fijo = personas.telefono_fijo, 
                  telefono_celular = personas.telefono_celular
              FROM personas
              WHERE personas.id = profiles.persona_id;"
    remove_column :personas, :telefono_fijo
    remove_column :personas, :telefono_celular
  end
end
