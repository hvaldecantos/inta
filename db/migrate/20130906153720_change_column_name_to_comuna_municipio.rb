class ChangeColumnNameToComunaMunicipio < ActiveRecord::Migration
  def up
    rename_column :localidades, :comunas_municipio_id, :comuna_municipio_id
    rename_column :parajes, :comunas_municipio_id, :comuna_municipio_id
  end

  def down
    rename_column :localidades, :comuna_municipio_id, :comunas_municipio_id
    rename_column :parajes, :comuna_municipio_id, :comumnas_municipio_id
  end
end
