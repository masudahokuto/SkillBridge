class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  # いいねを作成
  def create
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.favorites.create(portfolio: @portfolio)
    redirect_to request.referer, notice: "ポートフォリオにいいねしました。"
  end

  # いいねを削除
  def destroy
    @portfolio = Portfolio.find(params[:portfolio_id])
    current_user.favorites.find_by(portfolio: @portfolio)&.destroy
    redirect_to request.referer, notice: "いいねを解除しました。"
  end
end
