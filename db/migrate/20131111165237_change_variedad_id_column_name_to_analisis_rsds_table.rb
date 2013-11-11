class ChangeVariedadIdColumnNameToAnalisisRsdsTable < ActiveRecord::Migration
  def up
    rename_column :analisis_rsds, :variedad_id, :cania_variedad_id
  end

  def down
    rename_column :analisis_rsds, :cania_variedad_id, :variedad_id
  end
end
