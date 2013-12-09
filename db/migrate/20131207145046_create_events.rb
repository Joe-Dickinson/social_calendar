class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :image_url

      t.timestamps
    end
  end
end
