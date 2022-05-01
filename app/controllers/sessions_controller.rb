# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: I18n.t(:login_sucessful)
    else
      flash[:alert] = I18n.t(:invalid_email_or_password)
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: I18n.t(:logout_sucessful)
  end
end
