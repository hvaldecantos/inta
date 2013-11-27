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

class Profile < ActiveRecord::Base
  attr_accessible  :type, :proicsa_agente_id, :proicsa_jefe_agente_id, :proicsa_coordinador_id, :proicsa_jefe_coordinador_id

  belongs_to :user
  belongs_to :persona

  has_many :roles, :through => :persona

  def corresponding_form
    self.class.name.underscore
  end

  def apellido_nombre
    persona.apellido_nombre
  end

  def self.arr
    arr = self.all.collect{|p| [p.apellido_nombre, p.persona.id]}
    arr.sort!{|a,b| a.first.downcase <=> b.first.downcase}
  end

  def self.all_for_select
    arr = self.all.collect{|p| [p.apellido_nombre, p.id]}
    arr.sort!{|a,b| a.first.downcase <=> b.first.downcase}
  end

  def self.all_for_select_id_persona
    arr = self.all.collect{|p| [p.apellido_nombre, p.persona.id]}
    arr.sort!{|a,b| a.first.downcase <=> b.first.downcase}
  end
end
