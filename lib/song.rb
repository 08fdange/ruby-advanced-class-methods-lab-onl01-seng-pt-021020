class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    @@all << song
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
    
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)    
    if self.find_by_name(name)
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(file_name)
    song = self.new
    file = file_name.split(" - ")
    song.artist_name = file[0]
    song.name = file[1].chomp ".mp3"
    return song
  end
    
  def self.create_from_filename(file_name) 
    song = self.new
    file = file_name.split(" - ")
    song.artist_name = file[0]
    song.name = file[1].chomp ".mp3"
    @@all << song
    return song
  end
    
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.destroy_all
    @@all = []
  end
   
end
