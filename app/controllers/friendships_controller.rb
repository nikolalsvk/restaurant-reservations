class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :destroy]
  before_action :set_friend, :only => [:create, :destroy]
  before_action :set_guests, :only => [:index]

  def index
    if params[:sort]
      @friends = User.joins(:friendships).where("friendships.friend_id" => current_user.id).order(params[:sort])
    else
      @friends = User.joins(:friendships).where("friendships.friend_id" => current_user.id)
    end
  end

  def show
  end

  def create
    @friendship = current_user.friendships.build(friendship_params)
    @inverse_friendship = @friend.friendships.build(:user_id => @friend, :friend_id => current_user.id)

    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @friendship.save && @inverse_friendship.save && @friend.save
          format.html { redirect_to users_friendships_path, notice: 'Friendship was successfully created.' }
          format.json { render :show, status: :created, location: @friendship }
        else
          format.html { render :new }
          format.json { render json: @friendship.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      @friendship.friend.friendships.where(:friend_id => current_user.id).first.destroy
      @friendship.destroy
    end

    respond_to do |format|
      format.html { redirect_to users_friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_friendship
    @friendship = current_user.friendships.find(params[:id] || friendship_params[:friend_id])
  end

  def set_friend
    @friend = Guest.find(params[:friend_id] || friendship_params[:friend_id])
  end

  def set_guests
    if params[:search]
      @guest_search = Guest.search(params[:search])
    end
  end

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
