class Public::PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy]
  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio, notice: 'ポートフォリオが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @user = @portfolio.user
  end

  def index
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :content, :portfolio_url, :github_link, :visibility)
  end
end
