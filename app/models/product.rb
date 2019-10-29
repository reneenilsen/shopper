class Product < ApplicationRecord
belongs_to :category
belongs_to :user
has_one_attached :image
has_many :cart_products, dependent: :destroy
has_many :carts, through: :cart_products

  # check if current user is the owner of the product or the admin
  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end
end