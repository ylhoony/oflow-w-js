class UnitOfMeasuresController < ApplicationController
  before_action :require_signed_in?
  before_action :set_unit_of_measure, only: [:edit, :update]

  def index
    @unit_of_measures = current_company.unit_of_measures.all
  end

  def new
    @unit_of_measure = UnitOfMeasure.new
  end

  def create
    @unit_of_measure = UnitOfMeasure.new(unit_of_measure_params)
    if @unit_of_measure.save
      redirect_to unit_of_measures_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @unit_of_measure.update(unit_of_measure_params)
      redirect_to unit_of_measures_path
    else
      render :new
    end
  end

  def switch
    unit_of_measure = UnitOfMeasure.find(params[:id])
    unit_of_measure.active? ? unit_of_measure.update(active: false) : unit_of_measure.update(active: true)
    redirect_to unit_of_measures_path, notice: "Status is updated successfully."
  end

  private

    def set_unit_of_measure
      @unit_of_measure = UnitOfMeasure.find(params[:id])
    end

    def unit_of_measure_params
      params.require(:unit_of_measure).permit(:name, :company_id, :active)
    end



end
