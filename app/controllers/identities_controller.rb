class IdentitiesController < ApplicationController

  def index
    @identitys = Identitie.all
  end

  def new
    @identity = env['omniauth.identity']
  end
end
