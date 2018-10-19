class LanesCount < ApplicationRecord
  belongs_to :user
  belongs_to :session
  has_many :counting_items
end
