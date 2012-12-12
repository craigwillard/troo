class SocialMediaSitesController < ApplicationController
  # GET /social_media_sites
  # GET /social_media_sites.json
  def index
    @social_media_sites = SocialMediaSite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @social_media_sites }
    end
  end

  # GET /social_media_sites/1
  # GET /social_media_sites/1.json
  def show
    @social_media_site = SocialMediaSite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @social_media_site }
    end
  end

  # GET /social_media_sites/new
  # GET /social_media_sites/new.json
  def new
    @social_media_site = SocialMediaSite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @social_media_site }
    end
  end

  # GET /social_media_sites/1/edit
  def edit
    @social_media_site = SocialMediaSite.find(params[:id])
  end

  # POST /social_media_sites
  # POST /social_media_sites.json
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

  # PUT /social_media_sites/1
  # PUT /social_media_sites/1.json
  def update
    @social_media_site = SocialMediaSite.find(params[:id])

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

  # DELETE /social_media_sites/1
  # DELETE /social_media_sites/1.json
  def destroy
    @social_media_site = SocialMediaSite.find(params[:id])
    @social_media_site.destroy

    respond_to do |format|
      format.html { redirect_to social_media_sites_url }
      format.json { head :no_content }
    end
  end
end
