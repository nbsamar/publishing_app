class Article < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  enum status: [:draft, :published]

  def author
    author = User.find(user_id)
    (author.first_name + ' ' + author.last_name).titleize
  end
end
