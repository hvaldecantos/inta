class ChangeVariedadIdColumnInAnalisisPrezafras < ActiveRecord::Migration
  def up
    rename_column :analisis_prezafras, :variedad_id, :cania_variedad_id
  end

  def down
    rename_column :analisis_prezafras, :cania_variedad_id, :variedad_id
  end
end
