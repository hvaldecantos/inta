class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nombre
      t.string :apellido
      t.string :telefono_fijo
      t.string :telefono_celular
      t.integer :user_id

      t.timestamps
    end
  end
end
