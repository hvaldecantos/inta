# == Schema Information
#
# Table name: profiles
#
#  id                          :integer          not null, primary key
#  user_id                     :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  type                        :string(255)
#  proicsa_agente_id           :integer
#  persona_id                  :integer
#  pc_asignada                 :string(255)
#  proicsa_jefe_agente_id      :integer
#  proicsa_coordinador_id      :integer
#  proicsa_jefe_coordinador_id :integer
#

require 'spec_helper'

describe Profile do
  pending "add some examples to (or delete) #{__FILE__}"
end
