class AddPicturesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :image, :string
  end
end
