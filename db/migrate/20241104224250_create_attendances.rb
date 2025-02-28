class CreateAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :stripe_customer_id

      t.timestamps
    end
    add_index :attendances, [:user_id, :event_id], unique: true #garantit qu'un utilisateur ne peut s'incrire qu'une fois au même événement
  end
end
