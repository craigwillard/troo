class SocialMediaSitesController < ApplicationController
  before_filter :authorize, :get_resources

  def index
    @social_media_sites = SocialMediaSite.all

    respond_to do |format|
      format.html
      format.json { render json: @social_media_sites }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @social_media_site }
    end
  end

  def new
    @social_media_site = SocialMediaSite.new

    respond_to do |format|
      format.html
      format.json { render json: @social_media_site }
    end
  end

  def edit
  end

  def create
    @social_media_site = SocialMediaSite.new(params[:social_media_site])

    respond_to do |format|
      if @social_media_site.save
        format.html { redirect_to @social_media_site, notice: 'Social media site was successfully created.' }
        format.json { render json: @social_media_site, status: :created, location: @social_media_site }
      else
        format.html { render action: "new" }
        format.json { render json: @social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @social_media_site.update_attributes(params[:social_media_site])
        format.html { redirect_to @social_media_site, notice: 'Social media site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @social_media_site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @social_media_site.destroy

    respond_to do |format|
      format.html { redirect_to social_media_sites_url }
      format.json { head :no_content }
    end
  end

  private
    def get_resources
      @social_media_site = SocialMediaSite.find(params[:id]) if params[:id]
    end

end
