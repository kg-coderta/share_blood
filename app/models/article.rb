class Article < ApplicationRecord
  
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :user_id, presence: true
  validates :text, presence: true
end
