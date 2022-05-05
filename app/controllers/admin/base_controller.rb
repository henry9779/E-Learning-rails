# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin

  private

  def authenticate_user
    redirect_to root_path, alert: t('user_not_allowed') if Current.user.nil?
  end

  def authenticate_admin
    redirect_to root_path, alert: t('user_not_allowed') if Current.user.admin == false
  end
end
