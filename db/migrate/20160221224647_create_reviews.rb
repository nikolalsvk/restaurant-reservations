class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.float :rating
      t.references :user, :index => true
      t.references :restaurant, :index => true
      t.references :invitation, :index => true
      t.references :reservation, :index => true

      t.timestamps null: false
    end
  end
end
