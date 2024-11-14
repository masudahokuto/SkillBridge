class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.favorite(@portfolio)
    redirect_to request.referer, notice: "ポートフォリオにいいねしました。"
  end

  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    favorite = current_user.favorites.find_by(portfolio_id: @portfolio.id)
    favorite&.destroy
    redirect_to request.referer, notice: "いいねを解除しました。"
  end
end
