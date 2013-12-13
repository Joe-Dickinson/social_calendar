class AddMemberIdToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :member_id, :integer
  end
end
