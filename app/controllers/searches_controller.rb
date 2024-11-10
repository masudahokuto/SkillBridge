class SearchesController < ApplicationController
  def search
    @portfolios = Portfolio.all

    if params[:query].present?
      @portfolios = @portfolios.joins(:user).where("portfolios.name LIKE ? OR users.nick_name LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    end

    render "search"
  end
end
