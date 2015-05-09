class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false, default: ""
      t.string :body, null: false, default: ""

      t.timestamps null: false
    end
  end
end
