# == Schema Information
#
# Table name: parajes
#
#  id                  :integer          not null, primary key
#  nombre              :string(255)
#  localidad_id        :integer
#  tipo                :string(255)
#  departamento_id     :integer
#  comuna_municipio_id :integer
#

class Paraje < ActiveRecord::Base
  belongs_to :departamento
  has_many :analisis_rsds
end
