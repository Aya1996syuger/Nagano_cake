class RemoveCreatedAtFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :create_at, :datetime
  end
end
