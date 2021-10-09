class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :sentence
      t.integer :category
      t.integer :good, default: 0
      t.time :time

      t.timestamps
    end
  end
end
