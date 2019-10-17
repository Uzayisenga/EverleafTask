class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :only_create_user_when_none_signed_in, only: [:new, :create]
  before_action :only_see_own_page, only: [:show]
  # GET /users
  # GET /users.json
  def index
    @user = User.order(:names).page(params[:page]).per(5)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.id == current_user.id
      redirect_to admin_users_path, notice: "You can not delete signed in user"
    elsif User.all.count !=1 
      @user.destroy
      respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
      end
      
    else
      redirect_to admin_users_path, notice: "You can not delete last admin"
    end
  
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def only_create_user_when_none_signed_in
      if current_user
        redirect_to users_path,  notice: "you can't create user when signed in"
      end
    end
    def only_see_own_page
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to users_path, notice: "Sorry, but you are only allowed to view your own profile page."
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:names, :email, :password, :user_type)
    end
end
