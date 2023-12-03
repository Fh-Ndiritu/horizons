Rails.application.config.middleware.use OmniAuth::Builder do 
    provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'], scope: 'email,public_profile'
    provider :google_oauth2, ENV['G_APP_ID'], ENV['G_APP_SECRET']
end