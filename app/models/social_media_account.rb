class SocialMediaAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :socialmediasite
  attr_accessible :identifier
end
