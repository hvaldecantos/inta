class Role < ActiveRecord::Base
  attr_accessible :description, :name, :programa_id
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :assignments
  has_many :users, :through => :assignments

  belongs_to :programa

  scope :extensionistas, where("name = 'Extensionista' ")
  scope :administradores, where("name = 'admin' ")
end
