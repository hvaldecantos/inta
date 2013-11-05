class CreateProductores < ActiveRecord::Migration
  def change
    create_table :productores do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.integer :departamento_id
      t.integer :comuna_municipio_id
      t.string :agencia
      t.string :email_extensionista

      t.timestamps
    end
  end
end
