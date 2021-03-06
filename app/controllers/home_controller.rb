class HomeController < ApplicationController

  def index
    @posts = @user.present? ? @user.posts.all : Post.all.page(params[:page]).order(created_at: :desc)
    @users = User.all
    @post = @user.present? ? @user.posts.all : Post.all
  end

  def photographer
    @job = User.where(job: "Photographer")
    @post = @user.present? ? @user.posts.all : Post.all
  end

  def model
    @job = User.where(job: "Model")
    @post = @user.present? ? @user.posts.all : Post.all
  end
end
