class Ramen < ApplicationRecord
    belongs_to :shop
    has_many :recommendations
    has_many :users, through: :recommendations

    def ramen_with_shop
        "#{self.name} - #{Shop.find_by(id: self.shop_id).name}"
    end 

    def shop_and_location
        "#{self.name} - #{Shop.find_by(id: self.shop_id).name} - #{Shop.find_by(id: self.shop_id).location}"
    end
end
