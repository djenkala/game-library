class GamesController < ApplicationController

  get '/games' do
    redirect_if_not_logged_in
      @games = current_user.games
      erb :"games/index.html"
    end

  get '/games/new' do
    redirect_if_not_logged_in
      erb :"games/new_game.html"
    end

  get '/games/:id/edit' do
    redirect_if_not_logged_in
      @game = Game.find(params[:id])
      if @game.user_id == current_user.id
      erb :"games/edit.html"
    else
      redirect '/games'
    end
  end

  post '/games' do
    redirect_if_not_logged_in
      game = Game.new(params)
      game.user_id = current_user.id
      game.save
      redirect "/games"
  end

  get '/games/:id' do
    redirect_if_not_logged_in
      @game = Game.find_by(id: params[:id])
      erb :"games/show.html"
  end

  patch '/games/:id' do
    redirect_if_not_logged_in
      @game = Game.find(params[:id])
      if @game.user_id == current_user.id
        @game.update(params.select{|i|i=="title" || i=="genre"})
        erb :"games/show.html"
      else
        redirect "/games"
      end
  end

  delete "/games/:id" do
    redirect_if_not_logged_in
    @game = Game.find(params[:id])
    if @game.user_id == current_user.id
      @game.delete
    end
    redirect "/games"
  end

end
