class AddHappeningIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :happening_id, :integer
  end
end
