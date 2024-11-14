class Public::PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:edit, :update, :destroy]
  def new
    @portfolio = Portfolio.new
    @skill_tags = SkillTag.by_usage
  end

  def create
    @portfolio = current_user.portfolios.build(portfolio_params)
    if @portfolio.save
      redirect_to @portfolio, notice: 'ポートフォリオが作成されました。'
    else
      @error_messages = @portfolio.errors.full_messages # エラーメッセージを取得
      render :new
    end
  end

  def edit
    @skill_tags = SkillTag.all
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio, notice: 'ポートフォリオが更新されました。'
    else
      @error_messages = @portfolio.errors.full_messages # エラーメッセージを取得
      render :edit
    end
  end

  def toggle_visibility
    @portfolio = Portfolio.find(params[:id])

    # 次の visibility 状態に切り替え
    new_visibility = case @portfolio.visibility
                     when "is_public"
                       "is_private"
                     when "is_private"
                       "followers_only"
                     else
                       "is_public"
                     end

    if @portfolio.update(visibility: new_visibility)
      respond_to do |format|
        format.js # toggle_visibility.js.erb に対応
      end
    else
      render json: { error: @portfolio.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @user = @portfolio.user
    @qualifications = @user.qualifications
  end

  def index
    @user = current_user
    if params[:skill_tag_id].present?
      @skill_tag = SkillTag.find(params[:skill_tag_id])
      @portfolios = @skill_tag.portfolios
    else
      @portfolios = Portfolio.all
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:name, :content, :portfolio_url, :github_link, :visibility, :portfolio_image, skill_tag_ids: [])
  end
end
