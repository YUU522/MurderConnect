class Enduser::RelationshipsController < ApplicationController
  before_action :authenticate_enduser!
  # フォローするとき
  def create
    current_enduser.follow(params[:user_id])
    @enduser = Enduser.find(params[:user_id])
  end
  # フォロー外すとき
  def destroy
    current_enduser.unfollow(params[:user_id])
    @enduser = Enduser.find(params[:user_id])
  end
  # フォロー一覧
  def followings
    enduser = Enduser.find(params[:user_id])
    @endusers = enduser.followings
  end
  # フォロワー一覧
  def followers
    enduser = Enduser.find(params[:user_id])
    @endusers = enduser.followers
  end
  def followingspost
    @posts = Post.where(enduser_id: [*current_enduser.following_ids])
  end
end
