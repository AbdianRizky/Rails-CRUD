class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :instagram
      t.integer "user_id"
      t.timestamps
      t.index ["user_id"], name: "index_friends_on_user_id"
    end
  end
end
