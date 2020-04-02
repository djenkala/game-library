class GamesController < ApplicationController

  get '/games' do
    if !logged_in?
      redirect "/login"
    else
      @games = current_user.games
      erb :"games/index.html"
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
      @game = Game.find(params[:id])
      if @game.user_id == current_user.id
      erb :"games/edit.html"
    else
      redirect '/games'
    end
    end
  end

  post '/games' do
    game = Game.new(params)
    game.user_id = current_user.id
    game.save
    redirect "/games"
  end

  get '/games/:id' do
    if !logged_in?
      redirect "/login"
    end
    @game = Game.find_by(id: params[:id])
    erb :"games/show.html"
  end

end
