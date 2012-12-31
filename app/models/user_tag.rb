class UserTag < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag

  attr_accessible :name, :user_id, :tag_id

  validates :user, presence: :true
  validates :tag, presence: :true
end