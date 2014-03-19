class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

  end

  def protected
    session[:permission] = 0
    if !params.nil? && params[:password] == 'testing'
    session[:permission] = 1
    if params[:id].to_i > 0
    redirect_to :action => 'show', :id => params[:id]
  else
    redirect_to '/protected_gallery'
  end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  
  @comments = Comment.find_all_by_post_id(params[:id])
  @users = User.all
  if session[:permission] == 1 || (signed_in? && current_user.permission.to_i > 1 && @post.protected.to_i == 1)
    render action: 'show'
  elsif @post.protected.to_i == 1 || !current_user.nil? && current_user.permission.to_i < 2
    redirect_to :action => 'protected', :id => @post.id
  else render action: 'show'
  end
#  @commentlist = @comments.collect { |e| e.words }
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
		#  /\.(gif|jpe?g|png)$/ =~ "testing"
		#if (params[:post][:link] =~ /\.(gif|jpe?g|png)$/)
	#		params[:post][:picture] = "Is an image"
#			end
#		@mylink = params[:post][:picture]
		
    @post = Post.new(post_params)
		
    respond_to do |format|
      if @post.save
				@link = post_params[:link]
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:post, :score, :words, :user_id, :picture, :title, :link, :protected)
    end
end
