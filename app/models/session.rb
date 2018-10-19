class Session < ApplicationRecord
  belongs_to :junction
  has_many :lanes_counts
end
