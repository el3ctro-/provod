class ThumbsController < ApplicationController
  before_action :set_thumb, only: [:show, :edit, :update, :destroy]

  # GET /thumbs
  # GET /thumbs.json
  def index
    @thumbs = Thumb.all
  end

  # GET /thumbs/1
  # GET /thumbs/1.json
  def show
  end

  # GET /thumbs/new
  def new
    @thumb = Thumb.new
  end

  # GET /thumbs/1/edit
  def edit
  end

  # POST /thumbs
  # POST /thumbs.json
  def create
    @thumb = Thumb.new(thumb_params)

    respond_to do |format|
      if @thumb.save
        format.html { redirect_to @thumb, notice: 'Thumb was successfully created.' }
        format.json { render action: 'show', status: :created, location: @thumb }
      else
        format.html { render action: 'new' }
        format.json { render json: @thumb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thumbs/1
  # PATCH/PUT /thumbs/1.json
  def update
    respond_to do |format|
      if @thumb.update(thumb_params)
        format.html { redirect_to @thumb, notice: 'Thumb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @thumb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbs/1
  # DELETE /thumbs/1.json
  def destroy
    @thumb.destroy
    respond_to do |format|
      format.html { redirect_to thumbs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thumb
      @thumb = Thumb.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thumb_params
      params.require(:thumb).permit(:comment_id, :up_or_down, :user_id)
    end
end
