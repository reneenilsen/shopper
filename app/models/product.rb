class Product < ApplicationRecord
belongs_to :category
belongs_to :user
has_one_attached :image
has_many :cart_products, dependent: :destroy
has_many :carts, through: :cart_products
before_commit :add_default_img

validates :category, presence: true
validates :title, presence: true, length: { minimum: 5 }
validates :description, presence: true, length: { minimum: 200 }
validates :quantity, presence: true, :numericality => { :greater_than_or_equal_to => 1 }
validates :price, presence: true, :numericality => { :greater_than => 0 }

  # check if current user is the owner of the product or the admin
  def can_edit?(user)
    return user == self.user || user.has_role?(:admin)
  end

  def add_default_img
    unless image.attached? 
    self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "no-image-770x466.jpg")), filename: 'logo.png', content_type: "image/jpg")
    end
  end
end
