class Enduser::SearchesController < ApplicationController
  before_action :authenticate_enduser!

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

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
  end
end
