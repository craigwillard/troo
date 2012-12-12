require 'spec_helper'

describe "social_media_sites/edit" do
  before(:each) do
    @social_media_site = assign(:social_media_site, stub_model(SocialMediaSite,
      :name => "MyString",
      :homepageurl => "MyString",
      :userbaseurl => "MyString"
    ))
  end

  it "renders the edit social_media_site form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => social_media_sites_path(@social_media_site), :method => "post" do
      assert_select "input#social_media_site_name", :name => "social_media_site[name]"
      assert_select "input#social_media_site_homepageurl", :name => "social_media_site[homepageurl]"
      assert_select "input#social_media_site_userbaseurl", :name => "social_media_site[userbaseurl]"
    end
  end
end
