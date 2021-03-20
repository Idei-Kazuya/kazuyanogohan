class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  has_one_attached :image
  belongs_to_active_hash :recipe_type
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags, dependent: :destroy

  has_many :favorites, dependent: :destroy
  def favorite_by?(user)
    favorites.where(user_id: user).exists?
  end
  
  has_many :cooked_records, dependent: :destroy
  def cooked_record_by?(user)
    cooked_records.where(user_id: user.id).exists?
  end

  has_one_attached :image

end
