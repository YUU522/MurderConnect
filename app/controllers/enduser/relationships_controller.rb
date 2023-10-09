class Enduser::RelationshipsController < ApplicationController
  # フォローするとき
  def create
    current_enduser.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_enduser.unfollow(params[:user_id])
    redirect_to request.referer  
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
end
