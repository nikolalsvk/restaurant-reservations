class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
