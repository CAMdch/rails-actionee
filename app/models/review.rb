class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :content, presence: true, length: {minimum: 10}
end
