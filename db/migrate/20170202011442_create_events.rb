class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :day
      t.integer :month
      t.integer :year
      t.string :venue
      t.string :title
      t.string :location
      t.string :time

      t.timestamps
    end
  end
end
