class SocialMediaSite < ActiveRecord::Base
  attr_accessible :homepageurl, :name, :userbaseurl

  has_many :socialmediaaccount
end