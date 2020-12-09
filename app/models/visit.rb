class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :planet

    validates :visit, presence: true

    scope :not_private, -> { where(private: false) } 
end
