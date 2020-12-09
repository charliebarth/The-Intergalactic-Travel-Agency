class Visit < ApplicationRecord
    belongs_to :user
    belongs_to :planet

    validates :user_id, presence: true

    scope :not_private, -> { where(private: false) } 
end
