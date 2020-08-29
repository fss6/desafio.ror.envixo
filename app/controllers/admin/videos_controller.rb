class Admin::VideosController < AdminController
  before_action :set_admin_video, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:new, :edit, :create, :update]

  # GET /admin/videos
  # GET /admin/videos.json
  def index
    @admin_videos = Admin::Video.all
  end

  # GET /admin/videos/1
  # GET /admin/videos/1.json
  def show
  end

  # GET /admin/videos/new
  def new
    @admin_video = Admin::Video.new
    @admin_video.tags.build
  end

  # GET /admin/videos/1/edit
  def edit
  end

  # POST /admin/videos
  # POST /admin/videos.json
  def create
    @admin_video = Admin::Video.new(admin_video_params)
    @admin_video.user = current_user

    respond_to do |format|
      if @admin_video.save
        format.html { redirect_to @admin_video, notice: t('.success') }
        format.json { render :show, status: :created, location: @admin_video }
      else
        format.html { render :new }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/videos/1
  # PATCH/PUT /admin/videos/1.json
  def update
    respond_to do |format|
      if @admin_video.update(admin_video_params)
        format.html { redirect_to @admin_video, notice: t('.success') }
        format.json { render :show, status: :ok, location: @admin_video }
      else
        format.html { render :edit }
        format.json { render json: @admin_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/videos/1
  # DELETE /admin/videos/1.json
  def destroy
    @admin_video.destroy
    respond_to do |format|
      format.html { redirect_to admin_videos_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_video
      @admin_video = Admin::Video.find(params[:id])
    end

    def set_tags
      @tags = Admin::Tag.by_locale(locale)
    end

    # Only allow a list of trusted parameters through.
    def admin_video_params
      params.require(:admin_video).permit(:title, :url, :user_id, tag_ids: [])
    end
end
