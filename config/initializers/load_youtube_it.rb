require 'ostruct'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
raw_config = File.read(::Rails.root.to_s + "/config/youtube_it.yml")
YouTubeITConfig =  OpenStruct.new(YAML.load(raw_config)[Rails.env])

