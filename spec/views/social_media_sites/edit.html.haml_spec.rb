require 'spec_helper'

describe "social_media_sites/edit" do
  before(:each) do
    @social_media_site = assign(:social_media_site, stub_model(SocialMediaSite,
      :name => "MyString",
      :homepage_url => "MyString",
      :userbase_url => "MyString"
    ))
  end

  it "renders the edit social_media_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => social_media_sites_path(@social_media_site), :method => "post" do
      assert_select "input#social_media_site_name", :name => "social_media_site[name]"
      assert_select "input#social_media_site_homepage_url", :name => "social_media_site[homepage_url]"
      assert_select "input#social_media_site_userbase_url", :name => "social_media_site[userbase_url]"
    end
  end
end
