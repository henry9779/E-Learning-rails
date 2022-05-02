# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_admin

  private

  def authenticate_admin
    redirect_to root_path, alert: I18n.t(:user_not_allowed) if Current.user && Current.user.admin == false
  end
end
