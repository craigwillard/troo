require 'spec_helper'

describe "social_media_sites/new" do
  before(:each) do
    assign(:social_media_site, stub_model(SocialMediaSite,
      :name => "MyString",
      :homepage_url => "MyString",
      :userbase_url => "MyString"
    ).as_new_record)
  end

  it "renders new social_media_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => social_media_sites_path, :method => "post" do
      assert_select "input#social_media_site_name", :name => "social_media_site[name]"
      assert_select "input#social_media_site_homepage_url", :name => "social_media_site[homepage_url]"
      assert_select "input#social_media_site_userbase_url", :name => "social_media_site[userbase_url]"
    end
  end
end
