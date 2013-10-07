# == Schema Information
#
# Table name: personas
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  nombre     :string(255)
#  apellido   :string(255)
#  dni        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Persona < ActiveRecord::Base
  attr_accessible :apellido, :dni, :nombre
end
