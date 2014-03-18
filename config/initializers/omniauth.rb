require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'noj6973ZqL246zG4GKnA', 'eZLyzGfxRf2Rer6Kq19Y9d6zaimNQ3pHGAo7GPDoWc'
  provider :facebook, '283037115045480', '7ce264be5edd9673771313ebe87ac5e9', {:client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}}
  provider :open_id, :store => OpenID::Store::Filesystem.new('/tmp'), :require => 'omniauth-openid'
end