# frozen_string_literal: true

class Enduser::SessionsController < Devise::SessionsController
  before_action :authenticate_enduser!
  before_action :configure_permitted_parameters, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  def guest_sign_in
    enduser = Enduser.guest
    sign_in enduser
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
