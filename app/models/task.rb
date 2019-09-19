class Task < ApplicationRecord
    validates :name, presence: true 
    validates :content, presence: true
    validates :status, presence: true
    validates :priority, presence: true
end
