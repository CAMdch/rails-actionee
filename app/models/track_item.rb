class TrackItem < ApplicationRecord
  belongs_to :company
  belongs_to :user

  def self.tracked?(favorite)
    user = User.find(favorite.user_id)
    user.track_items.to_a.any? { |tracked_company| tracked_company.company == favorite.company }
  end

  def self.track(favorite)
    user = User.find(favorite.user_id)
    user.track_items.to_a.select { |tracked_company| tracked_company.company == favorite.company }
  end

end
