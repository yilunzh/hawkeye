class AddDisplayWidthAndHeightToProduct < ActiveRecord::Migration
  def up
  	add_column :products, :display_height, :integer
  	add_column :products, :display_width, :integer
  end

  def down
  	remove_column :products, :display_height, :integer
  	remove_column :products, :display_width, :integer
  end
end
