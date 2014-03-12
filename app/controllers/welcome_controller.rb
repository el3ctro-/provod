class WelcomeController < ApplicationController
  def index
      @posts = Post.all
	  @users = User.all
	  @comments = Comment.all
  end
	
	def gallery
		@posts = Post.all
		@comments = Comment.all
		end
end
