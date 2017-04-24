class Hint < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags

  # validates :command, :tags, :description, presence: true
end
