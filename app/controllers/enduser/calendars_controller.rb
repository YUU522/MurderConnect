class Enduser::CalendarsController < ApplicationController
  
  before_action :user
  def index
    @calendars = current_user.calendars
  end

  def show
    @calendar = current_enduser.calendars.find(params[:id])
  end

  def new
    @calendars = current_enduser.calendars
  end

  def edit
    @calendar = current_user.calendars.find(params[:id])
  end

  def update
    @calendar = current_enduser.calendars.find(params[:id])
    @calendar.update(update_params)
    redirect_to calendar_path(@user.id)
  end

  def create
    @calendar = current_enduser.calendars.new(calendar_memo)
    if @calendar.save
      redirect_to user_path(@user.id)
    else
      redirect_to new_calendar_path
    end
  end

  def destroy
    @calendars = current_enduser.calendars.find(params[:id])
    @calendars.destroy
    redirect_to calendars_path(@user.id)
  end


  private
  def calendar_memo
    params.require(:calendar).permit(:start_time,:title, :content)
  end

  def user
    @user = Enduser.find(params[:id])
  end

  def update_params
    params.require(:calendar).permit(:start_time,:title, :content,:user_id)
  end
end


