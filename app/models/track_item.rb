class TrackItem < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_many :alerts

  validates :stock_quantity, presence: true
  validates :value_stock, presence: true

  def self.tracked?(favorite)
    user = User.find(favorite.user_id)
    user.track_items.to_a.any? { |tracked_company| tracked_company.company == favorite.company }
  end

  def self.track(favorite)
    user = User.find(favorite.user_id)
    user.track_items.to_a.select { |tracked_company| tracked_company.company_id == favorite.company_id }
  end

  def self.notif(user)
    need_notif = []
    user.track_items.each do |track_item|
      need_notif << (!track_item.alert_dismissed && track_item.company.stop_loss_below?(user))
    end
    return need_notif.any? { |notif| notif == true}
  end
end
