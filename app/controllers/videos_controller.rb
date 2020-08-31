class VideosController < ApplicationController
  def index
    @q = Admin::Video.ransack(params[:q])
    @videos = @q.result(distinct: true)
  end

  def show
    @video = Admin::Video.find(params[:id])
    @comments = @video.verified_comments(locale)
    @tags = @video.tags
  end

  def update
    @video = Admin::Video.find(params[:id])
    if admin_video_params.has_key?(:comment_attributes)
      params[:admin_video][:comment_attributes].merge!(locale: locale, user_id: current_user.id)
      @video.comments.build(admin_video_params[:comment_attributes])
    end
    
    if admin_video_params.has_key?(:score_attributes)
      authorize! :create, Admin::Score if current_user.rated?(@video)
      params[:admin_video][:score_attributes].merge!(user_id: current_user.id)
      @video.scores.build(admin_video_params[:score_attributes])
    end
    
    respond_to do |format|
      if @video.save
        format.html { redirect_to video_path(@video), notice: t('.success') }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { redirect_to video_path(@video), notice: t('.error') }
        format.json { head :no_content }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
  def admin_video_params
      params.require(:admin_video).permit(comment_attributes: [:content, :user_id, :locale],
                                          score_attributes: [:value, :user_id])
  end
end
