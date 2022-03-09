class Company < ApplicationRecord
  geocoded_by :headquarter_city
  after_validation :geocode, if: :will_save_change_to_headquarter_city?

  has_many :stocks, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :company_tags, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :track_items, dependent: :destroy
  has_many :tags, through: :company_tags

  def self.filter_tag(filter_params)
    companies = []
    filter_params.each_key do |key|
      tag_id = Tag.find_by(name: key).id
      Company.all.each do |company|
        if company.tags.any? { |tag| tag.id == tag_id}
          companies << company
        end
      end
    end
    return companies.uniq
  end

  def total_stock(user)
    total_quantity = stock_quantity(user)
    value_actual = self.currency_stock.value
    return value_actual * total_quantity
  end

  def favorite(user)
    favorite = Favorite.find_by('user_id = ? AND company_id = ?', user.id, self)
    return favorite
  end

  def stock_quantity(user)
    tracks = TrackItem.where('user_id = ? AND company_id = ?', user.id, self)
    stock_quantity = 0
    tracks.each do |track|
      stock_quantity += track.stock_quantity
    end
    return stock_quantity
  end


  def stop_loss_below?(user)
    self.gains(user) < self.favorite(user).stop_loss
  end

  def gains(user)
    stock_quantity = stock_quantity(user)
    value_total = stock_quantity * self.currency_stock.value
    buy_value = 0
    tracks = TrackItem.where('user_id = ? AND company_id = ?', user.id, self)
    tracks.each do |track|
      buy_value += track.stock_quantity * track.value_stock
    end
    return value_total - buy_value
  end

  def currency_stock
    Stock.where('company_id = ?', self.id).order('created_at DESC').first
  end

  def chart_value
    stocks = self.stocks.order('created_at DESC')
    time_stop = stocks.length < 42 ? self.stocks.order('created_at DESC').last.created_at.time : self.stocks.order('created_at DESC').first.created_at.time - 7
    i = 0
    j = 0
    month = []
    value = []

    while stocks[i].created_at.time > time_stop
      month.push((stocks[i].created_at + 3600).strftime('%H:%M'))
      i += 1
    end

    while stocks[i].created_at.time > time_stop
      value.push(stocks[j].value)
      j += 1
    end

    @chart_data = {
      labels: month.reverse,
      datasets: [{
        label: 'Stock Price',
        borderWidth: 1,
        borderColor: '#0B1E44',
        data: value.reverse
      }]
    }
  end
end
