class FriendsController < ApplicationController
    def index
        @wating_friends = current_user.wating_friends
        @to_accept_friends = current_user.to_accept_friends
        @friends = current_user.friends
    end

    def update
        friend = Admin::Friend.find(params[:id])
        friend.accept = true
        inverse_friend = friend.dup
        inverse_friend.id = nil
        inverse_friend.user_id = friend.friend_id
        inverse_friend.friend_id = friend.user_id
        respond_to do |format|
            if friend.save and inverse_friend.save
                format.html { redirect_to friends_url, notice: t('.success') }
                format.json { render :show, status: :ok, location: friend }
            else
                format.html { redirect_to friends_url, notice: t('.error') }
                format.json { head :no_content }
            end
        end
    end

    def destroy
        friend = Admin::Friend.find(params[:id])
        friend.destroy
        respond_to do |format|
            format.html { redirect_to friends_url, notice: t('.success') }
            format.json { head :no_content }
        end
    end
end
