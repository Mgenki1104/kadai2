class IntroductionsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @introduction = current_user.introductions.new(introduction_params)
   
    introduction.save
    redirect_to books_path
  end

  def destroy
  end
  
  private

  def introduction_params
    params.require(:introduction).permit(:comment)
  end
  
  
  
end
