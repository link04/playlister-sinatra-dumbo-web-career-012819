class Song < ActiveRecord::Base
 has_many :song_genres
 has_many :genres, through: :song_genres
 belongs_to :artist

 def slug
   self.name.downcase.gsub(/[^A-Za-z]+/, '-')
 end

 def self.find_by_slug(song_slug)
   self.all.select do |song|
     song.slug == song_slug
   end.first
 end

end
