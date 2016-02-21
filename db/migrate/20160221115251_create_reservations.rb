class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.timestamp :date
      t.integer :duration
      t.integer :user_id
      t.references :restaurant, :index => true

      t.timestamps null: false
    end
  end
end
