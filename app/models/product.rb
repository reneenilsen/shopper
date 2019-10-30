class Product < ApplicationRecord
belongs_to :category
belongs_to :user
has_one_attached :image
has_many :cart_products, dependent: :destroy
has_many :carts, through: :cart_products
before_commit :add_default_img

  # check if current user is the owner of the product or the admin
  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end

  def add_default_img
    unless image.attached? 
    self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "logo.png")), filename: 'logo.png', content_type: "image/png")
    end
  end

end