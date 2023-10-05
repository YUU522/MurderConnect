class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
  end
  
  def index
    @tag = Tag.new
    @admin_tags = Tag.all # 例: すべてのタグを取得して @admin_tags に代入
  end
  
  def create
    @tag = Tag.new(tag_params)
  
    if @tag.save
      redirect_to  admin_tags_path
    else
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_title)
  end
end
