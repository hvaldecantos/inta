class Role < ActiveRecord::Base
  attr_accessible :description, :name, :programa_id
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :assignments
  has_many :users, :through => :assignments

  belongs_to :programa

  scope :extensionistas, where("name = 'Extensionista' ")
  scope :administradores, where("name = 'admin' ")

  def self.all_from_programa(nombre_progama)
    Role.joins(:programa).where("programas.nombre = '#{nombre_progama}'").order("roles.name")
  end
  def self.all_sin_programa
    Role.where("programa_id is null").order("roles.name")
  end
end
