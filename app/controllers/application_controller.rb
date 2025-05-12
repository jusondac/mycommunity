class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_community

  def set_current_community
    @current_community = session[:community] if session[:community].present?
  end
end
