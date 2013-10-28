# == Schema Information
#
# Table name: localidades
#
#  nombre              :string(255)
#  provincia_id        :integer
#  pobla_2001          :float
#  id                  :integer          not null, primary key
#  the_geom            :spatial({:srid=>
#  departamento_id     :integer
#  id_base             :integer
#  comuna_municipio_id :integer
#

class Localidad < ActiveRecord::Base
  belongs_to :departamento
  has_many :analisis_rsds
end
