class Patient < ApplicationRecord
  has_one_attached :photo

  validates :name, presence: true
  validates :phone_numbers, presence: true

end
