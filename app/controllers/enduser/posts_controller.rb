class Enduser::PostsController < ApplicationController
    def new
      if current_enduser
        @post = current_enduser.posts.new
      else
        redirect_to new_enduser_session_path, alert: "ログインが必要です"
      end
    end

  def index
    puts "Current enduser: #{current_enduser.inspect}"
    @posts = Post.all
  end
  
  def create
    @post = current_enduser.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
      @posts = Post.all
      flash[:alert] = '投稿にエラーがあります。'
      flash[:errors] = @post.errors.full_messages
      render :index
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :url, :body, :tag_id)
  end
end





