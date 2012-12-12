require 'spec_helper'

describe "SocialMediaSites" do
  describe "GET /social_media_sites" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get social_media_sites_path
      response.status.should be(200)
    end
  end
end
