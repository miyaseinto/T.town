require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      [...]
    }
    [...]
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
  
  config.fog_directory  = 'taijitown2020'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/taijitown2020'
end
