class User < ApplicationRecord
    has_many :recommendations
    has_many :shop_reviews
    has_many :shops, through: :shop_reviews
    has_many :ramens, through: :recommendations
    has_secure_password
    
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def full_name
        "#{self.first_name} #{self.last_name}"
    end
end
