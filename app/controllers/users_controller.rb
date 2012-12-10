class UsersController < ApplicationController
  before_filter :authorize, :except => [:show, :edit]
  before_filter :on_own_profile, :only => [:show, :edit]

  def authorize
    if !(current_user && current_user.admin)
      redirect_to root_url, :notice => "Sorry, man. You can't see this page."
    end
  end

  def on_own_profile
    if current_user && !(current_user.admin)
      @user = User.find(params[:id])

      if (@user.id != current_user.id)
        redirect_to root_url, :notice => "Sorry, man. You can only edit your own profile."
      end
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    #respond_to do |format|
      if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render json: @user, status: :created, location: @user }
        redirect_to root_url, :notice => "Signed up! Now please sign in, fool."
      else
        render "new"
        #format.html { render action: "new" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    #respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        render action: "edit"
        #format.html { render action: "edit" }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
