class Admin::EndusersController < ApplicationController
  def index
    @users = Enduser.all
  end

  def show
    @enduser = Enduser.find(params[:id])
    @favorites = @enduser.favorites
    @playlist = @enduser.playlist
    @wantlist = @enduser.wantlist
    @calendars = @enduser.calendars
    @calendar = Calendar.new
  end

  def edit
    @enduser = Enduser.find(params[:id])
  end

  def update
    @enduser = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
        redirect_to admin_endusers_path
      else
        render :edit
      end
  end

  private
  def enduser_params
    params.require(:enduser).permit(:name, :bio, :playlist, :wantlist, :is_deleted)
  end
end
