class CreatePlaylistjoins < ActiveRecord::Migration
  def change
    create_table :playlistjoins do |t|
      t.string :playlistid
      t.string :songid
      t.string :userid
      t.timestamps
    end
  end
end
