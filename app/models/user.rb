class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 15 }     
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i        
  validates :email, presence: true, uniqueness: true, format:{ with: VALID_EMAIL } 
  validates :password, presence: true, length: { in: 6..128 }

  
  has_many :articles
  has_many :comments
end
