class Enduser::UsersController < ApplicationController
  before_action :authenticate_enduser!
  def show
  @enduser = Enduser.find(params[:id])
  @favorites = @enduser.favorites
  @calendars = @enduser.calendars
  @calendar = Calendar.new

  # Wantlistの処理
  @wantlist = @enduser.wantlist
  @wantlist_parts = @wantlist.present? ? @wantlist.split("\n") : []
  @sorted_wantlist_parts = @wantlist_parts.sort
  @sorted_wantlist = @sorted_wantlist_parts.join("\n")

  # Playlistの処理
  @playlist = @enduser.playlist
  @playlist_parts = @playlist.present? ? @playlist.split("\n") : []
  @sorted_playlist_parts = @playlist_parts.sort_by do |item|
    item.tr('ぁ-ん', 'ァ-ン') # ひらがなをカタカナに変換して比較する
  end
  @sorted_playlist = @sorted_playlist_parts.join("\n")
end

  def new
    @calendar = Calendar.new
  end

  def index
    @users = Enduser.all
    @calendars = Calendar.all
  end

  def create
    Calendar.create(board_params)
    redirect_to boards_path
  end

  def edit
    is_matching_login_enduser
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定
    # @calendar = Calendar.find(params[:id])
  end

  def update
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定
    @calendar = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
      redirect_to user_url(@enduser), notice: 'プロフィールが更新されました。'
      else
        render :edit
      end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to calendars_path, notice:"削除しました"
  end

  def confirm_withdrawal
  end

  def withdrawal
  end

  def favorite
  end

  def participant
  end

  def favorite_users
    @favorite_users = current_enduser.favorites.map(&:enduser)
  end


  def is_matching_login_enduser
    enduser = Enduser.find(params[:id])
      unless enduser.id == current_enduser.id
        redirect_to posts_path
      end
  end

  private
  def board_params
    params.require(:board).permit(:title, :content, :start_time)
  end

  def enduser_params
    params.require(:enduser).permit(:name, :bio, :playlist, :wantlist, :profile_picture)
  end
end
