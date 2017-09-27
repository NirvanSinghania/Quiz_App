class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
      render html: "This is my home page"
  end
  def authorize
      redirect_to root_path unless current_user and current_user.isadmin?
    end

  include SessionsHelper


end
