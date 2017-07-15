require 'playlist_creator'

describe PlaylistCreator do
  let(:dir) { File.dirname(__FILE__) + "/dummies/" }
  let(:music_dir) { dir + "musics" }
  let(:filename) { dir + "myplaylist.m3u" }

  after { File.delete filename if File.exists? dir + "myplaylist.m3u" }

  describe "::generate_playlist_for" do
    context "When a file already exists with the same name" do
      let(:filename) { dir + "dummy.m3u" }

      it "raises an error" do
        expect { PlaylistCreator.generate_playlist_for(filename, music_dir) }.to raise_error RuntimeError, "File already exists"
      end
    end

    context "When the filename is not specified" do
      let(:filename) { "" }

      it "raises an error" do
        expect { PlaylistCreator.generate_playlist_for(filename, music_dir) }.to raise_error RuntimeError, "File name is required"
      end
    end

    context "When the music_dir is not specified" do
      let(:music_dir) { nil }

      it "raises an error" do
        expect { PlaylistCreator.generate_playlist_for(filename, music_dir) }.to raise_error RuntimeError, "Music dir is required"
      end
    end

    it "creates the file" do
      PlaylistCreator.generate_playlist_for(filename, music_dir)

      expect(File.exists? filename).to be true

      a = File.readlines filename

      music_dir = dir + "musics/"

      expect(a.map(&:chomp)).to match_array [
        music_dir + "music1.mp3",
        music_dir + "1/1-music1.mp3",
        music_dir + "2/2-music1.mp3",
        music_dir + "2/2_1/2_1-music1.mp3",
        music_dir + "2/2_1/2_1-music2.mp3"
      ]
    end
  end

end
