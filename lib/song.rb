class Song
  attr_accessor :name, :artist_name
  @@all = []

  # Custom constructors
  def self.create
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  # Finder and constructor methods
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.all.any? {|song| song.name == name}
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  # Alphabetical sort of all songs created and saved
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  # Custom constructors from file name
  def self.new_from_filename(filename)
    array = filename.split(/[-.]+/)
    new_song = self.new_by_name(array[1].strip)
    new_song.artist_name = array[0].strip
    new_song
  end

  def self.create_from_filename(filename)
    array = filename.split(/[-.]+/)
    new_song = self.create_by_name(array[1].strip)
    new_song.artist_name = array[0].strip
    new_song
  end

  # Clear all song instances from @@all array
  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
