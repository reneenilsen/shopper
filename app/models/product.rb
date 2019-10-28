class Product < ApplicationRecord
belongs_to :user
before_destroy :not_referenced_by_any_line_item
has_one_attached :image
has_many :cart_products
has_many :carts, through: :cart_products

  # check if current user is the owner of the product or the admin
  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end

  private

  def not_referenced_by_any_line_item
    unless cart_products.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
  end
end
