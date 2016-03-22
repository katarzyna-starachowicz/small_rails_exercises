class CreateEventAttendings < ActiveRecord::Migration
  def change
    create_table :event_attendings do |t|
      t.integer :attended_event_id, index: true
      t.integer :attendee_id, index: true

      t.timestamps null: false
    end
  end
end
