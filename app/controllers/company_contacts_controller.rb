class CompanyContactsController < ApplicationController
  before_action :require_signed_in?
  before_action :set_company_contact, only: [:show, :edit, :update, :destroy]

  def index
    @company_contacts = current_company.company_contacts.all
  end

  def new
    @company_contact = CompanyContact.new
  end

  def create
    @company_contact = CompanyContact.new(company_contact_params)
    if @company_contact.save
      redirect_to company_contacts_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @company_contact.update(company_contact_params)
      redirect_to company_contacts_path
    else
      render :new
    end
  end

  def destroy
    @company_contact.delete
    redirect_to company_contacts_path
  end

  private

    def set_company_contact
      @company_contact = CompanyContact.find(params[:id])
    end

    def company_contact_params
      params.require(:company_contact).permit(
        :company_id,
        :name,
        :attention,
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :country_id,
        :postal_code,
        :phone,
        :email,
        :fax,
        :active)
    end

end
