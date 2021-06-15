class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id])
    @friendship.confirmed = false
    if @friendship.save
      flash[:notice] = 'Friend request was successfully sent.'
      redirect_to request.referrer
    else
      redirect_to request.referrer, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirmed = true

    if @friendship.save
      @friendship.confirm_friend
      redirect_to request.referrer, notice: 'Friend request was successfully confirmed.'
    else
      redirect_to request.referrer, alert: @friendship.error.full_messages.join('. ').to_s
    end
  end

  def index
    @friendships = current_user.friendships
    @inverse_friendships = current_user.inverse_friendships
  end

  def destroy
    @friendship = Friendship.find_by(friend_id: current_user.id, user_id: params[:user_id])

    if @friendship.destroy
      redirect_to request.referrer, notice: 'Friend request declined'
    else
      redirect_to request.referrer, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end
end
