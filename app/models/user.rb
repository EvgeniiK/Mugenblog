class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true, uniqueness: true

  has_many :hints
  has_many :articles
  has_many :comments

  enum admin: { god: true, mortal: false }
end
