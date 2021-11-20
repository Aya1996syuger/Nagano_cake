class RemoveCreatedAtFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :create_at, :datetime
  end
end
