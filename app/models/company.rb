class Company < ApplicationRecord
  geocoded_by :headquarter_city
  after_validation :geocode, if: :will_save_change_to_headquarter_city?

  has_many :stocks, dependent: :destroy
  has_many :publications
  has_many :company_tags, dependent: :destroy
  has_many :recommendations
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :track_items, dependent: :destroy
  has_many :tags, through: :company_tags

  def track_item(user)
    TrackItem.find_by('user_id = ? AND company_id = ?', user.id, self)
  end

  def stock_quantity(user)
    tracks = TrackItem.where('user_id = ? AND company_id = ?', user.id, self)
    stock_quantity = 0
    tracks.each do |track|
      stock_quantity += track.stock_quantity
    end
    return stock_quantity
  end

  def gains(user)
    stock_quantity = stock_quantity(user)
    value_total = stock_quantity * StockJob.perform_now(self.symbol)[1]
    buy_value = 0
    tracks = TrackItem.where('user_id = ? AND company_id = ?', user.id, self)
    tracks.each do |track|
      buy_value += track.stock_quantity * track.value_stock
    end
    return value_total - buy_value
  end
end
