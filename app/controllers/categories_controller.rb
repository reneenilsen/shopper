class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authorise, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index 
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    
    if user_signed_in? && current_user.has_role?(:admin) 
    category = Category.new(category_params)
    category.user = current_user
      if category.save
        flash[:alert] = "Your category has been saved"
        redirect_to categories_path
      else
        flash[:alert] = category.errors.full_messages.join('<br>')
        redirect_to new_category_path
      end
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Product was successfully updated.'
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end
  
  private
  def set_category
    @category = Category.find(params[:id])
  end

  def authorise
    return if @category.can_edit?(current_user)

    flash[:alert] = "You are not authorised to perform that action!"
    redirect_to root_path
  end
  def category_params
    params.require(:category).permit(:category, :user_id)
  end
end
