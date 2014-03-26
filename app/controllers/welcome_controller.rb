class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").where("protected is NULL").paginate(:page => params[:page], :per_page => 20)
		
	  @users = User.all
	  @comments = Comment.all
  end
	
	def gallery
		@posts = Post.all
		@comments = Comment.all
	end

	def protected_gallery
		if session[:permission] == 1
		@posts = Post.order("created_at DESC").where("protected > 0")
		@comments = Comment.all
		end
	end
	def feed
    @posts = Post.order("created_at DESC").where("protected is NULL", :limit => 10)
    @users = User.all
	    respond_to do |format|
	      format.html
	      format.rss { render :layout => false } #index.rss.builder
	    end
	end
end