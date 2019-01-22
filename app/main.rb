require_relative 'image_downloader'
require_relative 'url_file_reader'

class Main
  def self.download_images_from_file(path)
    UrlFileReader.new(path).array_of_urls
      .yield_self { |urls| ImageDownloader.new(urls).download! }
  end
end