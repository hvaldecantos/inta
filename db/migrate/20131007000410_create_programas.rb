class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
