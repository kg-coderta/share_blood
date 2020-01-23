class Article < ApplicationRecord
  
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :text, presence: true
end
