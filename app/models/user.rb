class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password

  users = User.order(:names).limit(10)

users.each do |user|
  puts "#{user.tasks.names} user name #{users.names}"
end
end
