class Task < ApplicationRecord
  validates :name, presence: true 
  validates :content, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  has_many :tasks
 # has_and_belongs_to_many :user
  paginates_per 1
  belongs_to :user, :optional => true
  def self.order_list(sort_order) 
      if sort_order == "created_at"
        order(created_at: :desc)
      elsif sort_order == "end_date"
        order(end_date: :desc)
      elsif sort_order == "priority"
        order(priority: :asc)
      else
        order(start_date: :desc)
      end
    end

  def self.search(term,term1,term2)
      if term
        where('name LIKE ?', "%#{term}%")
      elsif term1
        where('name LIKE ?', "%#{term1}%")
      elsif term2
        where('name LIKE ?', "%#{term2}%")
      else
        order('id desc')
      end
    end
end