class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  Order.payment_methods.key(0)
  Order.payment_methods.key(1)
  Order.payment_methods[:credit_card]
  Order.payment_methods[:transfer]
end
