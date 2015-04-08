class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    render text: @categories.map { |i| "#{i.name}: #{i.category_image}"}.join("<br />")
  end

  def new

  end

  def create

  end

  # /categories/1/edit GET
  def edit

  end

  def update

  end

  def destroy

  end
end
