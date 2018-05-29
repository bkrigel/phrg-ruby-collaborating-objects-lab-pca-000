class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist = artist
  end


  def self.new_by_filename(file_name)
    parsed_file = file_name.split(" - ")
    artist_name = parsed_file[0]
    artist = Artist.find_or_create_by_name(artist_name)
    song_name = parsed_file[1]

    song = self.new(name)
    song.artist = artist
    artist.add_song(song)
    song.name = song_name
    song
  end

  def artist_name=(name)
    if artist.respond_to?(name)
      artist.name
    else
      Artist.new(name)
    end
  end

end
