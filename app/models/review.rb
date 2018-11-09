class Review < ActiveRecord::Base
    belongs_to :product
    belongs_to :user

    def index
        @reviews = Review.all
    end

    validates_associated :product
    validates :product, presence: true
    validates :user_id, presence: true
    validates :description, presence: true
    validates :rating, inclusion: 1..5
end
