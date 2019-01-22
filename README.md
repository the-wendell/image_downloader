# Image Downloader

## Getting started

1. `bundle install`
2. specify download directory in `config/env_variables`
3. run in terminal with `irb -r ./app/main.rb`
4. `Main#download_images_from_file` takes the absoulte path of a file containing new line sperated urls and downloads the images.