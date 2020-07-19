class CreateEventRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_registrations do |t|
      t.string :email, null: false, index: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
