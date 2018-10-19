class Junction < ApplicationRecord
  belongs_to :project
  has_many :avenues
  has_many :sessions
end
