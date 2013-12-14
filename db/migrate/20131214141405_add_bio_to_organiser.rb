class AddBioToOrganiser < ActiveRecord::Migration
  def change
    add_column :organisers, :bio, :text
  end
end
