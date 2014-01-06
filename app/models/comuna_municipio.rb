# == Schema Information
#
# Table name: comunas_municipios
#
#  nombre               :string(255)
#  categoria            :string(255)
#  provincia_id         :integer
#  departamento_id_base :integer
#  id_base              :integer
#  fuente               :string(255)
#  agencia_id           :integer
#  departamento_id      :integer
#  id                   :integer          not null, primary key
#  the_geom             :spatial({:srid=>
#

class ComunaMunicipio < ActiveRecord::Base
  belongs_to :departamento
  has_many :analisis_rsds
  has_many :productores
end
