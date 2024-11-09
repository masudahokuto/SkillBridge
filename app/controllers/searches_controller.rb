class SearchesController < ApplicationController
  def search
    @portfolios = if params[:query].present?
                    Portfolio.where("name LIKE ?", "%#{params[:query]}%")
                  else
                    Portfolio.all
                  end
    render "search"
  end
end
