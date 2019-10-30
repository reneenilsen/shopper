class Category < ApplicationRecord
belongs_to :user
has_many :products

    def can_edit?(user)
        return user == self.user || user.has_role?(:admin)
    end
end
