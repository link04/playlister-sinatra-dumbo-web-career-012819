class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
      self.name.downcase.gsub(/[^A-Za-z]+/, '-')
    end

    def self.find_by_slug(artist_slug)
      self.all.select do |artist|
        artist.slug == artist_slug
      end.first
    end

end
