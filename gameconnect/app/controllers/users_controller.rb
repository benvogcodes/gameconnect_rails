class UsersController < ApplicationController
  def index
    if signed_in?
      @user = current_user()
      redirect_to @user
    else
      render 'index'
    end
  end

  def new
    if signed_in?
      @user = current_user()
      redirect_to "/users/#{@user.id}"
    else
      render 'new'
    end
  end

  def create
  end

  def show
    if !signed_in?

      redirect_to 'sessions#new'

    else
      @user = current_user()
      if params[:game_key]
        game = Game.find(params[:game_key])
        Favorite.create(user_id: @user.id, game_id: game.id)
        @favorite_games = Game.joins(:favorites,:users)
        render 'show'
      else
        # @favorite_games = Game.joins(:favorites,:users)
        render 'show'
      end
    end
  end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
  # def destroy
  # end
end
