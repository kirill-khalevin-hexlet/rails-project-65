Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'], scope: 'user',
  client_options: {
    site: 'https://github.com/api/v3',
    authorize_url: 'https://github.com/login/oauth/authorize',
    token_url: 'https://github.com/login/oauth/access_token'
  }
end
#Rails.application.config.middleware.insert_before 'RescueFromInvalidAuthenticityToken', OmniAuth::Builder
