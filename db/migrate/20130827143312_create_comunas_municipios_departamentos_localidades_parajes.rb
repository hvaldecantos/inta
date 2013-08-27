class CreateComunasMunicipiosDepartamentosLocalidadesParajes < ActiveRecord::Migration
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
    execute sql_script "./db/sql/20130827_comunasmunicipio_departamentos_localidades_parajes_create.sql"
  end

  def down
    execute sql_script "./db/sql/20130827_comunasmunicipio_departamentos_localidades_parajes_drop.sql"    
  end
end
