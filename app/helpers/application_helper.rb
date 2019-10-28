module ApplicationHelper
    def cart_count_over_one
        if @cart.cart_product.count > 0
          return "<span class='tag is-dark'>#{@cart.product.count}</span>".html_safe
        end
      end
    
      def cart_has_items
        return @cart.cart_products.count > 0
      end
end
