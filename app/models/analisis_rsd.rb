# == Schema Information
#
# Table name: analisis_rsds
#
#  id                  :integer          not null, primary key
#  fecha_extraccion    :date
#  fecha_ingreso       :date
#  fecha_analisis      :date
#  variedad_id         :integer
#  membrana            :string(255)
#  anio_plantacion     :date
#  parcela_id          :integer
#  paraje_id           :integer
#  departamento_id     :integer
#  comuna_municipio_id :integer
#  localidad_id        :integer
#  productor_id        :integer
#  procedencia_id      :integer
#  agente_id           :integer
#  promotor_id         :integer
#  laboratorista_id    :integer
#  incidencia          :float
#  analizado           :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class AnalisisRsd < ActiveRecord::Base
  attr_accessible :agente_id, :analizado, :anio_plantacion, :comuna_municipio_id, :departamento_id, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :incidencia, :laboratorista_id, :localidad_id, :membrana, :paraje_id, :parcela_id, :procedencia_id, :productor_id, :promotor_id, :variedad_id

  validates_presence_of :comuna_municipio_id, :departamento_id, :paraje_id, :localidad_id, :agente_id, :promotor_id, :laboratorista_id
  
  belongs_to :paraje
  belongs_to :departamento
  belongs_to :comuna_municipio
  belongs_to :localidad

  belongs_to :agente, class_name: "Persona"
  belongs_to :promotor, class_name: "Persona"
  belongs_to :laboratorista, class_name: "Persona"

  before_update :establecer_fecha_analisis

  def establecer_fecha_analisis
    puts analizado
    if analizado == false
      write_attribute :fecha_analisis, nil
      write_attribute :incidencia, nil
    end
  end

end
