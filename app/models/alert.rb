class Alert < ApplicationRecord
  belongs_to :track_items, dependent: :destroy
end
