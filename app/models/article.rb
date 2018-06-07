class Article < ApplicationRecord
  validates :headline, presence: true
  validates :content, presence: true
  belongs_to :category
  belongs_to :user
  has_many :comments

  update_index('article') { self } unless Rails.env.test?
end
