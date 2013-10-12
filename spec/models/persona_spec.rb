# == Schema Information
#
# Table name: personas
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  nombre           :string(255)
#  apellido         :string(255)
#  dni              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  telefono_fijo    :string(255)
#  telefono_celular :string(255)
#

require 'spec_helper'

describe Persona do
  pending "add some examples to (or delete) #{__FILE__}"
end
