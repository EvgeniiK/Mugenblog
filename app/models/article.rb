class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :favorite_articles
  has_many :favorited_by, through: :favorite_articles, source: :user

  validates :title, :tags, :content, presence: true
end
