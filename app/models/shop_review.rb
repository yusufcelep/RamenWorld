class ShopReview < ApplicationRecord
    belongs_to :user
    belongs_to :shop
    validates :shop_id, uniqueness: { scope: :user_id, message: "has already been reviewed!" }
    validates :rating, inclusion: { in: 1..5, message: "has to be between 1 and 5." }
    validates :review, length: { in: 10..100 }
end
