class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :organiser_id
      t.integer :interest_id

      t.timestamps
    end
  end
end
