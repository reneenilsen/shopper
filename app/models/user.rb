class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  has_many :products, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_one :cart, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
