class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :description, null: false
      t.boolean :disabled, default: false
      t.timestamps
    end
  end
end
