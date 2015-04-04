class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    render text: @categories.map { |i| "#{i.name}: #{i.category_image}"}.join("<br />")
  end
end
