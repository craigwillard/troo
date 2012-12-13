class CreateSocialMediaSites < ActiveRecord::Migration
  def change
    create_table :social_media_sites do |t|
      t.string :name
      t.string :homepage_url
      t.string :userbase_url

      t.timestamps
    end
  end
end
