class OrdersController < ApplicationController
  before_filter :authenticate_user!, except => [:show, :index]

  def index;
  end

  def show;
  end

  def create;
  end
end