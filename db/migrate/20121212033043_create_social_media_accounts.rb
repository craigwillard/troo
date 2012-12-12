class CreateSocialMediaAccounts < ActiveRecord::Migration
  def change
    create_table :social_media_accounts do |t|
      t.references :user
      t.references :socialmediasite
      t.string :identifier

      t.timestamps
    end
    add_index :social_media_accounts, :user_id
    add_index :social_media_accounts, :socialmediasite_id
  end
end
