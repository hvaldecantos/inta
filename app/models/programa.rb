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

  has_many :roles, :dependent => :restrict

  NOMBRE_VALIDO_REGEX = /^\s*\w*\s*$/
  
  validates :nombre, presence: true, 
                     length: {maximum: 50}, 
                     format: { with: NOMBRE_VALIDO_REGEX }, 
                     uniqueness: { case_sensitive: false }
  validate :if_name_can_be_edited

  def nombre=(s)
    write_attribute(:nombre, s.to_s.strip)
  end              

  private
    def if_name_can_be_edited
      nombre_original = Programa.find(id).nombre
      if(roles.size > 0 && nombre != nombre_original) then
        errors.add(:nombre, ": el nombre del programa no se puede editar.")
      end
    end

end
