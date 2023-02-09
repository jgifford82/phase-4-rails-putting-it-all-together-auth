class Recipe < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :instructions, length: { minimum: 50 }
    
    # validates :instructions, presence: true, length: { minimum: 50 }
    # validates :recipe, inclusion: { in: %w(user_id title instructions minutes_to_complete) }
    # also tried valdating instructions with above inclusion
end
