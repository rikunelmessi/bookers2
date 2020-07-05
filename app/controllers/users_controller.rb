class UsersController < ApplicationController
   before_action :authenticate_user!
  def index
    @users = User.all
     #@current_user = User.find_by(id: session[:user_id])
     @book= Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @current_user = User.find_by(id: session[:user_id])
    @book= Book.new
  end

  def edit
    @user =User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
  redirect_to user_path(@user.id) ,notice:'You have updated user successfully'
else
  render "edit"
  end
end
private
  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image_id)
end
end
