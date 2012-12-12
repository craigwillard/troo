class CreateSocialMediaSites < ActiveRecord::Migration
  def change
    create_table :social_media_sites do |t|
      t.string :name
      t.string :homepageurl
      t.string :userbaseurl

      t.timestamps
    end
  end
end
