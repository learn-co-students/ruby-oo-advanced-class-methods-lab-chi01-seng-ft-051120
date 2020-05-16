require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    new_song.save
    new_song
  end
 
  def self.new_by_name(name)
    named_song = self.new
    named_song.name = name
    named_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end
    


  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    end
    song
  end

  def self.alphabetical
    song_list = self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    info = filename.split(/[-.]/)
    artist = info[0].strip
    song = info[1].strip
    created_song = self.new_by_name(song)
    created_song.artist_name = artist
    created_song
  end

  def self.create_from_filename(filename)
    info = filename.split(/[-.]/)
    artist = info[0].strip
    song = info[1].strip
    created_song = self.create_by_name(song)
    created_song.artist_name = artist
    created_song
  end

  def self.destroy_all
    self.all.clear
  end




end