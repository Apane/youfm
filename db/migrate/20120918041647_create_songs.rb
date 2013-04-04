class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :titlehref
      t.string :artist
      t.string :artisthref
      t.string :album
      t.string :albumhref
      t.string :popularity
      t.string :year
      t.string :duration
      t.string :videohref
      t.string :videohref2

      t.timestamps
    end
  end
end