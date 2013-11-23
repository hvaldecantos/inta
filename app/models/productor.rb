# == Schema Information
#
# Table name: productores
#
#  id                  :integer          not null, primary key
#  nombre              :string(255)
#  apellido            :string(255)
#  dni                 :string(255)
#  departamento_id     :integer
#  comuna_municipio_id :integer
#  agencia             :string(255)
#  email_extensionista :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Productor < ActiveRecord::Base
  attr_accessible :agencia, :apellido, :comuna_municipio_id, :departamento_id, :dni, :email_extensionista, :nombre

  validates_presence_of :apellido, :nombre
  validates_uniqueness_of :dni, :allow_nil => true

  has_many :analisis_rsds

  def apellido_nombre
    nombre_completo = ""
    if apellido.nil? == false
      nombre_completo << apellido
    end
    if nombre.nil? == false
      unless apellido.nil? then nombre_completo << " " end
      nombre_completo << ", "<< nombre
    end
    nombre_completo
  end

end
