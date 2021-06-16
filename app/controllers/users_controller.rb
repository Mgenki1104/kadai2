class UsersController < ApplicationController

  def new
    #@post_image = PostImage.new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end
  
  def index
  @users = User.all
  end
    
  def show
    @user = User.find(params[:id])

    @books = @user.books.all
  end
private

  def user_params
    params.require(:user).permit(:name, :introdaction, :profile_image)

  end
end
