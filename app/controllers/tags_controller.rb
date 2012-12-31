class TagsController < ApplicationController
  before_filter :authorize, :get_resources

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.json { render json: @tags }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @tag }
    end
  end

  def new
    @tag = Tag.new

    respond_to do |format|
      format.html
      format.json { render json: @tag }
    end
  end

  def edit
  end

  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render json: @tag, status: :created, location: @tag }
      else
        format.html { render action: "new" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private
    def get_resources
      @tag = Tag.find(params[:id]) if params[:id]
    end
end
