class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :tag

      t.timestamps
    end
  end
end
