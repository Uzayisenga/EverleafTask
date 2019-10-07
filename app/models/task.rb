class Task < ApplicationRecord
    validates :name, presence: true 
    validates :content, presence: true
    validates :status, presence: true
    validates :priority, presence: true
    paginates_per 3
    belongs_to :user
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

    
end
