#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include TransportationsHelper
  #include SimpleCaptcha::ControllerHelpers
  # before_filter :authenticate
  # before_filter :show_message
  before_action :require_login
  #rescue_from Exception, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from ActionController::UnknownController, with: :render_404

  def show_message
    if current_user
      usr_msgs = UserMsg.for_user(current_user)
      usr_msgs.each do |usr_msg|
        flash[:info] = usr_msg.message.content
        usr_msg.active = false
        usr_msg.save!
      end
    end
  end

  private

  def not_authenticated
    redirect_to signin_path, :alert => t("session.must_logged")
  end

  def access_denied(exception)
    redirect_to signin_path, alert: exception.message
  end
  
  def authenticate
    unless signed_in?
      flash[:error] = "Для доступа к этому разделу сперва авторизируйтесь!!!"
      redirect_to signin_path
    end
  end

  def render_404(exception)
    #@not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/error_404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
