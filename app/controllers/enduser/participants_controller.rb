class Enduser::ParticipantsController < ApplicationController
  before_action :authenticate_enduser!
  def index
    @post = Post.find(params[:post_id])
  end

  def create
    puts "Post ID from params: #{params[:post_id]}"
    @post = Post.find(params[:post_id])
    #byebug
    current_enduser.participate!(@post)
    redirect_to post_participants_path, notice: '参加しました。'
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    participant = current_enduser.participant_for(@post)
    participant.destroy if participant
    
    redirect_to post_participants_path, notice: '参加を取り消しました。'
  end
  
  def show
  end


end
