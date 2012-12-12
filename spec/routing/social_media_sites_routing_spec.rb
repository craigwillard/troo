require "spec_helper"

describe SocialMediaSitesController do
  describe "routing" do

    it "routes to #index" do
      get("/social_media_sites").should route_to("social_media_sites#index")
    end

    it "routes to #new" do
      get("/social_media_sites/new").should route_to("social_media_sites#new")
    end

    it "routes to #show" do
      get("/social_media_sites/1").should route_to("social_media_sites#show", :id => "1")
    end

    it "routes to #edit" do
      get("/social_media_sites/1/edit").should route_to("social_media_sites#edit", :id => "1")
    end

    it "routes to #create" do
      post("/social_media_sites").should route_to("social_media_sites#create")
    end

    it "routes to #update" do
      put("/social_media_sites/1").should route_to("social_media_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/social_media_sites/1").should route_to("social_media_sites#destroy", :id => "1")
    end

  end
end
