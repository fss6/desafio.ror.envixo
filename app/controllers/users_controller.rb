class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def update
        friend = Admin::Friend.new(user_params[:friend_attributes])
        respond_to do |format|
            if current_user.friends.push(friend)
                format.html { redirect_to friends_url, notice: t('.success') }
                format.json { render :show, status: :ok, location: friend }
            else
                format.html { redirect_to friends_url, notice: t('.error') }
                format.json { head :no_content }
            end
        end
    end

    private
    # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(friend_attributes: [:friend_id])
    end
end
