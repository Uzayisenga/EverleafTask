class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.string :status
      t.string :priority
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
