class UsersController < ApplicationController
  get '/signup' do
    erb :"users/signup.html"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if !@user.email.blank? && !@user.password.blank? && @user.save
      session[:email] = @user.email
      redirect '/games'
    else
      erb :"users/signup.html"
    end
  end
end
