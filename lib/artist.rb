class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def self.find_or_create_by_name(name)
    included_artists = []
    @@all.each do |artist|
      if artist.name == name
        included_artists << artist
      end
    end
    if included_artists.count == 0
       included_artists << Artist.new(name)
    end
    included_artists[0].save
    included_artists[0]
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
