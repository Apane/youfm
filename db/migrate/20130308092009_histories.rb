class Histories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :songid
      t.string :userid
      t.timestamps
    end
  end
end
