class CategoriesController < ApplicationController
  def index 
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:alert] = "Your category has been saved"
      redirect_to categories_path
    else
      flash[:alert] = category.errors.full_messages.join('<br>')
      redirect_to categories_new_path
    end
  end

  
  private
  def category_params
    params.require(:category).permit(:category)
  end
end
