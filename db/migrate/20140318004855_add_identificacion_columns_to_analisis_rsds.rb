class AddIdentificacionColumnsToAnalisisRsds < ActiveRecord::Migration
  def change
    add_column :analisis_rsds, :identificacion, :string
    
    execute " UPDATE analisis_rsds SET identificacion = TO_CHAR(fecha_ingreso, 'YYYY') || trim(TO_CHAR(id,'000000')) || 'RS';"    
  end
end
