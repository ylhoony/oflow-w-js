class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :user_id, presence: true
  validates :company_id, presence: true, uniqueness: { scope: :user_id, message: "exists as employee." }

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
  
end
