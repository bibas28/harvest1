class Store < ApplicationRecord
  belongs_to :vendor
  has_many :products
  has_many :store_reviews
  has_many :store_images, :dependent => :destroy
  has_many :store_market_relationships
  has_many :requests,:dependent => :destroy
  has_many :markets, :through => :store_market_relationships,:dependent => :destroy
  accepts_nested_attributes_for :store_images, :reject_if => lambda { |t| t['store_images'].nil? }

  validates :name, presence: true, length: {maximum: 50 }
  validates :vendor_id, presence: true
  validates :description,length: { maximum: 250 }
end
