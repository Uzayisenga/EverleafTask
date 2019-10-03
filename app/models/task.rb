class Task < ApplicationRecord
    validates :name, presence: true 
    validates :content, presence: true
    validates :status, presence: true
    validates :priority, presence: true
    paginates_per 3
    belongs_to :user
    belongs_to :user, :optional => true

    
end
