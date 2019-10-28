class AddConditionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :condition, :string
  end
end
