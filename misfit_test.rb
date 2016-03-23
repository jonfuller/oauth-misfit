class MisfitTest < Sinatra::Base
  use Rack::Session::Cookie, secret: 'supersecret', expire_after: 30 * (60*60*24) # 30 days in seconds
  use OmniAuth::Builder do
    provider :shine, ENV['MISFIT_APP_KEY'], ENV['MISFIT_APP_SECRET']
    provider :misfit, ENV['MISFIT_APP_KEY'], ENV['MISFIT_APP_SECRET']
  end

  get '/' do
    <<-html
<html>
  <head>
    <title>Misfit Test App</title>
  </head>
  <body>
    <a href="/auth/shine">Connect using omniauth-shine</a>
    <a href="/auth/misfit">Connect using omniauth-misfit</a>
  </body>
</html>
    html
  end

  # Exercises the 'omniauth-misfit' gem (see https://github.com/jjudge/omniauth-misfit)
  get '/auth/misfit/callback' do
    auth = OpenStruct.new request.env['omniauth.auth']

    p auth
    
    return auth.to_s
  end

  # Exercises the 'omniauth-shine' gem (see Gemfile)
  get '/auth/shine/callback' do
    auth = OpenStruct.new request.env['omniauth.auth']

    p auth
    
    return auth.to_s
  end
end

