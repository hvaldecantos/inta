# == Schema Information
#
# Table name: departamentos
#
#  provincia_id :integer
#  id_base      :integer
#  id           :integer          not null, primary key
#  nombre       :string(255)
#  cabecera     :string(255)
#  the_geom     :spatial({:srid=>
#

class Departamento < ActiveRecord::Base
  has_many :localidades
  has_many :comunas_municipios
  has_many :parajes
  has_many :analisis_rsds
end
