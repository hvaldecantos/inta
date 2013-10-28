class RecreateComunasMunicipiosDepartamentosLocalidadesParajesWithGeospatialData < ActiveRecord::Migration
  def sql_script file_name
    sql = ""
    source = File.new(file_name, "r")
    while (line = source.gets)
      sql << line
    end
    source.close
    sql
  end
  def up
    execute sql_script "./db/sql/20130827_comunasmunicipio_departamentos_localidades_parajes_drop.sql"
    execute sql_script "./db/sql/20131028_comunasmunicipio_departamentos_localidades_parajes_geospatial_create.sql"
  end

  def down
    remove_column :departamentos, :the_geom
    remove_column :comunas_municipios, :the_geom
    remove_column :localidades, :the_geom
    remove_column :parajes, :the_geom
  end
end
