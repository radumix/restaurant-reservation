class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.integer :num_people
      t.string :status

      t.timestamps
    end
  end
end
