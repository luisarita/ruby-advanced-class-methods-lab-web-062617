class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    new_song = self.new_by_name(name)
    new_song.save
    new_song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    #if found_song == nil
      found_song = self.new_by_name(name)
    #end if
    found_song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    name = parts[1].gsub(".mp3", "")
    new_song = self.create_by_name(name)
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
    new_song
  end
  
  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    song_class = self.class
    song_class.all << self
  end

end
