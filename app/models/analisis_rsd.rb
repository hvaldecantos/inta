# == Schema Information
#
# Table name: analisis_rsds
#
#  id                  :integer          not null, primary key
#  fecha_extraccion    :date
#  fecha_ingreso       :date
#  fecha_analisis      :date
#  cania_variedad_id   :integer
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
#  _data_origin_id     :integer
#

class AnalisisRsd < ActiveRecord::Base
  attr_accessible :agente_id, :analizado, :anio_plantacion, :comuna_municipio_id, :departamento_id, :fecha_analisis, :fecha_extraccion, :fecha_ingreso, :incidencia, :laboratorista_id, :localidad_id, :membrana, :paraje_id, :parcela_id, :procedencia_id, :productor_id, :promotor_id, :cania_variedad_id

  validates_presence_of :comuna_municipio_id, :departamento_id, :paraje_id, :localidad_id, :agente_id, :promotor_id, :laboratorista_id, :productor, :cania_variedad_id
  
  belongs_to :paraje
  belongs_to :departamento
  belongs_to :comuna_municipio
  belongs_to :localidad

  belongs_to :agente, class_name: "Persona"
  belongs_to :promotor, class_name: "Persona"
  belongs_to :laboratorista, class_name: "Persona"
  belongs_to :productor
  belongs_to :cania_variedad
  
  before_update :establecer_fecha_e_incidencia_si_analizado_false

  validate :incidencia_en_blanco_si_analizado_true

  validate :fecha_extraccion_fecha_ingreso
  validate :fecha_analisis_fecha_ingreso
  validate :fecha_analisis_fecha_extraccion
  validate :fecha_analisis_si_analisado

  scope :mi_vista, lambda { |persona_id, mi_vista| 
    {:conditions => "(promotor_id = #{persona_id} OR agente_id = #{persona_id} OR laboratorista_id = #{persona_id}) OR NOT #{mi_vista}"}
  }

  def fecha_analisis_si_analisado
    if analizado == true && fecha_analisis.nil?
      errors.add(:fecha_analisis, ": si se hizo el análisis, debe ingresar la fecha del análisis.")
    end
  end

  def fecha_extraccion_fecha_ingreso
    if fecha_ingreso.nil? || fecha_extraccion.nil? then return end
    if(fecha_ingreso < fecha_extraccion) then
      errors.add(:fecha_ingreso, ": no puede ser antes de la fecha de extracción.")
    end
  end
  def fecha_analisis_fecha_ingreso
    if fecha_analisis.nil? || fecha_ingreso.nil? then return end
    if(fecha_analisis < fecha_ingreso) then
      errors.add(:fecha_analisis, ": no puede ser antes de la fecha de ingreso.")
    end
  end
  def fecha_analisis_fecha_extraccion
    if fecha_analisis.nil? || fecha_extraccion.nil? then return end
    if(fecha_analisis < fecha_extraccion) then
      errors.add(:fecha_analisis, ": no puede ser antes de la fecha de extracción.")
    end
  end
  def establecer_fecha_e_incidencia_si_analizado_false
    if analizado == false
      write_attribute :fecha_analisis, nil
      write_attribute :incidencia, nil
    end
  end

  def incidencia_en_blanco_si_analizado_true
    if incidencia.blank? && analizado == true then
      errors.add(:incidencia, ": si se realizó el análisis rsd debe ingresar la incidencia.")
    end
  end
end
