class SocialMediaAccountsController < ApplicationController
  before_filter :find_user
  before_filter :authorize, :only => [:index, :show]
  before_filter :authorize_social_media_accounts, :except => [:index, :show]

  # GET /social_media_accounts
  # GET /social_media_accounts.json
  def index
    if @user
      @social_media_accounts = @user.social_media_accounts.all
    else
      @social_media_accounts = SocialMediaAccount.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @social_media_accounts }
    end
  end

  # GET /social_media_accounts/1
  # GET /social_media_accounts/1.json
  def show
    if @user
      @social_media_account = @user.social_media_accounts.find(params[:id])
    else
      @social_media_account = SocialMediaAccount.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @social_media_account }
    end
  end

  # GET /social_media_accounts/new
  # GET /social_media_accounts/new.json
  def new
    @social_media_account = @user.social_media_accounts.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @social_media_account }
    end
  end

  # GET /social_media_accounts/1/edit
  def edit
    if @user
      @social_media_account = @user.social_media_accounts.find(params[:id])
    else
      @social_media_account = SocialMediaAccount.find(params[:id])
    end
  end

  # POST /social_media_accounts
  # POST /social_media_accounts.json
  def create
    @social_media_account = @user.social_media_accounts.new(params[:social_media_account])

    respond_to do |format|
      if @social_media_account.save
        format.html { redirect_to @user, notice: 'Social media account was successfully created.' }
        format.json { render json: @social_media_account, status: :created, location: @social_media_account }
      else
        format.html { render action: "new" }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /social_media_accounts/1
  # PUT /social_media_accounts/1.json
  def update
    @social_media_account = @user.social_media_accounts.find(params[:id])

    respond_to do |format|
      if @social_media_account.update_attributes(params[:social_media_account])
        format.html { redirect_to @user, notice: 'Social media account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @social_media_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_media_accounts/1
  # DELETE /social_media_accounts/1.json
  def destroy
    if @user
      @social_media_account = @user.social_media_accounts.find(params[:id])
    else
      @social_media_account = SocialMediaAccount.find(params[:id])
    end

    @social_media_account.destroy

    respond_to do |format|
      if @user
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        format.html { redirect_to social_media_accounts_path }
        format.json { head :no_content }
      end
    end
  end

private
  def find_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def authorize_social_media_accounts
    if !(current_user.admin)
      if (@user.id != current_user.id)
        redirect_to root_url, :notice => "Sorry, man. You can only edit your own profile!!"
      end
    end
  end

end
