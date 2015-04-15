class WishesController < ApplicationController

  before_action :find_wish, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @wishes = current_user.wishes.all.page(params[:page]).per(10)
  end

  def new
    @wish = current_user.wishes.build
    @categories = current_user.categories.all
    respond_with @wish
  end

  def create
    @wish = current_user.wishes.create(permitted_params.wish)
    if @wish.save
      flash[:success] = 'Your wish was successfully created'
      redirect_to @wish
    else
      flash[:errors] = @wish.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    @categories = current_user.categories.all
    respond_with @wish
  end

  def update
    if @wish.update_attributes(permitted_params.wish)
      flash[:success] = 'Your wish was successfully updated'
      redirect_to wish_path(@wish)
    else
      flash[:errors] = @wish.errors.full_messages
      redirect_to action: :edit
    end
  end

  def destroy
    @wish.destroy
    flash[:success] = 'Your wish was successfully deleted'
    redirect_to persons_profile_path
  end

  private

    def find_wish
      @wish = current_user.wishes.find(params[:id])
    end

end
