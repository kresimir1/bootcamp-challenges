
class Album

  def initialize(id, name, artists)
    @album_id = id
    @album_name = name
    @artists = artists
    @tracks = []

  end

  def id
    @album_id
  end
  def artists
    @artists
  end


  def title
    @album_name
  end

  def tracks
    @tracks

  end

  def duration_min
    @duration_min = []
    sum = 0
    @tracks.each do |track|
      sum += track[:duration_ms].to_f
    end
    (sum/60000).round(2)
  end


  def summary
    track_list = []
    @tracks.each do |track|
      track_list << track[:title]
    end
    tracks = track_list.join("\n -")
   "\nName: #{@album_name}\nDuration (min.): #{duration_min}\nArtist(s): #{@artists}\ntracks:\n #{tracks}"
  end
end
