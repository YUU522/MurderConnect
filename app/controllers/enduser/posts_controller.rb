class Enduser::PostsController < ApplicationController
    def new
      if current_enduser
        @post = current_enduser.posts.new
      else
        redirect_to new_enduser_session_path, alert: "ログインが必要です"
      end
    end

def index
  @users = Enduser.all
  @user_id = params[:enduser_id]

  if @user_id.present?
    @posts = Enduser.find(@user_id).posts
  else
    @posts = Post.all
  end
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

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: '投稿が削除されました。'
  end

  def show
    @post = Post.find(params[:id])
    @tag = Tag.find(@post.tag_id)
  end
  
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @posts = @tag.posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :body, :tag_id)
  end
end





