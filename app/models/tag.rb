class Tag < ActiveRecord::Base
  has_many :user_tags
  has_many :users, through: :user_tags

  attr_accessible :name

  validates :name, :presence => :true
end