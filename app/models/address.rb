class Address < ApplicationRecord
  validates :value, presence: true
end
