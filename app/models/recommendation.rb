class Recommendation < ApplicationRecord
    belongs_to :user
    belongs_to :ramen
    validates :comments, length: { in: 10..100 }
end
