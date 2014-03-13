class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
		
	  @users = User.all
	  @comments = Comment.all
  end
	
	def gallery
		@posts = Post.all
		@comments = Comment.all
		end
end
