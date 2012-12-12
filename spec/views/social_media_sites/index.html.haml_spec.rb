require 'spec_helper'

describe "social_media_sites/index" do
  before(:each) do
    assign(:social_media_sites, [
      stub_model(SocialMediaSite,
        :name => "Name",
        :homepageurl => "Homepageurl",
        :userbaseurl => "Userbaseurl"
      ),
      stub_model(SocialMediaSite,
        :name => "Name",
        :homepageurl => "Homepageurl",
        :userbaseurl => "Userbaseurl"
      )
    ])
  end

  it "renders a list of social_media_sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Homepageurl".to_s, :count => 2
    assert_select "tr>td", :text => "Userbaseurl".to_s, :count => 2
  end
end
