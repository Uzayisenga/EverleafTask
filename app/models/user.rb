class User < ApplicationRecord
  paginates_per 5
  has_many :tasks, dependent: :destroy
  has_secure_password

  users = User.order(:names).limit(10)
  

# users.each do |user|
#   puts "#{user.tasks.names} user names #{users.names}"
# end
validates :email, uniqueness: true

end
