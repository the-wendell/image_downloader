class UrlFileReader
  VALID_FILE_FORMATS = %w[jpg png].freeze
  VALID_URL_TYPES = %w[http https ftp].freeze

  def initialize(path)
    @path = path
  end

  def array_of_urls
    File.readlines(path).map(&:strip).select do |url|
      valid_url?(url)
    end
  end

  private

  attr_reader :path

  def valid_url?(url)
    valid_url_type?(url) && valid_file_format?(url)
  end

  def valid_url_type?(url)
    VALID_URL_TYPES.include?(url.split(':')[0])
  end

  def valid_file_format?(url)
    VALID_FILE_FORMATS.include?(url.split('.')[-1])
  end
end