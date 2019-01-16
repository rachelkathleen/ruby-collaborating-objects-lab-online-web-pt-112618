require 'pry'
class MP3Importer
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").map{|f| f.gsub("#{path}/", "")}
    binding.pry
    #Dir.entries(@path).select {|filename| filename.include?("mp3")}
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end
