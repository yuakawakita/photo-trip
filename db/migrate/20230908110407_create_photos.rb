class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.string :address
      t.string :season

      t.timestamps
    end
  end
end
