class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:reporter, :editor, :admin]

  has_many :articles

  # def article_owner?
  #   user_id = self.id
  #   Article.find(user_id)
  # end
end
