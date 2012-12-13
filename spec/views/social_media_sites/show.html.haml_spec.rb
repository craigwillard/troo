require 'spec_helper'

describe "social_media_sites/show" do
  before(:each) do
    @social_media_site = assign(:social_media_site, stub_model(SocialMediaSite,
      :name => "Name",
      :homepage_url => "homepage_url",
      :userbase_url => "userbase_url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/homepage_url/)
    rendered.should match(/userbase_url/)
  end
end
