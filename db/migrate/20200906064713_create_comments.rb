class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :post
      t.string :description
      t.timestamps
    end
  end
end
