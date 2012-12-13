class CreateSocialMediaAccounts < ActiveRecord::Migration
  def change
    create_table :social_media_accounts do |t|
      t.references :user
      t.references :social_media_site
      t.string :identifier

      t.timestamps
    end
    add_index :social_media_accounts, :user_id
    add_index :social_media_accounts, :social_media_site_id
  end
end
