class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :title
      t.string :description
      t.references :menu, :index => true

      t.timestamps null: false
    end
  end
end
