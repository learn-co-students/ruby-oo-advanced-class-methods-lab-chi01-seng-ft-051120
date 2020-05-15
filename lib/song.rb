require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new 
    @@all << song
    song
  end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name 
    new_song
  end 

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    new_song
  end 

  def self.find_by_name(name)
    answer = self.all.find do |song|
      song.name == name 
    end 
    answer
  end 

  def self.find_or_create_by_name(name)
    answer = self.find_by_name(name)
    if answer == nil 
      new_song = self.create_by_name(name)
      return new_song
    else 
      return answer
    end 
  end 

  def self.alphabetical
    self.all.sort_by do |song| 
      song.name 
    end 
  end 

  def self.new_from_filename(filename)
    new_song_info = filename.split(/ - /)
    new_song_name = new_song_info[1].split(/.mp3/)
    song_name = new_song_name[0]
    new_song = self.new_by_name(song_name) 
    new_song.artist_name = new_song_info[0]
    new_song
  end 

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
