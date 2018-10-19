class User < ApplicationRecord
  belongs_to :organization
  has_many :projects
  has_many :lanes_counts
end
