class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :organiser_id
      t.integer :rank
      t.integer :event_id

      t.timestamps
    end
  end
end
