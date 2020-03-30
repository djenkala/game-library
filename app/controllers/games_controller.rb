class GamesController < ApplicationController

  get '/games' do
    if !logged_in?
    "Here are all of the games in your library."
  end

  get '/games/new' do
    if !logged_in?
      redirect "/login"
    else
      "A new game form"
    end
  end

  get '/games/:id/edit' do
    if !logged_in?
      redirect "/login"
    else
      game = current_user.games.find_by(params[:id])
      if game.user_id == current_user.id
      "Edit a game form. #{current_user.id} is editing game #{game.id}"
    else
      redirect '/games'
    end
  end
end
