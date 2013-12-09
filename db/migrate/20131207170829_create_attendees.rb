class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
