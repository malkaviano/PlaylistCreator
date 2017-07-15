class PlaylistCreator
  def self.generate_playlist_for(filename, music_dir, shuffle: false, override: false, file_format: ".mp3")
    raise "File name is required" if filename.nil? || filename.empty?

    raise "Music dir is required" if music_dir.nil? || music_dir.empty?

    raise "File already exists" if !override && File.exist?(filename)

    musics = load_filenames(music_dir, file_format)

    musics.shuffle! if shuffle

    str = musics.join("\n")

    IO.write(filename, str)
  end

  def self.shuffle_playlist(playlist)
    musics = IO.readlines(playlist).map(&:chomp)

    musics.shuffle!

    IO.write(playlist, musics.join("\n"))
  end

  def self.load_filenames(dir, file_format)
    a = []

    Dir.glob("#{dir}/*") do |entry|
      if Dir.exist? entry
        a += load_filenames(entry, file_format)
      elsif entry.end_with?(file_format)
        a << entry
      end
    end

    a
  end

  private_class_method :load_filenames
end
