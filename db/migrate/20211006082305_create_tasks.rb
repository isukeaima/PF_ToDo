class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :sentence
      t.integer :category
      t.integer :good
      t.integer :time

      t.timestamps
    end
  end
end
