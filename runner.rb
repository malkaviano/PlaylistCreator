require_relative 'lib/playlist_creator'

# Change this!!!
media_dir = "/home/malk/Música"

Dir.glob("#{media_dir}/*").each do |entry|
  if Dir.exist? entry
    filename = "#{entry}.m3u"

    PlaylistCreator.generate_playlist_for(filename, entry, shuffle: true, override: true)
  end
end
