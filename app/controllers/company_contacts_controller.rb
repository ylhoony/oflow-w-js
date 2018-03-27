class CompanyContactsController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
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

    def require_valid_access?
      redirect_to company_contacts_path unless current_company.company_contact_ids.include?(params[:id].to_i)
    end

    def set_company_contact
      @company_contact = CompanyContact.find(params[:id])
    end

    def company_contact_params
      params.require(:company_contact).permit(
        :company_id,
        :first_name,
        :last_name,
        :email,
        :phone,
        :comment,
        :active)
    end

end
