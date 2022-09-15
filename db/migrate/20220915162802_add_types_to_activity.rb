class AddTypesToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :types, :string
  end
end
