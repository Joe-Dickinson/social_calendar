class AddOrganiserIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :organiser_id, :integer
  end
end
