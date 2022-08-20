class CreateActivityTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_types do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
