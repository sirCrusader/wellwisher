class CategoriesController < ApplicationController

  before_action :find_category, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @categories = current_user.categories.all.page(params[:page]).per(10)
  end

  def show
    respond_with @category
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.create(permitted_params.category)
    if @category.save
      flash[:success] = 'Your category was successfully created'
      redirect_to persons_profile_path
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    respond_with @category
  end

  def update
    if @category.update_attributes(permitted_params.category)
      flash[:success] = 'Your category was successfully updated'
      redirect_to category_path(@category)
    else
      flash[:errors] = @category.errors.full_messages
      redirect_to action: :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = 'Your category was successfully deleted'
    redirect_to persons_profile_path
  end

  private

    def find_category
      @category = current_user.categories.find(params[:id])
    end

end
