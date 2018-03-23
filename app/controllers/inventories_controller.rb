class InventoriesController < ApplicationController
  before_action :require_signed_in?

  def index
    @inventories = current_company.inventories.all
  end
end
