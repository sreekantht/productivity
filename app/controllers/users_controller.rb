class UsersController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index, :show, :new, :create]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id # auto sign in
      redirect_to root_url, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = current_user
    @user.destroy

    redirect_to users_url
  end
end
