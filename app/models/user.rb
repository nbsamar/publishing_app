class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:reporter, :editor, :admin]

  has_many :articles
end
