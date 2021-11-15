class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
     t.integer:genre_id
     t.string:name,　　　　null: false
     t.string:image_id,　　null: false
     t.text:ontroduction,　null: false
     t.integer:price,　　　null: false
     t.boolean:is_active,　null: false,default:true
     t.datetime:create_at, null: false
     t.datetime:update_at, null: false

     t.timestamps
    end
  end
end