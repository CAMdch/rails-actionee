class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :likes, dependent: :destroy
  validates :content, presence: true

  def like?(user)
    return true if Like.find_by(user: user, review: self)

    return false
  end

  def like_status(user)
    return true if Like.find_by('review_id = ? AND enjoyed = true AND user_id = ?', self, user)

    return false
  end
end
