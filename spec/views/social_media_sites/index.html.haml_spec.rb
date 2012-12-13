require 'spec_helper'

describe "social_media_sites/index" do
  before(:each) do
    assign(:social_media_sites, [
      stub_model(SocialMediaSite,
        :name => "Name",
        :homepage_url => "homepage_url",
        :userbase_url => "userbase_url"
      ),
      stub_model(SocialMediaSite,
        :name => "Name",
        :homepage_url => "homepage_url",
        :userbase_url => "userbase_url"
      )
    ])
  end

  it "renders a list of social_media_sites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "homepage_url".to_s, :count => 2
    assert_select "tr>td", :text => "userbase_url".to_s, :count => 2
  end
end
