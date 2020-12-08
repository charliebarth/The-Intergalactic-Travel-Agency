class Planet < ApplicationRecord
    has_many :visits
    has_many :users, through: :visits
    validates_uniqueness_of :name
end
