class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    @friendship.confirmed = false
    if @friendship.save
      flash[:notice] = 'Friend request was successfully sent.'
      redirect_to root_url
    else
      redirect_to root_url, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def update

  end

  def index
    
  end

  def destroy
    
  end
end
