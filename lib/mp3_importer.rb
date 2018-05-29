require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end


  def files
    mp3_files = Dir.glob("#{path}/*mp3")
    first_file_split = mp3_files.collect {|file| file.split("/")}
    second_file_split = first_file_split.collect {|file_array| file_array[-1]}
  end

  def import
    files.each {|file| Song.new_by_filename(file)}
  end

end
