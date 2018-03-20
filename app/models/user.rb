class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :employees
  has_many :companies, through: :employees

  def current_company=(company)
    self.update(current_company_id: company.id)
  end

  def current_company
    Company.find(self.current_company_id) unless current_company_id.nil?
  end

end
