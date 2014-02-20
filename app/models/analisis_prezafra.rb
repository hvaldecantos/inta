class AnalisisPrezafra < ActiveRecord::Base
  attr_accessible :agente_id, :brix_pct, :estado, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :fecha_inicio, :identificacion, :laboratorista_id, :latlon, :lectura_polar, :observaciones, :parcela_id, :peso_muestra, :peso_tallo, :pol_pct_cania, :pol_pct_jugo, :productor_id, :promotor_id, :pureza_pct, :rto_pct, :variedad_id
end
