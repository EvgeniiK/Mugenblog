
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :content, :article_id, presence: true
end
