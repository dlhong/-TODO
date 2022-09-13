class AddTitleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :title, :text
  end
end
