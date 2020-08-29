class Admin::NewsController < AdminController
  before_action :set_admin_news, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:new, :edit, :create, :update]

  # GET /admin/news
  # GET /admin/news.json
  def index
    @admin_news = Admin::News.all
  end

  # GET /admin/news/1
  # GET /admin/news/1.json
  def show
  end

  # GET /admin/news/new
  def new
    @admin_news = Admin::News.new
  end

  # GET /admin/news/1/edit
  def edit
  end

  # POST /admin/news
  # POST /admin/news.json
  def create
    @admin_news = Admin::News.new(admin_news_params)
    @admin_news.user = current_user

    respond_to do |format|
      if @admin_news.save
        format.html { redirect_to @admin_news, notice: t('.success') }
        format.json { render :show, status: :created, location: @admin_news }
      else
        format.html { render :new }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/news/1
  # PATCH/PUT /admin/news/1.json
  def update
    respond_to do |format|
      if @admin_news.update(admin_news_params)
        format.html { redirect_to @admin_news, notice: t('.success') }
        format.json { render :show, status: :ok, location: @admin_news }
      else
        format.html { render :edit }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/news/1
  # DELETE /admin/news/1.json
  def destroy
    @admin_news.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_index_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_news
      @admin_news = Admin::News.find(params[:id])
    end

    def set_tags
      @tags = Admin::Tag.by_locale(locale)
    end

    # Only allow a list of trusted parameters through.
    def admin_news_params
      params.require(:admin_news).permit(:title, :subtitle, :content, :user_id, tag_ids: [])
    end
end
