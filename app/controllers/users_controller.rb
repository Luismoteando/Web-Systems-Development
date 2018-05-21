class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

  def show
    @users = User.all
    @friends = @user.friends
    @incoming = FriendRequest.where(friend: @user)
    @outgoing = @user.friend_requests
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
