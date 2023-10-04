class Enduser::UsersController < ApplicationController
  def show
    @enduser = Enduser.find(params[:id])
    @favorites = @enduser.favorites
    @playlist = @enduser.playlist
    @wantlist = @enduser.wantlist
  end

  def edit
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定
  end

  def update
    @enduser = current_enduser # 現在のユーザーを取得するメソッドによって設定

    if @enduser.update(enduser_params)
    redirect_to user_url(@enduser), notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
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

  def enduser_params
  params.require(:enduser).permit(:name, :bio, :playlist, :wantlist)
  end
end
