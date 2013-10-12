# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  type              :string(255)
#  proicsa_agente_id :integer
#  persona_id        :integer
#

class ProicsaLaboratorista < Profile

end
