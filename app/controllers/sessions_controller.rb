class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end

  post '/sessions' do
    login(params[:email], params[:password])
    redirect '/games'
  end

  get '/logout' do
    logout!
    redirect '/login'
  end

end
