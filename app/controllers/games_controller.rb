class GamesController < ApplicationController

  get '/games' do
    if !logged_in?
      redirect "/login"
    else
      @games = Games.all
      erb :"games/library.html"
    end
  end

  get '/games/new' do
    if !logged_in?
      redirect "/login"
    else
      erb :"games/new_game.html"
    end
  end

  get '/games/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      game = current_user.games.find_by(params[:id])
      if game.user_id == current_user.id
      erb :"games/edit.html"
    else
      redirect '/games'
    end
    end
  end

  post '/games' do
    Games.create(params)
    redirect "/games"
  end
end
