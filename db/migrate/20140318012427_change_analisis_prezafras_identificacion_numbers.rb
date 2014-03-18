class ChangeAnalisisPrezafrasIdentificacionNumbers < ActiveRecord::Migration
  def up
    execute " UPDATE analisis_prezafras " +
    "SET identificacion = TO_CHAR(fecha_inicio, 'YYYY') || trim(TO_CHAR(id,'000000')) || 'PZ';"    
  end

  def down
    execute " UPDATE analisis_prezafras " +
    "SET identificacion = TO_CHAR(fecha_inicio, 'YYYYMMDD') || TO_CHAR(id,'000000')||'PZ';"
  end
end
