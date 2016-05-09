class AddFileExtensionToProduct < ActiveRecord::Migration
  def up
  	add_column :products, :file_extension, :string
  end

  def down
  	remove_column :products, :file_extension, :string
  end
end
