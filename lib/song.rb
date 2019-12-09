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
    song = self.new
    self.all << song
    return song
  end
  
  def self.new_by_name(title)
    song= self.new
    song.name = title
    return song
  end
  
  def self.create_by_name(title) #class constructor
    song = self.create
    song.name = title
    return song
  end
  
  def self.find_by_name(title) #class finder
    result = self.all.detect {|song| song.name == title}
    return result #result because you don't want to change or create, only find. Use your brain.
  end
  
  def self.find_or_create_by_name(title) #Just run above prompts.
    result = self.find_by_name(title)
    if result
      return result
    else
      self.create_by_name(title)
    end
  end
  
  def self.alphabetical
    sorted = self.all.sort_by {|song| song.name}
    return sorted
  end

end
