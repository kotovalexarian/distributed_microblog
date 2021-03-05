class Post < ApplicationRecord
  belongs_to :profile

  validates :text, presence: true
end
