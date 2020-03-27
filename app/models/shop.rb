class Shop < ApplicationRecord
    has_many :shop_reviews
    has_many :ramens
    has_many :users, through: :shop_reviews

    def shop_with_location
        "#{self.name} - #{self.location}"
    end

    def ratings
        self.shop_reviews.map {|review| review.rating}
    end 

    def avg_rating
        (self.ratings.sum.to_f / self.ratings.length).round(2)
    end 
end
