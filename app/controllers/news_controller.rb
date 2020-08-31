class NewsController < ApplicationController  
  def index
    @q = Admin::News.ransack(params[:q])
    @news = @q.result(distinct: true)
  end

  def show
      @news = Admin::News.find(params[:id])
      @comments = @news.verified_comments(locale)
      @tags = @news.tags
  end

  def update
    @news = Admin::News.find(params[:id])
    if admin_news_params.has_key?(:comment_attributes)
      params[:admin_news][:comment_attributes].merge!(locale: locale, user_id: current_user.id)
      @news.comments.build(admin_news_params[:comment_attributes])
    end
      
    if admin_news_params.has_key?(:score_attributes)
      authorize! :create, Admin::Score if current_user.rated?(@news)
      params[:admin_news][:score_attributes].merge!(user_id: current_user.id)
      @news.scores.build(admin_news_params[:score_attributes])
    end
      
    respond_to do |format|
      if @news.save
        format.html { redirect_to news_path(@news), notice: t('.success') }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { redirect_to news_path(@news), notice: t('.error') }
        format.json { head :no_content }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.
  def admin_news_params
      params.require(:admin_news).permit(comment_attributes: [:content, :user_id, :locale],
                                          score_attributes: [:value, :user_id])
  end
end
