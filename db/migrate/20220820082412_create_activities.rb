class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.text :summary
      t.string :name
      t.string :address
      t.string :contact_info
      t.integer :price

      t.timestamps
    end
  end
end
