class Enduser::SearchesController < ApplicationController
  before_action :authenticate_enduser!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @tags = Tag.all
    
    # 選択したモデルに応じて検索を実行
      if @content.start_with?('#', '＃')
      hashtag = @content[1..-1] # ハッシュタグの#を取り除く
      @records = Post.joins(:hashtags).where(hashtags: { hashname: hashtag })
      @content = hashtag
      @model = 'hashtag'
      elsif @model == "user"
        @records = Enduser.search_for(@content, @method)
      else
        @records = Post.search_for(@content, @method)
      end
      if params[:enduser_id].present?
        @user = Enduser.find(params[:enduser_id])
        # 特定のユーザーに関連する投稿を取得
        @user_posts = @user.posts.includes(:hashtags, :tag)
      else
        # 全ての投稿を取得
        @user_posts = Post.includes(:hashtags, :tag)
      end
  end
end
