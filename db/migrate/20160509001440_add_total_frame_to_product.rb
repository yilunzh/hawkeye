class AddTotalFrameToProduct < ActiveRecord::Migration
  def up
  	add_column :products, :total_frames, :integer
  end

  def down
  	remove_column :products, :total_frames, :integer
  end
end
