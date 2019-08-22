class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      redirect_to users_path
    else
      flash[:alert] = @friendship.errors.full_messages.to_sentence
      redirect_back fallback_location: root_path
    end
  end
  def destroy
    @friendship = Friendship.where(user_id: current_user, friend_id: params[:id])
    @friendship.destroy_all
    redirect_to users_path
  end
end
