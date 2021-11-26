class CreateOrders < ActiveRecord::Migration[5.2]
  def change
      create_table :orders do |t|
      t.integer "customer_id"
      t.integer "postal_code"
      t.integer "shopping_cost"
      t.integer "total_payment"
      t.integer "payment_method"
      t.integer "order_status", default: true 
      t.string "adress"
      t.string "name"
      
      t.timestamps
    end
  end
end
