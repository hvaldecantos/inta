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
#

require 'spec_helper'

describe AnalisisRsd do
  pending "add some examples to (or delete) #{__FILE__}"
end
