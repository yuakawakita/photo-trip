class AddImageToPhotos < ActiveRecord::Migration[6.1]
  def change
    add_column :photos, :image, :string
  end
end
