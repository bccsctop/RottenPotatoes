Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, "hGohyULwIfBINYvUcZMZd1lwC", "ZURlDASAdCLAD6Z9kx9e3L948qpg0IaoeyB3MDa64kmXcbFeR5"
    #ENV["API_KEY"], ENV["API_SECRET"]
end

def OmniAuth.login_path(provider)
    "/auth/#{provider}"
end