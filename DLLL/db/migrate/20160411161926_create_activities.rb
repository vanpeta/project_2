class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :date
      t.time :time
      t.integer :duration
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
