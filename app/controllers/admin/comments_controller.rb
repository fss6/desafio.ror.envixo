class Admin::CommentsController < AdminController
  before_action :set_admin_comment, only: [:update, :destroy]

  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @admin_comments = Admin::Comment.unchecked
  end

  # PATCH/PUT /admin/comments/1
  # PATCH/PUT /admin/comments/1.json
  def update
    respond_to do |format|
      if @admin_comment.update(admin_comment_params)
        format.html { redirect_to admin_comments_url, notice: t('.success') }
        format.json { render :show, status: :ok, location: @admin_comment }
      else
        format.html { redirect_to admin_comments_url }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @admin_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: t('.success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @admin_comment = Admin::Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_comment_params
      params.require(:admin_comment).permit(:verified)
    end
end
