class UsersController < ApplicationController
  get '/signup' do
    erb :"users/signup.html"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/signup.html"
    end
  end
end
