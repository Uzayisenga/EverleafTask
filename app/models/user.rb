class User < ApplicationRecord
  paginates_per 5
  has_many :tasks, dependent: :destroy
  has_secure_password
  has_many :users
  #has_and_belongs_to_many :tasks

  users = User.order(:names).limit(10)
  

# users.each do |user|
#   puts "#{user.tasks.names} user names #{users.names}"
# end
validates :email, uniqueness: true
def email_uniqueness
  if AlternateAddress.find_by_email(self.email)
    self.errors.add(:email, "is already in use by another account")
  end
end

end
