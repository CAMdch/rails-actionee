class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :company

  def company_gain(user)
    @company = Company.find(self.company_id)
    return {favorite: self, gains: @company.gains(user)}
  end
end
