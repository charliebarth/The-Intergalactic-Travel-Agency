class User < ApplicationRecord
    has_secure_password
    has_many :visits
    has_many :planets, through: :visits
    validates_uniqueness_of :user_name
    
end
