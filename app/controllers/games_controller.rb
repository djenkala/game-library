class GamesController < ApplicationController

  get '/games' do
    if !logged_in?
      redirect "/login"
    else
    "Here are all of the games in your library."
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
    game = current_user.games.find_by(params[:id])
    if !logged_in?
      redirect "/login"
    elsif game.user_id == current_user.id
      "Edit a game form. #{current_user.id} is editing game #{game.id}"
    else
      redirect '/games'
    end
  end
end
