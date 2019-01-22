require_relative '../app/url_file_reader'

describe UrlFileReader do
  it 'returns valid image urls in an arry' do
    result = described_class.new(Dir.pwd + '/spec/resources/image_urls.txt').array_of_urls
    expected = ['http://someimage.com/images.jpg',
                'https://someimage.com/images.jpg',
                'ftp://someimage.com/images.jpg',
                'http://someimage.com/images.png']

    expect(result).to eq(expected)
  end
end