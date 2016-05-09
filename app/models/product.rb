class Product < ActiveRecord::Base
	mount_uploaders :images, ImageUploader
end
