class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post = @user.present? ? @user.posts.all : Post.all
    @reviews = Review.where(:user_id => params[:id])
  end


  def showothers
    @user = User.find(params[:id])
    @post = @user.present? ? @user.posts.all : Post.all
    @reviews = Review.where(:user_id => params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params.require(:user).permit(:name, :place, :introduction, :images)
    @user.update_attributes(name: params[:user][:name], place: params[:user][:place], introduction: params[:user][:introduction], image: params[:user][:image])

    redirect_to "/user/#{@user.id}"
  end
end
