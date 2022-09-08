class AddImageToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :image, :string
  end
end
