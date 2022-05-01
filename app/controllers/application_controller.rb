# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_user, :set_locale

  private

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def set_locale
    session[:locale] = params[:locale] if params[:locale] && I18n.available_locales.include?(params[:locale].to_sym)

    I18n.locale = session[:locale] || I18n.default_locale
  end
end
