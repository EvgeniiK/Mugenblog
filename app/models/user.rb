class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true, uniqueness: true

  has_many :hint
  has_many :articles
  has_many :favorite_articles
  has_many :favorites, through: :favorite_articles, source: :article

  enum admin: { god: true, mortal: false }

end
