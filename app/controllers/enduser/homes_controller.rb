class Enduser::HomesController < ApplicationController
  def top
    @hide_header = true
    render :layout => 'application_top'
  end
  def about
    render :layout => 'application_about'
  end
end
