class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.boolean :confirmed
      t.references :user, :index => true
      t.references :reservation, :index => true

      t.timestamps null: false
    end
  end
end
