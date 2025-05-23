class FollowersController < ApplicationController
  def index
    @user = find_user
    @folowers = @user.followers
  end

  private

  def find_user
    @_user || User.find_by(username: params[:user_id])
  end
end
