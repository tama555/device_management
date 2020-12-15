class RentHistoriesController < ApplicationController
  def index
    @histories = RentHistory.all
  end
end
