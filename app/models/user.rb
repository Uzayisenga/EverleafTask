class User < ApplicationRecord
    validates :names, presence: true 
    validates :email, presence: true 
    validates :password, presence: true 
    validates :user_type, presence: true 
end
