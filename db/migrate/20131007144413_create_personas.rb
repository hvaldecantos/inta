class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :user_id
      t.string :nombre
      t.string :apellido
      t.string :dni

      t.timestamps
    end
  end
end
