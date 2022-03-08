class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :track_items
  has_many :favorites
  has_many :likes
  has_many :reviews
  has_many :companies, through: :favorites
  has_one_attached :photo

  def total_gains
    track_items = TrackItem.where('user_id = ?', self)
    total = 0
    track_items.each do |item|
      company = Company.find(item.company_id)
      total += company.gains(self)
    end
    return total.round
  end

  def notif2
    return self.companies.any? { |company| company.gains(self) < company.favorite(self).stop_loss }
  end
end
