class Article < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  enum status: [:draft, :published]
end
