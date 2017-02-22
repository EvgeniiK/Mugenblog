class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :title, :tags, presence: true
end
