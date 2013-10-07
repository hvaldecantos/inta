# == Schema Information
#
# Table name: localidades
#
#  nombre              :string(255)
#  provincia_id        :integer
#  pobla_2001          :float
#  id                  :integer          not null, primary key
#  departamento_id     :integer
#  id_base             :string(255)
#  comuna_municipio_id :integer
#

class Localidad < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :analisis_rsds
end
