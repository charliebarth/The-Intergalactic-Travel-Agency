class User < ApplicationRecord
    has_secure_password
    has_many :visits
    has_many :planets, through: :visits
    validates_uniqueness_of :user_name
    validates_uniqueness_of :password_digest
end
