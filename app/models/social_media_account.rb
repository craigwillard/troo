class SocialMediaAccount < ActiveRecord::Base
  belongs_to :user
  belongs_to :social_media_site
  attr_accessible :identifier, :user_id, :social_media_site_id

  validates :social_media_site_id, uniqueness: { scope: :user_id }
  validates :identifier, presence: true

  def social_media_site_name
    self.social_media_site.name
  end

end
