class UsersController < ApplicationController
  before_filter :authorize, only: [:index]
  before_filter :get_resources
  before_filter :on_own_profile, only: [:show, :edit]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to root_url, notice: "Signed up! Now please sign in, fool."
    else
      render "new"
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    def on_own_profile
      if logged_in?
        if !(current_user.admin)
          if (@user.id != current_user.id)
            redirect_to root_url, notice: "Sorry, man. You can only edit your own profile."
          end
        end
      else
        redirect_to root_url, notice: "Sorry, man. You can't see this page."
      end
    end

    def get_resources
      @user = User.find(params[:id]) if params[:id]
    end

end
