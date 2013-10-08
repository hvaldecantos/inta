# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  programa_id :integer
#

class Role < ActiveRecord::Base
  attr_accessible :description, :name, :programa_id

  has_many :assignments, :dependent => :restrict
  has_many :users, :through => :assignments

  belongs_to :programa

  VALID_NAME_REGEX = /^\s*\w*\s*$/
  validates :name, presence: true, 
                   length: {maximum: 50}, 
                   format: { with: VALID_NAME_REGEX }

  validates_uniqueness_of :name, :case_sensitive => false, :scope => :programa_id

  validate :profile_subclass_for_role_exists

  scope :extensionistas, where("name = 'Extensionista' ")
  scope :administradores, where("name = 'admin' ")

  def name=(s)
    write_attribute(:name, s.to_s.strip)
  end

  def self.all_from_programa(nombre_progama)
    Role.joins(:programa).where("programas.nombre = '#{nombre_progama}'").order("roles.name")
  end
  def self.all_sin_programa
    Role.where("programa_id is null").order("roles.name")
  end

  def profile_subclass_name
    programa.nombre + name
  end

  private
    def profile_subclass_for_role_exists
      if !programa_id.nil? && !Profile.clases_derivadas.include?(profile_subclass_name) then
       errors.add(:name, ": el rol '#{name}' no se encuentra implementado en el sistema.")
     end
    end
end
