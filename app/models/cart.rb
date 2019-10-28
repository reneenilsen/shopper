class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

    def add_product(product)    
      current_item = self.cart_products.where(product_id: product.id)
     ########## take 1 from the stock quantity
     ########## @products(current_item).decrement(:quantity)

      if !current_item.empty?
        current_item[0].increment(:quantity).save
      else
        current_item = Product.find(product.id)
        self.cart_products << CartProduct.new({ product: current_item, quantity: 1 })
      end
    end
    
end
