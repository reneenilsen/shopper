class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorise, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(product_params[:image])

    # add the current user to the product they have created
    @product.user = current_user
    
    if user_signed_in? && current_user.has_role?(:admin) 
      @product.condition = "New"
    elsif
      @product.condition = "Pre-owned"
    end

      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        flash[:alert] = @product.errors.full_messages.join('<br>')
        redirect_to new_product_path
      end
  end

  def update
      if @product.update(product_params)
        @product.image.attach(product_params[:image]) if product_params[:image] 
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        flash[:alert] = @product.errors.full_messages.join('<br>')
        redirect_to @product 
      end
  end

  def destroy
    @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def search
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Product.all.where("lower(title) LIKE :search", search: "%#{@parameter}%") 
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def authorise
      return if @product.can_edit?(current_user)
  
      flash[:alert] = "You are not authorised to perform that action!"
      redirect_to root_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image, :quantity, :condition, :user_id, :category_id)
    end
end
