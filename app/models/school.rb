class School < ApplicationRecord
  belongs_to :city

  validates :name, presence: true
end
