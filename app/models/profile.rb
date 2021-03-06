class Profile < ApplicationRecord
  belongs_to :user

  has_many :posts

  validates :nickname, presence: true, uniqueness: true
end
