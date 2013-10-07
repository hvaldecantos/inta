# == Schema Information
#
# Table name: profiles
#
#  id                :integer          not null, primary key
#  nombre            :string(255)
#  apellido          :string(255)
#  telefono_fijo     :string(255)
#  telefono_celular  :string(255)
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  type              :string(255)
#  proicsa_agente_id :integer
#  persona_id        :integer
#

class ProicsaAgente < Profile
  has_many :proicsa_extensionistas
end
