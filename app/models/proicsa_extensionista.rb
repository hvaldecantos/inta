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

class ProicsaExtensionista < Profile
  attr_accessible  :pc_asignada
  belongs_to :proicsa_agente
end
