class UsersController < ApplicationController


  def new
     @users = User.all
    @user = User.find(params[:id])
    @introduction = Introduction.new
    @books = @user.books
    @book = Book.new
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to users_path
  end

  def index
    @users = User.all
    @introduction = Introduction.new
    @book = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @introduction = Introduction.new
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    render :edit
    else
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)

  end
end
