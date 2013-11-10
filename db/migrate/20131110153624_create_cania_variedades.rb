class CreateCaniaVariedades < ActiveRecord::Migration
  def change
    create_table :cania_variedades do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
