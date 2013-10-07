# == Schema Information
#
# Table name: programas
#
#  id          :integer          not null, primary key
#  nombre      :string(255)
#  descripcion :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Programa < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  has_many :roles

end
