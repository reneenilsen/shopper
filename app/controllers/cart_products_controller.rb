class CartProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart_product, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create]

  def index
    @cart_products = CartProduct.all
  end

  def show
  end

  def new
    @cart_product = CartProduct.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @cart_product = @cart.add_product(product)

      if @cart.save
        redirect_to @cart, notice: 'Item added to cart.'
      else
        render json: @cart.errors, status: :unprocessable_entity
      end
  end

  def update
      if @cart_product.update(cart_product_params)
        redirect_to @cart_product, notice: 'Product cart was successfully updated.'
      else
        render json: @cart_product.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @cart = Cart.find(current_user.cart.id)
    @cart_product.destroy

    redirect_to products_path, notice: ' Product was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end

    def set_cart
      if !current_user.cart
        current_user.cart = Cart.new
      end
      @cart = current_user.cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_product_params
      params.require(:cart_product).permit(:product_id)
    end
end
