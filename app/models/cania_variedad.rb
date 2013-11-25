# == Schema Information
#
# Table name: cania_variedades
#
#  id          :integer          not null, primary key
#  nombre      :string(255)
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CaniaVariedad < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  has_many :analisis_rsds

  validates_presence_of :nombre
end
