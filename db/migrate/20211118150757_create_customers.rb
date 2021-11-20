class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|

      t.string:last_name
      t.string:first_name
      t.string:last_name_kana
      t.string:firsr_name_kana
      t.string:email
      t.string:encrypted_password
      t.string:pstal_code
      t.string:adress
      t.string:telephone_number
      t.datetime:create_at, null: false
      t.datetime:update_at, null: false
      t.boolean:is_active,　null: false,default:true
      t.timestamps
    end
  end
end
