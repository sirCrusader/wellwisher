class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    #render text: @categories.map { |i| "#{i.name}: #{i.category_image}"}.join("<br />")

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new
    @category.assign_attributes(name: params['name'])

    if @category.save
        redirect_to :action=>"profile", :controller=>"persons"
        # format.html { redirect_to @category, notice: 'Category was successfully created.' }
        # format.json { render :show, status: :created, location: @category }
    else
        # format.html { render :new }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
    end
    #render text: params['name']
  end

  # /categories/1/edit GET
  def edit

  end

  def update

  end

  def destroy

  end
end
