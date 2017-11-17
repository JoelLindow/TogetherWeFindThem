# Google's OAuth2 docs. Make sure you are familiar with all the options
# before attempting to configure this gem.
# https://developers.google.com/accounts/docs/OAuth2Login
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    :name => "google",
    :scope => ['contacts','plus.login','plus.me','email','profile'],
    :prompt => "select_account",
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => 'offline'
  }
end
