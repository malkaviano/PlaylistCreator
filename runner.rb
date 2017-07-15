require_relative 'lib/playlist_creator'

# Change this!!!
media_dir = "/home/malk/Vídeos"
media_format = ".mp4"
shuffle = false
override = true

Dir.glob("#{media_dir}/*").each do |entry|
  entry

  if Dir.exist? entry
    filename = "#{entry}.m3u"

    PlaylistCreator.generate_playlist_for(filename, entry, shuffle: shuffle, override: override, file_format: media_format)
  end
end
