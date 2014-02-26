class FixLonlatColumnNameInAnalisisPrezafras < ActiveRecord::Migration
  def up
    rename_column :analisis_prezafras, :latlon, :lonlat
  end

  def down
    rename_column :analisis_prezafras, :lonlat, :latlon
  end
end
