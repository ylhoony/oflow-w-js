class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :user

  # def active_employees
  #   where(active: true)
  # end

  def full_name
    "#{user.first_name} #{user.last_name}"
  end
  
end
