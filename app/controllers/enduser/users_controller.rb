class Enduser::UsersController < ApplicationController
  def show
    @enduser = Enduser.find(params[:id])
    @favorites = @enduser.favorites
    @playlist = @enduser.playlist
    @wantlist = @enduser.wantlist
    @calendars = current_enduser.calendars
    @calendar = Calendar.new
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
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定
    @calendar = Calendar.find(params[:id])
  end

  def update
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定
    @calendar = Calendar.find(params[:id])
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

  private
  def board_params
    params.require(:board).permit(:title, :content, :start_time)
  end

  def enduser_params
    params.require(:enduser).permit(:name, :bio, :playlist, :wantlist, :profile_picture)
  end
end
