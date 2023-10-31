class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet
    has_one :profile
    validates :uid, presence: true, uniqueness: true
end
