class League < ApplicationRecord
  validates :name, :year, presence: :true
end
