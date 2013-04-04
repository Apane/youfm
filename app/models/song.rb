class Song < ActiveRecord::Base
  attr_accessible :album, :artist, :title, :titlehref, :artisthref, :albumhref, :popularity, :videohref, :duration, :year
end
