class Enduser::PostsController < ApplicationController
    before_action :authenticate_access
    def new
      if current_enduser
        @post = current_enduser.posts.new
      else
        redirect_to new_enduser_session_path, alert: "ログインが必要です"
      end
    end

def index
  @tags = Tag.all # タグを取得

  if params[:enduser_id].present?
    @user = Enduser.find(params[:enduser_id])
    # 特定のユーザーに関連する投稿を取得
    @user_posts = @user.posts.includes(:hashtags, :tag)
  else
    # 全ての投稿を取得
    @user_posts = Post.includes(:hashtags, :tag)
  end
end

  def create
    @post = current_enduser.posts.new(post_params)
  
    if @post.save
      redirect_to @post, notice: '投稿が作成されました。'
    else
       @tags = Tag.all
        flash.now[:alert] = '投稿にエラーがあります。'
        render :new # new.html.erbを表示します
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
  
  def authenticate_access
    unless current_admin || current_adomin
      redirect_to new_enduser_session_path, alert: "管理者またはアドミンとしてログインが必要です"
    end
  end
end





