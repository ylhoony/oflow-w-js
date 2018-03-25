class InventoriesController < ApplicationController
  before_action :require_signed_in?

  helper_method :params

  def index
    # binding.pry
    @inventories = current_company.inventories.all
  end
end
