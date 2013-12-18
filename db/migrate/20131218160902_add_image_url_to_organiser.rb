class AddImageUrlToOrganiser < ActiveRecord::Migration
  def change
    add_column :organisers, :image_url, :string
  end
end
