class CreateAgencia < ActiveRecord::Migration
  def change
    create_table :agencias do |t|
      t.integer :codigo
      t.string :nombre
      t.string :domicilio
      t.string :telefono_fijo
      t.text :telefono_celular
      t.string :email
      t.geometry :the_geom
      t.integer :comuna_municipio_id
      t.timestamps
    end
  end
end
