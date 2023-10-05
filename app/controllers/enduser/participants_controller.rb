class Enduser::ParticipantsController < ApplicationController
  def index
  end

  def create
    puts "Post ID from params: #{params[:post_id]}"
    @post = Post.find(params[:post_id])
    #byebug
    current_enduser.participate!(@post)
    redirect_to post_participants_path, notice: '参加しました。'
  end

  def show
  end

end
