class RecreateAgencias < ActiveRecord::Migration
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
    execute sql_script "./db/sql/20140102_agencias_drop.sql"
    execute sql_script "./db/sql/20140102_agencias_geospatial_create.sql"
  end
  
end
