class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'landing'
  def index;
  end
end
