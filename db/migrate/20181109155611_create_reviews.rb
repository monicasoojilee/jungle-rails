class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product_id, index: true, foreign_key: true
      t.references :user_id, index: true, foreign_key: true
      t.text :description
      t.integer :rating
      
      t.timestamps null: false
    end
  end
end
