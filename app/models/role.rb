class Role < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :assignments
  has_many :users, :through => :assignments

  scope :extensionistas, where("name = 'Extensionista' ")
  scope :administradores, where("name = 'admin' ")
end
