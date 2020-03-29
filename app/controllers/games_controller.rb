class GamesController < ApplicationController

  get '/games' do
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
      "Edit a game form"
    end
  end

end
