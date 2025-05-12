class HomeController < ApplicationController
  def index
   @current_community = Community.find(session[:community]) if session[:community]
  end
end
