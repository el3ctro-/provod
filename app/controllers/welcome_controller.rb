class WelcomeController < ApplicationController
  def index
      @posts = Post.all
	  @users = User.all
	  @comments = Comment.all
  end
end
