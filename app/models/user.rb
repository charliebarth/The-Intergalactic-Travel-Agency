class User < ApplicationRecord
    has_many :visits
    has_many :planets, through: :visits
end
