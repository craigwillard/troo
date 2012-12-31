class SocialMediaSite < ActiveRecord::Base
  attr_accessible :homepage_url, :name, :userbase_url

  has_many :socialmediaaccounts
  has_many :users, through: :socialmediaaccounts

  validates :homepage_url, presence: true
  validates :name, presence: true
  validates :userbase_url, presence: true
end