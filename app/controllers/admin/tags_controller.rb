class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def index
    @tag = Tag.new
    @admin_tags = Tag.all # 例: すべてのタグを取得して @admin_tags に代入
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def create
    @tag = Tag.new(tag_params)
    @admin_tags = Tag.all
    @tag.save
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render :edit
    end
  end
  def destroy
    @tag = Tag.find(params[:id])
    @admin_tags = Tag.all
    @tag.destroy
    # redirect_to admin_tags_path, notice: 'タグが削除されました'
  end

  private

  def tag_params
    params.require(:tag).permit(:tag_title)
  end
end
