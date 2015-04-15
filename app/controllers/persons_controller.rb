class PersonsController < ApplicationController

  def profile
    @categories = Category.all
  end

end