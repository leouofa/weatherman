class PagesController < ApplicationController
  before_action :search_params, only: :results
  def index
  end

  def results

  end

  def search_params
    params.permit(:city)
  end
end
