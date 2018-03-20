class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :user_id, presence: true, uniqueness: { scope: :company_id }
  validates :company_id, presence: true

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
  
end
