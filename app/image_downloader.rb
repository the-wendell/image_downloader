require 'yaml'
require 'net/http'
require 'down'

class ImageDownloader
  CONFIG = YAML.load_file('./config/env_variables.yml')['image_config']
  DEFAULT_DESTINATION = CONFIG['default_directory']
  MAX_SIZE = CONFIG['max_size']

  def initialize(urls, destination: DEFAULT_DESTINATION)
    @urls = urls
    @destination = destination
  end

  def download!
    urls.each do |url|
      next unless remote_file_exists?(url)
      download_and_save_file(url)
    end
  end

  private

  attr_reader :urls, :destination

  def download_and_save_file(url)
    Down.download(url, max_size: MAX_SIZE)
      .yield_self { |tempfile| save_temp_file(tempfile) }
  end

  def save_temp_file(tempfile)
    File.write("#{destination}/#{tempfile.original_filename}", tempfile.read)
  end

  def remote_file_exists?(url)
    uri = URI.parse(url)
    begin
      Net::HTTP.get_response(uri).code != '404'
    rescue Errno::ECONNREFUSED
      false
    end
  end
end