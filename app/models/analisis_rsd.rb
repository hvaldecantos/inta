class AnalisisRsd < ActiveRecord::Base
  attr_accessible :agente_id, :analizado, :anio_plantacion, :comuna_municipio_id, :departamento_id, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :incidencia, :laboratorista_id, :localidad_id, :membrana, :paraje_id, :parcela_id, :procedencia_id, :productor_id, :promotor_id, :variedad_id

  belongs_to :paraje
  belongs_to :departamento
  belongs_to :comuna_municipio
  belongs_to :localidad

  belongs_to :agente, class_name: "Profile"
  belongs_to :promotor, class_name: "Profile"
  belongs_to :laboratorista, class_name: "Profile"

end
