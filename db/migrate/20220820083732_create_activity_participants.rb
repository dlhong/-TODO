class CreateActivityParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_participants do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
