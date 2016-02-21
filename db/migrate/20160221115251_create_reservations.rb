class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.timestamp :date
      t.integer :duration
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
