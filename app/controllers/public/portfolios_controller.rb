class Public::PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy]
  def new
    @portfolio = Portfolio.new
  end

def create
  @portfolio = current_user.portfolios.build(portfolio_params)
  puts portfolio_params.inspect
  if @portfolio.save
    redirect_to @portfolio, notice: 'ポートフォリオが作成されました。'
  else
    @error_messages = @portfolio.errors.full_messages # エラーメッセージを取得
    render :new
  end
end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'ポートフォリオが更新されました。'
    else
      @error_messages = @portfolio.errors.full_messages # エラーメッセージを取得
      render :edit
    end
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
    params.require(:portfolio).permit(:name, :content, :portfolio_url, :github_link, :visibility, skill_tag_ids: [])
  end
end
