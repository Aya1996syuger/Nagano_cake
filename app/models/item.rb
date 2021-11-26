class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  Item.count
  

end
