class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.favorite(@portfolio)
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    favorite = current_user.favorites.find_by(portfolio_id: @portfolio.id)
    favorite&.destroy
    respond_to do |format|
      format.html { redirect_to request.refere }
      format.js
    end
  end
end
