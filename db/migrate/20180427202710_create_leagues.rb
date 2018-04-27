class CreateLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :year
      t.integer :champion

      t.timestamps
    end
  end
end
